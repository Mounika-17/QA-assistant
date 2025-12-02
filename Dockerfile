# Start from official slim image
FROM python:3.11-slim

# Build-time args (optional) to toggle installing build deps
ARG INSTALL_BUILD_DEPS=true

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PORT=8080

WORKDIR /app

# Install system packages needed for building some Python libs and typical tools.
# Edit the list to match your app's needs (poppler-utils, ffmpeg, tesseract, libpq-dev, etc.).
RUN apt-get update \
 && if [ "$INSTALL_BUILD_DEPS" = "true" ]; then \
      apt-get install -y --no-install-recommends \
        build-essential gcc g++ libffi-dev libssl-dev ca-certificates \
        curl git \
        # add libraries you actually need below, e.g.:
        # libpq-dev libjpeg-dev zlib1g-dev poppler-utils \
    ; fi \
 && rm -rf /var/lib/apt/lists/*

# Copy only requirements first for layer caching
COPY requirements.txt /app/requirements.txt

# Upgrade pip and install requirements
RUN python -m pip install --upgrade pip setuptools wheel \
 && pip install --no-cache-dir -r /app/requirements.txt

# Create non-root user and set ownership
RUN useradd --create-home --shell /bin/bash appuser \
 && mkdir -p /app/logs \
 && chown -R appuser:appuser /app

# Copy app code (do NOT copy large knowledge-base if unnecessary)
COPY --chown=appuser:appuser app /app/app

# Expose the chosen port (matches PORT env)
EXPOSE 8080

USER appuser

# Healthcheck (optional) - adjust endpoint/port as required
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl --fail http://localhost:${PORT}/health || exit 1

# Gunicorn command: adjust workers/timeout according to CPU/memory
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app", "--workers", "2", "--timeout", "60"]
