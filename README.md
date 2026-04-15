# Ollama on Railway - Cricket Commentary AI

Lightweight Ollama instance for generating cricket match commentary.

## Deploy to Railway

1. Create a new project on Railway
2. Select "Deploy from GitHub repo" or "Deploy from Dockerfile"
3. Point to this directory
4. Railway will build the Docker image (model is pre-baked, ~400MB)
5. Set the following:
   - **Port**: `11434`
   - No additional env vars needed

## Internal Networking

Once deployed, the service is accessible from other Railway services at:
```
http://ollama-railway.railway.internal:11434
```

Set this as `OLLAMA_URL` in the node-backend service environment variables.

## Model

Uses `qwen2.5:0.5b` — a 0.5B parameter model that:
- Runs well on CPU (no GPU required)
- ~400MB image size
- Generates 1-2 sentence commentary in <3 seconds
- Good enough for cricket event commentary

## API

Standard Ollama API:
```bash
curl http://localhost:11434/api/generate -d '{
  "model": "qwen2.5:0.5b",
  "prompt": "Generate cricket commentary for a SIX hit by Virat Kohli off Mitchell Starc",
  "stream": false
}'
```
