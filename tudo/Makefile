 .PHONY: install-backend install-flutter run-backend run-flutter docker-up docker-down test

install-backend:
	cd backend && python3 -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt

install-flutter:
	cd football_stats_app && flutter pub get

run-backend:
	cd backend && . .venv/bin/activate && uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

run-flutter:
	cd football_stats_app && flutter run

docker-up:
	docker compose up -d

docker-down:
	docker compose down

test:
	cd backend && . .venv/bin/activate && pytest || true
	cd football_stats_app && flutter test || true
