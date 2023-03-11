FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends octave \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*