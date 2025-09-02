-- Function to find the shortest path between two nodes
CREATE OR REPLACE FUNCTION shortest_path(
    source_node INTEGER,
    target_node INTEGER
) RETURNS TABLE (
    seq INTEGER,
    path_seq INTEGER,
    node_id BIGINT,
    edge_id BIGINT,
    cost FLOAT8,
    agg_cost FLOAT8
) AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM pgr_dijkstra(
        'SELECT id, source, target, cost, reverse_cost FROM edges',
        source_node,
        target_node,
        directed := true
    );
END;
$$ LANGUAGE plpgsql;

-- Function to find all nodes within a radius
CREATE OR REPLACE FUNCTION nodes_within_radius(
    center_point GEOMETRY,
    radius FLOAT8
) RETURNS SETOF nodes AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM nodes
    WHERE ST_DWithin(geom, center_point, radius);
END;
$$ LANGUAGE plpgsql;
