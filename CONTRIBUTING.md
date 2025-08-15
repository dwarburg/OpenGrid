# Contributing to OpenGrid

Thank you for your interest in contributing to OpenGrid! We welcome contributions from the community to help improve this project. Please take a moment to review these guidelines before submitting your contribution.

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](docs/CODE_OF_CONDUCT.md). Please report any unacceptable behavior to the project maintainers.

## How to Contribute

### Reporting Issues
- Before creating a new issue, please search the [existing issues](https://github.com/yourusername/opengrid/issues) to avoid duplicates
- Use a clear and descriptive title
- Include as much information as possible: steps to reproduce, expected vs actual behavior, screenshots if applicable
- Include version information (OS, browser, database, etc.)

### Feature Requests
- Open an issue with the "enhancement" label
- Clearly describe the feature and why it would be valuable
- If possible, include a proposed implementation approach

### Pull Requests
1. Fork the repository and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure the test suite passes
5. Make sure your code lints
6. Issue a pull request with a clear description of the changes

## Development Setup

### Prerequisites
- Python 3.8+
- Node.js 16+
- PostgreSQL 13+ with PostGIS 3.0+
- Git

### Installation
1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/opengrid.git
   cd opengrid
   ```
2. Set up the backend (see [Service/README.md](Service/README.md))
3. Set up the frontend (see [Client/web/README.md](Client/web/README.md))
4. Set up the database (see [Database/README.md](Database/README.md))

## Code Style

### Python
- Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide
- Use type hints for all new code
- Keep functions small and focused on a single responsibility

### JavaScript/TypeScript
- Follow [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- Use TypeScript for all new code
- Prefer functional components with hooks

### SQL
- Use snake_case for all identifiers
- Include comments for complex queries
- Follow the existing database schema conventions

## Testing
- Write unit tests for all new functionality
- Ensure all tests pass before submitting a pull request
- Update tests when fixing bugs or adding features

## Documentation
- Update relevant documentation when adding or changing features
- Keep comments clear and concise
- Document any changes that affect the public API

## License
By contributing to OpenGrid, you agree that your contributions will be licensed under its [LICENSE](LICENSE) file.

## Questions?
If you have any questions about contributing, please open an issue or contact the maintainers.
