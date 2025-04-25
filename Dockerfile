FROM python:2.7.18-slim

WORKDIR /apps/

COPY app/ /apps/

WORKDIR /apps/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev

RUN pip install -U pip setuptools && pip install -r /apps/requirements.txt

EXPOSE 5050

ENTRYPOINT ["python"]

CMD ["app.py"]