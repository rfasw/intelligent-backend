#!/bin/bash
set -e

echo "=== Starting Diabetes Prediction API ==="
echo "Python version: $(python --version)"
echo "Poetry version: $(poetry --version)"

# Install dependencies
echo "Installing dependencies..."
poetry install --no-dev

# Run migrations if needed
# poetry run alembic upgrade head

# Start the application
echo "Starting Gunicorn..."
exec poetry run gunicorn --bind 0.0.0.0:${PORT:-5000} \
                        --workers 1 \
                        --timeout 120 \
                        --log-level debug \
                        --access-logfile - \
                        --error-logfile - \
                        app.main:app