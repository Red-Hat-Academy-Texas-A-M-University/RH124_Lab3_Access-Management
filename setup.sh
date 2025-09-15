#!/bin/bash
set -e

BASE=~/files
ORANGE="\033[38;5;208m"
RESET="\033[0m"

mkdir -p "$BASE"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/"
rm -rf "$BASE"/*
echo -e "${ORANGE}[SETUP]${RESET} Deleted all files in $BASE/"

# --- Directories ---
mkdir -p "$BASE/logs"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/logs"

mkdir -p "$BASE/prod"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/prod"

mkdir -p "$BASE/dev"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/dev"

mkdir -p "$BASE/sys"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/sys"

mkdir -p "$BASE/old_backups"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups"

mkdir -p "$BASE/tmp_staging"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/tmp_staging"

mkdir -p "$BASE/legacy"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/legacy"

mkdir -p "$BASE/old_backups/empty_dir"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups/empty_dir"

# --- Non-empty files ---
echo "server config data" > "$BASE/prod/server.conf"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/prod/server.conf"

echo "deployment script" > "$BASE/prod/deploy.sh"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/prod/deploy.sh"

echo "dev scratch notes" > "$BASE/dev/dev_notes.txt"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/dev/dev_notes.txt"

echo "monitoring report" > "$BASE/sys/uptime.log"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/sys/uptime.log"

echo "critical security log" > "$BASE/!critical-security.log"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/!critical-security.log"

echo "archived build data" > "$BASE/old_backups/build.log"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups/build.log"

# --- Empty files ---
touch "$BASE/prod/README"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/prod/README"

touch "$BASE/dev/tmp.txt"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/dev/tmp.txt"

touch "$BASE/sys/empty.sh"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/sys/empty.sh"

touch "$BASE/old_backups/placeholder1"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups/placeholder1"

touch "$BASE/old_backups/placeholder2"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups/placeholder2"

touch "$BASE/old_backups/empty_dir/empty1"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups/empty_dir/empty1"

touch "$BASE/old_backups/empty_dir/empty2"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/old_backups/empty_dir/empty2"

# --- Symbolic link ---
ln -s "$BASE/dev/dev_notes.txt" "$BASE/dev_link"
echo -e "${ORANGE}[SETUP]${RESET} Created $BASE/dev_link"

