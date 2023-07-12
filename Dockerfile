# Use an official Python runtime as the base image
FROM python:3.9
WORKDIR /src

RUN apt-get update && apt-get install -y --no-install-recommends portaudio19-dev && apt-get install -y ffmpeg

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src /src
COPY .env /src/.env

EXPOSE 8501
CMD ["streamlit", "run", "main_v2.py"]
