# AGENTS.md

## General Instructions

- Follow YAGNI and KISS principle and avoid over-engineering.
- Follow the latest features based on language and library versions.
- Use high-level operations instead of low-level ones (e.g., use `pathlib`
  instead of `os` for Python)

## Coding and Testing

### Overall rules

- Use the project's environment when running something. For example, Python
  with uv, run scripts with `uv run`.
- Run type check (e.g., `ty` or `pyright`), linter (`ruff check`) and
  formatter (`prettier` or `ruff format`) after edit.
- Group functions by domain, not operations. A series of operations should be
  aggregated to a single function rather than splitting unless it's too complex.

### Python Specific

- Use `uv` + `pyproject.toml` for project management rather than `pip` and `poetry`.
- Use `ruff`, `ty` and `pyright` for linting, type-checking and formatting.
- Use `pytest` for unit tests rather than `unittest`.
- Use modern libraries like `polars` (rather than `pandas`), `httpx` (vs. `requests`),
  `simdjson` or `orjson` (vs. `json`) when available.
