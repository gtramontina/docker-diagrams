FROM python:3.10.6-alpine
RUN apk add --update --no-cache \
    curl\
    graphviz\
    ttf-freefont \
    coreutils
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/1.1.13/get-poetry.py > get-poetry.py && \
    echo "e973b3badb95a916bfe250c22eeb7253130fd87312afa326eb02b8bdcea8f4a7  get-poetry.py" | sha256sum -c && \
    python get-poetry.py --version 1.1.13
WORKDIR /tmp
COPY pyproject.toml poetry.lock ./
RUN ~/.poetry/bin/poetry config virtualenvs.create false &&\
    ~/.poetry/bin/poetry install --no-dev &&\
    rm -rf /tmp

WORKDIR /out
ENTRYPOINT ["python"]
