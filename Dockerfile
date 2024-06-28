FROM python:3.9-slim

# Set work directory
WORKDIR /docs

# Install dependencies
RUN apt-get update && apt-get install -y inotify-tools
RUN pip install sphinx sphinx_rtd_theme recommonmark

# Copy the current directory contents into the container at /docs
COPY . /docs

# Expose the port to view the docs
EXPOSE 8000

# Default command to build and serve the documentation
CMD ["bash", "-c", "sphinx-build -b html docs/source docs/build && python -m http.server 8000 -d docs/build"]
