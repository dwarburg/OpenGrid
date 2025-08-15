-- Sample topology setup

-- Create a new topology
SELECT topology.DropTopology('sample_topology');
SELECT topology.CreateTopology('sample_topology', 4326);

-- Add nodes to topology
INSERT INTO sample_topology.node (node_id, containing_face, geom)
SELECT id, NULL, geom
FROM nodes;

-- Add edges to topology
INSERT INTO sample_topology.edge (edge_id, start_node, end_node, next_left_edge, next_right_edge, left_face, right_face, geom)
SELECT 
    e.id,
    e.source,
    e.target,
    e.id, -- Simplified for example
    e.id, -- Simplified for example
    0,    -- Left face
    0,    -- Right face
    e.geom
FROM edges e;
