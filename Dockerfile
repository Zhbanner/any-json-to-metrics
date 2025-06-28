FROM python:3.10-slim-bookworm

ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt /app/

RUN pip3 install -r /app/requirements.txt \
 && rm -rf /root/.cache/pip

COPY exporter.py collector.py utils.py config.json /app/

EXPOSE 9900

STOPSIGNAL SIGINT

ENTRYPOINT [ "python", "exporter.py" ]
