# OpenGrid

OpenGrid is an Open Source Geographic Information System (GIS) platform specifically designed for Electric Utilities to efficiently manage, trace, and update their geospatial network data. Built with modern web technologies, OpenGrid provides a robust solution for visualizing and analyzing complex utility networks.

## Key Features

- **Advanced Network Tracing**: Perform complex network traces including upstream/downstream analysis, isolation tracing, and more
- **High Performance**: Engineered to handle networks with hundreds of millions of features
- **Topology-Aware Editing**: Intelligent editing tools that maintain network connectivity and data integrity
- **Open Standards**: Implements OGC APIs for maximum interoperability
- **Version Control**: Built-in support for tracking changes and managing multiple versions of network data

## Architecture

OpenGrid is built on a modern, scalable architecture:

- **Database**: PostgreSQL with PostGIS and pgRouting for spatial operations
- **Backend**: FastAPI-based service layer with OGC API endpoints
- **Frontend**: React-based web application with MapLibre GL JS and OpenLayers

## Getting Started

For detailed installation and setup instructions, please refer to the [Documentation](./docs/).

## Contributing

We welcome contributions! Please see our [Contribution Guidelines](CONTRIBUTING.md) for more details.

## License

This project is dual-licensed:

1. **MIT License** - For standalone use
   - Full text available in [LICENSE](LICENSE)
   - [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

2. **GNU General Public License v2 or later** - When combined or distributed with QGIS (GPLv2+)
   - Full text available in [docs/COPYING.GPL](docs/COPYING.GPL)
   - [![License: GPL v2+](https://img.shields.io/badge/License-GPL%20v2%2B-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

### Copyright Notice

Copyright (c) 2025 OpenGrid Contributors