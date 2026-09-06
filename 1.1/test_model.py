import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent / "app"))

from services.model_prediction import predict_match_outcome

home = {
    "goals_for_avg": 1.8,
    "goals_against_avg": 1.2,
    "corners_for_avg": 5.4,
    "corners_against_avg": 4.2,
    "wins": 3, "draws": 1, "losses": 1
}

away = {
    "goals_for_avg": 1.4,
    "goals_against_avg": 1.6,
    "corners_for_avg": 4.8,
    "corners_against_avg": 5.0,
    "wins": 2, "draws": 2, "losses": 1
}

result = predict_match_outcome(home, away)
print("Resultado da previsao:")
for k, v in result.items():
    print(f"  {k}: {v}")
