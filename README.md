# What is OpenGrid?

OpenGrid is an Open Source GIS for Electric Utilities to trace and update their geospatial data.

| Design Goals|
|-----------|
| Performant  - quickly trace and update networks with hundreds of millions of features |
| Reliable - failures are rare and come with informative and accurate logs |
| Electric First - designed from the beginning with electric utilities in mind |
| Cloud Agnostic - can be deployed on prem or with any major cloud provider |
| Open Source - no licensing fees, continuous improvement from community |

---

# OpenGrid MVP Development Time Estimate

This estimate assumes a **single developer** with moderate prior experience in Python, JavaScript, and SQL/PostGIS.  
The hours are **development hours** only — not including extensive testing, documentation, or long-term maintenance.

---

## 1. Database Layer (≈ 140–200 hours)

| Component | Hours | Notes |
|-----------|-------|-------|
| PostgreSQL + PostGIS setup & schema design | 30–40 | Installing, configuring, indexing, creating core network tables (nodes, edges). |
| pgRouting integration | 25–35 | Basic shortest path + custom trace functions (upstream, downstream, isolation). |
| pgTopology configuration | 25–40 | Defining topology rules, loading data, enforcing connectivity integrity. |
| pgVersion setup | 20–30 | Setting up version tables, workflow for edit sessions, integrating with topology. |
| PostgreSQL Triggers | 40–55 | Attribute update rules, geometry-based calculations, status propagation. |

---

## 2. Service Layer (≈ 100–140 hours)

| Component | Hours | Notes |
|-----------|-------|-------|
| FastAPI setup | 25–35 | Base project, environment, endpoints, dependency injection. |
| OGC APIs (Features, Tiles, Processes) | 40–55 | Implementing endpoints in Python with SQL queries; spatial filtering, pagination. |
| Database connection (asyncpg / psycopg3) | 15–25 | Connection pooling, query execution patterns, error handling. |
| Tracing endpoints | 20–25 | Exposing pgRouting functions with parameters and returning JSON/GeoJSON. |

---

## 3. Client Application (≈ 120–180 hours)

| Component | Hours | Notes |
|-----------|-------|-------|
| React + MapLibre GL JS setup | 25–35 | Project scaffolding, map rendering, base layers. |
| OpenLayers integration | 35–50 | Editing tools, topology-aware snapping, layer management. |
| Custom tracing UI | 40–55 | UI elements for trace initiation, parameter selection, and visualizing results. |
| API integration | 20–40 | Fetching data from OGC API endpoints, rendering, error handling. |

---

## Grand Total: 360–520 hours (~9–13 full-time work weeks for a single developer)