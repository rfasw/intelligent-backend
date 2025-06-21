services:
  - type: web
    name: your-app
    runtime: python
    buildCommand: |
      pip install poetry==2.1.3
      poetry config virtualenvs.create false
      poetry install --only main --no-interaction --no-ansi
      python -c "import setuptools; print('Setuptools available')"
    startCommand: |
      poetry run gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 app:app