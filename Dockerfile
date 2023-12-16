FROM techblog/fastapi:latest

LABEL maintainer="tomer.klein@gmail.com"


ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8
ENV LOG_LEVEL "DEBUG"
RUN apt update -yqq

RUN apt install -yqq python3-pip && \
    apt install -yqq libffi-dev && \
    apt install -yqq libssl-dev

RUN mkdir -p /app/{config,app}

COPY requirements.txt /tmp

RUN pip3 install -r /tmp/requirements.txt

EXPOSE 8081

COPY app /app

WORKDIR /app

ENTRYPOINT ["/usr/bin/python3", "/app/app.py"]