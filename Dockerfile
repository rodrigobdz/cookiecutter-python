FROM quay.io/jupyter/datascience-notebook:latest

RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

USER root
RUN --mount=type=cache,target=/var/cache/apt \
  sudo apt-get update &&\
  sudo apt-get install -y python3-dev libasound2-dev alsa-base alsa-utils &&\
  sudo rm -rf /var/lib/apt/lists/*

USER jovyan
COPY pyproject.toml /tmp/pyproject.toml

RUN --mount=type=cache,target=/root/.cache/pip cd /home/jovyan/work/ &&\
  pip install --upgrade build &&\
  pip install --upgrade setuptools &&\
  pip install uv &&\
  uv venv &&\
  uv pip install --requirement /tmp/pyproject.toml
