FROM python:3.11.4-alpine
RUN apk add --update --no-cache \
    curl\
    graphviz\
    gcc\
    libc-dev\
    libffi-dev\
    ttf-freefont \
    coreutils && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/install.python-poetry.org/42a10434ed127a5986c3a9952c75d333ac3a1f8e/install-poetry.py > install-poetry.py && \
    echo "08a38ab8de719d4012af4d62c37ce09e84edce6e1c4da7c5ccbcade359312c8b install-poetry.py" | sha256sum -c && \
    python install-poetry.py --version 1.3.1 && \
    apk del \
    gcc \
    libc-dev \
    libffi-dev
WORKDIR /tmp
COPY pyproject.toml poetry.lock ./
RUN /root/.local/bin/poetry config virtualenvs.create false &&\
    /root/.local/bin/poetry install --no-dev &&\
    rm -rf /tmp

WORKDIR /out
ENTRYPOINT ["python"]
