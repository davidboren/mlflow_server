FROM python:3.7.1-slim

ARG APPDIR=/mlflow-server

WORKDIR ${APPDIR}

RUN set -ex \
    && apt-get update \
    && apt-get install -yqq --no-install-recommends --fix-missing \
        build-essential

COPY ./Makefile ${APPDIR}/Makefile

RUN make install-poetry

COPY pyproject.toml poetry.lock ${APPDIR}/

RUN make deploy-install

COPY ./entrypoint.sh ${APPDIR}/entrypoint.sh

RUN chmod +x ${APPDIR}/entrypoint.sh

CMD ["entrypoint.sh"]

