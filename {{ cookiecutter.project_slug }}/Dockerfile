FROM quay.io/jupyter/datascience-notebook:python-3.11.9

RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

USER root

# hadolint ignore=DL3008
RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update &&\
  apt-get install --no-install-recommends -y python3-dev libasound2-dev alsa-base alsa-utils &&\
  rm -rf /var/lib/apt/lists/*

USER jovyan
COPY pyproject.toml /tmp/pyproject.toml

# hadolint ignore=DL3003, DL3013, DL3042
RUN --mount=type=cache,target=/root/.cache/pip cd /home/jovyan/work/ &&\
  pip install --no-cache-dir --upgrade build &&\
  pip install --no-cache-dir --upgrade setuptools &&\
  pip install --no-cache-diruv &&\
  uv venv &&\
  uv pip install --no-cache-dir --requirement /tmp/pyproject.toml
