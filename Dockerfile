# ============================================
# ЭТАП 1: Сборка зависимостей (Builder)
# ============================================
FROM python:3.9-slim AS builder

WORKDIR /build
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --target /install

# ============================================
# ЭТАП 2: Финальный образ (Alpine)
# ============================================
FROM python:3.9-alpine

# Создаём пользователя с UID=1000 (как у maxon на хосте!)
RUN adduser -D -u 1000 appuser

WORKDIR /app

COPY app.py .
COPY --from=builder /install /usr/local/lib/python3.9/site-packages/

# Переключаемся на пользователя
USER appuser

CMD ["python3", "app.py"]
