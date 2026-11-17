#!/usr/bin/env bash
# Script updated to collect inputs upfront for fully unattended compilation and auto-mining.

set -o errexit
set -o nounset
set -o pipefail

# Determine if we need sudo (empty if running as root)
if [ "$EUID" -eq 0 ]; then
  SUDO=""
else
  SUDO="sudo"
fi

HOME_DIR="${HOME:-/root}"

XM_DIR="$HOME_DIR/xmrig"
SRC_DIR="$XM_DIR/xmrig-src"
BUILD_DIR="$SRC_DIR/build"

BUILT_BIN="$BUILD_DIR/xmrig"

DEFAULT_POOL="mine.c3pool.com:13333"
DONATION_WALLET="46m4SDFpigNZBLVUTWDhAjaMQFAMtwJkZTz4Gmy4rnhU733fwqzSDK4CeDbpFWW5ZCipJSwoTscMxHE6Wufy9odmMrVgPEC"

cd "$HOME_DIR"
clear

# ============================================
# 1. Detect existing compiled binary
# ============================================

reuse_existing=false
if [ -x "$BUILT_BIN" ]; then
  echo "Existing compiled xmrig build detected."
  echo ""
  read -r -p "Use existing compiled version instead of recompiling? (y/n): " reuse_answer

  if [[ "${reuse_answer,,}" == "y" || "${reuse_answer,,}" == "yes" ]]; then
    reuse_existing=true
  fi
fi

# ============================================
# 2. Collect Configuration Upfront (Before Compiling)
# ============================================

echo ""
read -r -p "Do you want to donate to me? (y/n): " donate_answer

if [[ "${donate_answer,,}" == "y" || "${donate_answer,,}" == "yes" ]]; then
  echo "Thank you so much!"
  read -r -p "Enter worker name (example: Laptop01): " worker_name
  pool="$DEFAULT_POOL"

  if [ -n "$worker_name" ]; then
    wallet="${DONATION_WALLET}.${worker_name}"
  else
    wallet="$DONATION_WALLET"
  fi
else
  echo ""
  echo "Setting up your custom pool and wallet..."
  read -r -p "What's the pool address and port? (example: pool.example:3333): " pool
  read -r -p "What is your wallet address?: " base_wallet
  read -r -p "Enter worker name (example: Rig01): " worker_name

  if [ -n "$worker_name" ]; then
    wallet="${base_wallet}.${worker_name}"
  else
    wallet="${base_wallet}"
  fi
fi

echo ""
echo "Configuration complete! Starting automated process..."
sleep 2

# ============================================
# 3. Build from source if needed (Unattended)
# ============================================

if ! $reuse_existing; then
  echo ""
  echo "Building xmrig from source..."

  echo ""
  echo "(1/7) Installing build dependencies..."
  $SUDO apt update >/dev/null 2>&1 || true
  $SUDO apt install -y \
    git \
    build-essential \
    cmake \
    automake \
    libtool \
    autoconf \
    libuv1-dev \
    libssl-dev \
    libhwloc-dev >/dev/null 2>&1

  echo ""
  echo "(2/7) Preparing source directory..."
  rm -rf "$XM_DIR"
  mkdir -p "$XM_DIR"
  cd "$XM_DIR"

  echo ""
  echo "(3/7) Cloning xmrig source..."
  git clone https://github.com/xmrig/xmrig.git xmrig-src >/dev/null 2>&1 || {
    echo "Git clone failed."
    exit 1
  }

  cd "$SRC_DIR"

  echo ""
  echo "(4/7) Configuring build with native CPU optimizations..."
  mkdir -p build
  cd build

  export CFLAGS="-O3 -march=native"
  export CXXFLAGS="-O3 -march=native"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_HWLOC=ON >/dev/null 2>&1 || {
    echo "CMake configuration failed."
    exit 1
  }

  echo ""
  echo "(5/7) Enabling MSR support..."
  set +e
  $SUDO apt install -y kmod linux-cpupower >/dev/null 2>&1
  $SUDO modprobe msr >/dev/null 2>&1
  $SUDO chmod o+w /dev/cpu/*/msr >/dev/null 2>&1

  echo ""
  echo "(6/7) Setting up performance mode..."
  $SUDO cpupower frequency-set -g performance >/dev/null 2>&1
  set -e

  echo ""
  echo "(7/7) Compiling xmrig (native optimized, 75% core cap)..."
  # Removed the 'read' prompt here so it compiles automatically!
  make -j"$(( ($(nproc) * 3) / 4 > 0 ? ($(nproc) * 3) / 4 : 1 ))" || {
    echo "Compilation failed."
    exit 1
  }
fi

# ============================================
# 4. Verify binary exists
# ============================================

if [ ! -x "$BUILT_BIN" ]; then
  echo "Compiled binary not found at:"
  echo "$BUILT_BIN"
  exit 1
fi

# ============================================
# 5. Start xmrig Automatically
# ============================================

echo ""
echo "Starting xmrig automatically..."
clear
$SUDO "$BUILT_BIN" \
  -a rx/0 \
  --randomx-1gb-pages \
  --huge-pages \
  -o "$pool" \
  -u "$wallet" \
  -p x