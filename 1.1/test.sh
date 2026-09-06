#!/usr/bin/env bash
set -e

echo "=== Testes do Backend ==="
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

echo "Testar modelo de previsao..."
python test_model.py

echo "=== Testes concluidos ==="
