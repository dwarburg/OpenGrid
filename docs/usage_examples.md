# Usage Examples

This document provides examples of common operations in OpenGrid.

## SQL Examples

### Basic Queries

```sql
-- Get all nodes
SELECT * FROM nodes;

-- Get all edges with their source and target nodes
SELECT e.*, 
       ns.geom AS source_geom, 
       nt.geom AS target_geom
FROM edges e
JOIN nodes ns ON e.source = ns.id
JOIN nodes nt ON e.target = nt.id;
```

### Routing Queries

```sql
-- Find shortest path between two nodes
SELECT * FROM shortest_path(1, 4);

-- Find all nodes within 1km of a point
SELECT * FROM nodes_within_radius(
  ST_SetSRID(ST_MakePoint(-122.42, 37.78), 4326),
  1000  -- 1km in meters
);
```

### Topology Queries

```sql
-- Get all edges connected to a node
SELECT * FROM sample_topology.edge_data 
WHERE start_node = 1 OR end_node = 1;

-- Find faces adjacent to an edge
SELECT * FROM sample_topology.face
WHERE face_id IN (
  SELECT left_face FROM sample_topology.edge WHERE edge_id = 1
  UNION
  SELECT right_face FROM sample_topology.edge WHERE edge_id = 1
);
```

## API Examples

### Node Operations

```http
# Get all nodes
GET /api/v1/nodes

# Get a specific node
GET /api/v1/nodes/1

# Create a new node
POST /api/v1/nodes
Content-Type: application/json

{
  "geom": {
    "type": "Point",
    "coordinates": [-122.42, 37.78]
  },
  "properties": {
    "name": "Node A",
    "type": "junction"
  }
}

# Update a node
PUT /api/v1/nodes/1
Content-Type: application/json

{
  "properties": {
    "name": "Updated Node A"
  }
}

# Delete a node
DELETE /api/v1/nodes/1
```

### Edge Operations

```http
# Get all edges
GET /api/v1/edges

# Find shortest path
GET /api/v1/routing/shortest-path?source=1&target=4

# Find nodes within radius
GET /api/v1/nodes/within-radius?lng=-122.42&lat=37.78&radius=1000
```

## Tracing Examples

### Enable Query Logging

```sql
-- Enable query logging
ALTER SYSTEM SET log_statement = 'all';
SELECT pg_reload_conf();

-- View recent queries
SELECT * FROM pg_stat_activity 
WHERE query_start > NOW() - INTERVAL '1 hour';
```

### Performance Analysis

```sql
-- Explain analyze a query
EXPLAIN ANALYZE 
SELECT * FROM shortest_path(1, 4);

-- Check table sizes
SELECT 
    table_name,
    pg_size_pretty(pg_total_relation_size(quote_ident(table_name))) as size
FROM information_schema.tables
WHERE table_schema = 'public';
```

## Python Examples

### Using the API Client

```python
import requests

# Get all nodes
response = requests.get('http://localhost:8000/api/v1/nodes')
nodes = response.json()

# Create a new node
new_node = {
    'geom': {
        'type': 'Point',
        'coordinates': [-122.42, 37.78]
    },
    'properties': {
        'name': 'New Node',
        'type': 'junction'
    }
}
response = requests.post(
    'http://localhost:8000/api/v1/nodes',
    json=new_node
)
```

### Using SQLAlchemy

```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Create engine and session
engine = create_engine('postgresql://opengrid:opengrid123@localhost:5432/opengrid')
Session = sessionmaker(bind=engine)
session = Session()

# Query nodes
nodes = session.execute("SELECT * FROM nodes").fetchall()

# Execute a function
result = session.execute(
    "SELECT * FROM shortest_path(:source, :target)",
    {'source': 1, 'target': 4}
).fetchall()
```

## JavaScript Examples

### Using the API from React

```javascript
import React, { useEffect, useState } from 'react';
import axios from 'axios';

function NodeList() {
  const [nodes, setNodes] = useState([]);

  useEffect(() => {
    const fetchNodes = async () => {
      const response = await axios.get('/api/v1/nodes');
      setNodes(response.data);
    };
    fetchNodes();
  }, []);

  return (
    <ul>
      {nodes.map(node => (
        <li key={node.id}>
          {node.properties.name} 
          ({node.geometry.coordinates.join(', ')})
        </li>
      ))}
    </ul>
  );
}

export default NodeList;
```

### Using MapLibre GL JS

```javascript
import maplibregl from 'maplibre-gl';

const map = new maplibregl.Map({
  container: 'map',
  style: 'https://demotiles.maplibre.org/style.json',
  center: [-122.42, 37.78],
  zoom: 12
});

// Add a GeoJSON source
map.on('load', () => {
  map.addSource('nodes', {
    type: 'geojson',
    data: '/api/v1/nodes/geojson'
  });

  map.addLayer({
    id: 'nodes',
    type: 'circle',
    source: 'nodes',
    paint: {
      'circle-radius': 6,
      'circle-color': '#007cbf'
    }
  });
});
```
