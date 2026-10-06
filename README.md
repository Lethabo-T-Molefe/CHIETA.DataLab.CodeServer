# CHIETA Data Lab — code-server

Standalone VS Code in the browser for the CHIETA Data Lab technical team.
No native Windows build — always runs as a container. Deployed separately
from the FastAPI backend; the backend exposes its URL via `CODE_SERVER_URL`.

## Local

```bash
docker compose up -d --build
# http://localhost:8443
```

## Backend integration

```
CODE_SERVER_URL=https://<this-service>.onrender.com
```

Frontend fallback:

```
VITE_CODE_SERVER_URL=https://<this-service>.onrender.com
```

## Render

1. Create a **Docker** web service from this repo (or `render.yaml`).
2. Attach a disk at `/home/coder/project` so workspaces persist.
3. Set `CODE_SERVER_AUTH=password` and a strong `PASSWORD` for public URLs.
4. Copy the public URL into the backend's `CODE_SERVER_URL`.

Health check path: `/healthz`.
