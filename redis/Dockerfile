# Use Python 3.10 image with scip as base
FROM rhedak/py310_scip:v0.0.1

# Install Redis server
RUN apt-get update && apt-get install -y redis-server

# Install Redis Python package
RUN pip install --no-cache-dir redis

# Expose Redis port
EXPOSE 6379

# Launch Redis server
CMD ["redis-server"]
