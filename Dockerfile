FROM python:3.8.2-slim

WORKDIR /app
COPY app.py .
COPY server_storage_time_series.csv .
COPY finalized_model.sav .
COPY logo.png .
COPY favicon.ico .
COPY requirements.txt .

RUN apt-get update && apt-get -y install gcc build-essential && pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error