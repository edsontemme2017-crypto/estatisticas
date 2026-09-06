from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.config import get_settings
from app.routers import sources, matches, ai, predictions

settings = get_settings()
app = FastAPI(title=settings.app_name, version="1.0.0")
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origin_list,
    allow_credentials=True,
    allow_methods=["GET", "POST"],
    allow_headers=["Content-Type", "Authorization"],
)

app.include_router(sources.router, prefix="/api/v1", tags=["sources"])
app.include_router(matches.router, prefix="/api/v1", tags=["matches"])
app.include_router(ai.router, prefix="/api/v1", tags=["ai"])
app.include_router(predictions.router, prefix="/api/v1", tags=["predictions"])

@app.get("/api/v1/health")
def health():
    return {"status": "ok", "service": settings.app_name, "environment": settings.environment}
