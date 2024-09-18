# Python Hello Example with OpenTelemetry

This is a simple example of a Python application instrumented with OpenTelemetry.

## Development Suggestions

- Use [uv](https://github.com/astral-sh/uv), an extremely fast Python package and project manager.
- Use [ruff](https://astral.sh/ruff), a very fast python linter and formatter written in Rust.

### Using UV

```sh
# Allow existing will identify the directory and use it
uv venv --allow-existing

# --reinstall force to sync dependencies
# -n is the short version to no-cache to avoid using the cache
uv sync --reinstall -n

# Run the application
uv run opentelemetry-instrument fastapi run

## Access http://localhost:8000/docs to see the Swagger UI
```
