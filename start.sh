#!/bin/bash

# Start Ollama server in background
/bin/ollama serve &
SERVER_PID=$!

# Wait for server to be ready
echo "Waiting for Ollama server to start..."
for i in $(seq 1 30); do
  if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "Ollama server is ready!"
    break
  fi
  sleep 2
done

# Pull model if not already present
MODEL=${OLLAMA_MODEL:-qwen2.5:0.5b}
echo "Checking for model: $MODEL"
if ! ollama list | grep -q "$MODEL"; then
  echo "Pulling model $MODEL..."
  ollama pull "$MODEL"
  echo "Model $MODEL pulled successfully!"
else
  echo "Model $MODEL already available."
fi

echo "Ollama is ready to serve on port 11434"

# Keep the server running
wait $SERVER_PID
