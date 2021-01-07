FROM python:3.9.1-alpine
RUN apk add --update --no-cache \
    curl\
    graphviz\
    ttf-freefont
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
WORKDIR /tmp
COPY pyproject.toml poetry.lock ./
RUN ~/.poetry/bin/poetry config virtualenvs.create false &&\
    ~/.poetry/bin/poetry install --no-dev &&\
    rm -rf /tmp

WORKDIR /out
ENTRYPOINT ["python"]