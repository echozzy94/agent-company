#!/bin/bash
set -e

echo "[INFO] Installing Python dependencies..."
pip install requests python-dotenv

echo "[INFO] Loading environment variables from .env..."
source /workspaces/$(basename "$PWD")/.env

echo "[INFO] Setting up Git configuration..."
git config --global user.name "GPT Agent"
git config --global user.email "${GITHUB_USER}@agent.local"
git config --global credential.helper store

echo "[INFO] Writing GitHub credentials..."
echo "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com" > ~/.git-credentials

echo "[INFO] ✅ Setup complete for local agent + GitHub integration"
