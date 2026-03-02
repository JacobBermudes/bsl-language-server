#!/bin/bash

# BSL Language Server startup script with optimized JVM parameters

JAR_PATH="./build/libs/bsl-language-server-features-bcs-metaborders-d41964a-DIRTY-exec.jar"

# JVM parameters
HEAP_MAX=4G
HEAP_MIN=2G
PORT=8025

# Optional: Configuration
CONFIG_FILE=${1:-.}

echo "Starting BSL Language Server..."
echo "JAR: $JAR_PATH"
echo "Heap: -Xms${HEAP_MIN} -Xmx${HEAP_MAX}"
echo "Config/Root: $CONFIG_FILE"
echo ""

java \
  -Xms${HEAP_MIN} \
  -Xmx${HEAP_MAX} \
  -XX:+UseG1GC \
  -XX:MaxGCPauseMillis=200 \
  -jar "$JAR_PATH" websocket \
  --configuration="$CONFIG_FILE"

