FROM python:3.11-slim

LABEL maintainer="Avi Langburd <avi@langburd.com>"

WORKDIR /app

COPY /app/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

COPY /app /app

ENV APP_ENVIRONMENT="Getting APP_ENVIRONMENT failed"

EXPOSE 8080

CMD ["python3", "app.py"]
