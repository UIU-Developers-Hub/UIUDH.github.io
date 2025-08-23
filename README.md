# UIU Developers Hub Documentation

This repository contains the documentation website for UIU Developers Hub, built with Jekyll.

## Building the Site

### Quick Start

To build the documentation site, simply run:

```bash
./build.sh
```

This script will automatically:
1. Try to build using Docker (recommended for consistency)
2. Fall back to local Ruby/Bundle if Docker fails
3. Install dependencies if needed

### Watch Mode (Development)

To run the site locally with auto-reload for development:

```bash
./watch.sh [port]
```

Default port is 4000. The script uses the same fallback mechanism as `build.sh`.

### Manual Build Options

#### Option 1: Docker (Recommended)
```bash
docker run --rm -it \
  --volume="$PWD:/srv/jekyll:Z" \
  --volume="$PWD/vendor:/usr/local/bundle:Z" \
  jekyll/jekyll:3.8 \
  jekyll build
```

#### Option 2: Local Ruby/Bundle
```bash
bundle install
bundle exec jekyll build
```

#### Option 3: Local Development Server
```bash
bundle install
bundle exec jekyll serve --port 4000 --watch
```

## Troubleshooting

### Jekyll Build Issues

If you encounter build issues:

1. **Docker Issues**: The build scripts automatically fall back to local Ruby if Docker fails
2. **Dependency Issues**: Run `bundle install` to update dependencies
3. **Permission Issues**: Ensure scripts are executable: `chmod +x build.sh watch.sh`

### Common Errors

- **"Could not find base64-0.2.0"**: This indicates Docker image incompatibility. The build script will automatically use local Ruby instead.
- **"Permission denied"**: Make sure build scripts are executable
- **"Bundle not found"**: Install Ruby and Bundler: `gem install bundler`

## GitHub Pages Deployment

The site automatically deploys to GitHub Pages via GitHub Actions when changes are pushed to the `dev` branch. The workflow uses Ruby 3.1 and the standard `bundle exec jekyll build` process.

## Requirements

- **Docker** (preferred) OR **Ruby 3.1+** with Bundler
- Jekyll dependencies (automatically installed via bundle)

## Development

This site uses the Jekyll documentation theme with customizations for UIU Developers Hub. The main content is in:

- `index.md` - Homepage
- `pages/` - Additional pages
- `_config.yml` - Site configuration
- `_data/` - Data files
- `_includes/` - Reusable components
- `_layouts/` - Page templates

For more information about contributing, see the [Contributing Guidelines](contributorsList.md).