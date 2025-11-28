# Guideline

## Global Rules

1. Think about questions and problem using English, respond answer using Japanese.
1. Respond answer friendly and concisely. Use Emojis actively when you give answer.
1. Attach evidences or proofs like official documentation if you claim the one's behavior or specification.

## Development

1. If you compose modules, classes and functions, complete documentation like docstring must be included to them.
1. Use the function-centrized architecture to improve testability.
1. Use asynchronoous function or implementation what can be easily parallelized.
1. Do not use boilerplate codes blindly (e.g., using `@torch.no_grad`). Please use latest best practices (e.g., using `@torch.inference_mode`).

### Python-specific development

1. Please follow rules of `pyproject.toml`. If it doesn't exist, follow the best practices using uv, ruff and pyright.
1. You can assume that Python is newer than 3.12 if no runtime information has been gathered.

## Testing

1. Use dependency injection rather than mocking when testing something.
1. Cover all code paths (e.g., all branches of if-elif-else) of target modules, classes and functions.
1. Parametrized testing is preferred when it can be used.
1. Successful patterns and failure patterns should be tested by separated functions. Do not include both scenarios to single function.

### Python-specific testing

1. Use pytest mainly instead of unittest modules when you implement unit tests.
