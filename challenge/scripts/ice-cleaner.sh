#!/bin/bash

# NEXUS DYNAMICS - ICE Cache Cleanup
# Removes old temporary files created by the security system.

CACHE_DIR="/tmp/nexus-ice-cache"

if [ -d "$CACHE_DIR" ]; then
    find "$CACHE_DIR" -type f -mtime +7 -delete
    echo "Old cache files removed."
else
    echo "No cache directory found. Nothing to clean."
fi