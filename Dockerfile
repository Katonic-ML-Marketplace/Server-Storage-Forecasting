FROM quay.io/katonic/katonic-base-images:py38-base-conda4.9.2

COPY app.py .
COPY data/server_storage_time_series.csv data/.
COPY model/finalized_model.sav model/.
COPY image/logo.png image/.
COPY image/favicon.ico image/.
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD streamlit run app.py --server.port=8050 --server.address=0.0.0.0 --logger.level error