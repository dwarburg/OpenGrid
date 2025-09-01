# Database Schema

This directory contains SQL scripts for setting up the OpenGrid database schema.

## Execution Order

1. `01_extensions.sql` - Creates required PostgreSQL extensions
2. `02_schema.sql` - Creates core tables (nodes, edges, metadata)
3. `03_constraints.sql` - Adds constraints and indexes
4. `04_triggers.sql` - Sets up database triggers
5. `05_functions.sql` - Defines stored procedures and functions

## Dependencies

- PostgreSQL 12+
- PostGIS 3.0+
- pgRouting 3.0+
- pgTopology
- pgVersion
