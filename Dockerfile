# CHIETA Data Lab — code-server (standalone Docker service)
#
# Local:  docker compose up -d --build
# Render: connect this repo as a Docker web service (see render.yaml)
#
# Based on codercom/code-server — no native Windows build; stays containerized.

FROM codercom/code-server:latest

ENV PORT=8080 \
    PASSWORD="" \
    CODE_SERVER_AUTH=none \
    CODE_SERVER_PROJECT=/home/coder/project

USER root
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && mkdir -p /home/coder/project \
    && chown -R coder:coder /home/coder/project

USER coder
WORKDIR /home/coder/project

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=5 \
  CMD curl -fsS "http://127.0.0.1:${PORT}/healthz" || curl -fsS "http://127.0.0.1:${PORT}/" || exit 1

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
