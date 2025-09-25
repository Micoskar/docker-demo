FROM python:3.11-slim

RUN useradd --create-home appuser
WORKDIR /home/appuser

COPY app.py requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R appuser:appuser /home/appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]
