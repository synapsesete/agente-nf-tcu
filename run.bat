@echo off

docker "rm" "--force" "postgres"
docker "rm" "--force" "ollama"
docker "rm" "--force" "ollama-pull-llm"
docker "rm" "--force" "n8n-import"
docker "rm" "--force" "n8n"

docker "compose" "--profile" "cpu" "up" "--remove-orphans"
