FROM ollama/ollama:latest

# Pre-download a small model during build so it's baked into the image
# qwen2.5:0.5b is ~400MB, fast on CPU, good enough for short commentary
RUN ollama serve & \
    sleep 5 && \
    ollama pull qwen2.5:0.5b && \
    kill %1 || true

EXPOSE 11434

ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]
