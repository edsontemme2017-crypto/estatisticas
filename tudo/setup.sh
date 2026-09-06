#!/usr/bin/env bash
set -e

echo "=== Football Stats App - Setup ==="

# Backend
echo "[1/4] Configurar backend FastAPI..."
cd backend
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
cp .env.example .env
echo "Backend pronto. Para iniciar: cd backend && source .venv/bin/activate && uvicorn app.main:app --reload"
cd ..

# Flutter
echo "[2/4] Configurar Flutter..."
cd football_stats_app
flutter pub get
echo "Flutter pronto. Para executar: cd football_stats_app && flutter run"
cd ..

# Copiar JSON para assets do Flutter
echo "[3/4] Copiar catalogo para assets do Flutter..."
cp fontes_estatisticas_futebol.json football_stats_app/assets/sources/fontes_estatisticas_futebol.json

# Resumo
echo "[4/4] Resumo:"
echo "- Backend: http://127.0.0.1:8000/docs"
echo "- Flutter: flutter run (Android/iOS/Web)"
echo ""
echo "Variaveis de ambiente criticas (.env):"
echo "  GEMINI_API_KEY=..."
echo "  DATABASE_URL=postgresql://..."
echo "  CORS_ORIGINS=..."
