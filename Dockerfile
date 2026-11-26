# Étape 1 : installer les dépendances
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Étape 2 : image finale, plus légère
FROM python:3.12-slim
LABEL org.opencontainers.image.source=https://github.com/youssef-gnaoui/usine-huile-olive
WORKDIR /app
RUN useradd -m -u 1000 appuser
COPY --from=builder /root/.local /home/appuser/.local
COPY app.py .
USER appuser
ENV PATH=/home/appuser/.local/bin:$PATH
EXPOSE 3000
CMD ["python", "app.py"]