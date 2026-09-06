# Football Stats App - Setup (PowerShell)
Write-Host "=== Football Stats App - Setup ===" -ForegroundColor Cyan

# Backend
Write-Host "[1/4] Configurar backend FastAPI..." -ForegroundColor Yellow
Set-Location backend
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
Copy-Item .env.example .env
Write-Host "Backend pronto. Para iniciar: cd backend; .\.venv\Scripts\Activate.ps1; uvicorn app.main:app --reload" -ForegroundColor Green
Set-Location ..

# Flutter
Write-Host "[2/4] Configurar Flutter..." -ForegroundColor Yellow
Set-Location football_stats_app
flutter pub get
Write-Host "Flutter pronto. Para executar: cd football_stats_app; flutter run" -ForegroundColor Green
Set-Location ..

# Copiar JSON para assets
Write-Host "[3/4] Copiar catalogo para assets do Flutter..." -ForegroundColor Yellow
Copy-Item fontes_estatisticas_futebol.json football_stats_app/assets/sources/fontes_estatisticas_futebol.json

# Resumo
Write-Host "[4/4] Resumo:" -ForegroundColor Yellow
Write-Host "- Backend: http://127.0.0.1:8000/docs" -ForegroundColor White
Write-Host "- Flutter: flutter run (Android/iOS/Web)" -ForegroundColor White
Write-Host ""
Write-Host "Variaveis de ambiente criticas (.env):" -ForegroundColor Cyan
Write-Host "  GEMINI_API_KEY=..."
Write-Host "  DATABASE_URL=postgresql://..."
Write-Host "  CORS_ORIGINS=..."
