#!/usr/bin/env bash
# Description : Build jekyll pages with docker without installation of ruby or gem
# Howto :
# run ./build.sh in current directory
# required : Docker
# source : https://github.com/envygeeks/jekyll-docker/blob/master/README.md

_JEKYLL_VERSION="${JEKYLL_VERSION:-3.8}"

echo "Attempting Docker-based Jekyll build..."

# Try Docker build first
if docker run --rm \
  -it \
  --ipc=host \
  --net=host \
  --volume="${PWD}:/srv/jekyll:Z" \
  --volume="${PWD}/vendor:/usr/local/bundle:Z" \
  jekyll/jekyll:${_JEKYLL_VERSION} \
  jekyll build; then
  echo "Docker build successful!"
else
  echo "Docker build failed. Attempting local Ruby/Bundle build..."
  
  # Fallback to local Ruby build
  if command -v bundle &> /dev/null; then
    if [ ! -d "vendor/bundle" ]; then
      echo "Installing dependencies..."
      bundle install
    fi
    echo "Building with local Jekyll..."
    bundle exec jekyll build
    if [ $? -eq 0 ]; then
      echo "Local Ruby build successful!"
    else
      echo "Local Ruby build also failed. Please check your Jekyll configuration."
      exit 1
    fi
  else
    echo "Neither Docker nor local Ruby/Bundle is available or working."
    echo "Please install Ruby and Bundler, or fix your Docker setup."
    exit 1
  fi
fi
