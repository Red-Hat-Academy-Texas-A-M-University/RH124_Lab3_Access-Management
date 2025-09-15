#!/bin/bash
set -e

BASE=~/files
LOGS="$BASE/logs"
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

pass() { echo -e "${GREEN}[PASSED]${RESET} $1"; }
fail() { echo -e "${RED}[FAILED]${RESET} $1"; }

# --- 1. All non-critical files should be in logs ---
EXPECTED_FILES=("server.conf" "deploy.sh" "dev_notes.txt" "uptime.log" "build.log" \
                "README" "tmp.txt" "empty.sh" "placeholder1" "placeholder2" "empty1" "empty2")

all_in_logs=true
for f in "${EXPECTED_FILES[@]}"; do
  if [[ -f "$LOGS/$f" ]]; then
    pass "$f found in logs"
  else
    fail "$f not found in logs"
    all_in_logs=false
  fi
done

# --- 2. Critical file should remain outside logs ---
if [[ -f "$BASE/!critical-security.log" ]]; then
  pass "!critical-security.log is still in place"
else
  fail "!critical-security.log is missing or moved"
fi

# --- 3. Symlink exists and points to a file inside logs ---
if [[ -L "$BASE/dev_link" ]]; then
  target="$(readlink -f "$BASE/dev_link")"
  if [[ "$target" == "$LOGS/"* && -f "$target" ]]; then
    pass "dev_link points to a valid file in logs"
  else
    fail "dev_link does not point into logs"
  fi
else
  fail "dev_link is missing or not a symlink"
fi

# --- 4. No leftover empty directories ---
leftover_dirs=$(find "$BASE" -mindepth 1 -type d -empty)
if [[ -z "$leftover_dirs" ]]; then
  pass "No empty directories remain"
else
  fail "Empty directories still exist:"
  echo "$leftover_dirs"
fi

# --- 5. size.txt exists and has correct total ---
if [[ -f "$BASE/size.txt" ]]; then
  actual_size=$(du -cb "$LOGS"/* | tail -n1 | awk '{print $1}')
  recorded_size=$(cat "$BASE/size.txt" | tr -d '[:space:]')
  if [[ "$actual_size" == "$recorded_size" ]]; then
    pass "size.txt contains correct cumulative size ($actual_size bytes)"
  else
    fail "size.txt size is incorrect (expected $actual_size, found $recorded_size)"
  fi
else
  fail "size.txt is missing"
fi

