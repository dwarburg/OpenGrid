-- Sample network data for demonstration

-- Insert sample nodes
INSERT INTO nodes (id, geom, properties) VALUES
(1, ST_SetSRID(ST_MakePoint(-122.42, 37.78), 4326), '{"name": "Node A", "type": "junction"}'),
(2, ST_SetSRID(ST_MakePoint(-122.40, 37.78), 4326), '{"name": "Node B", "type": "junction"}'),
(3, ST_SetSRID(ST_MakePoint(-122.40, 37.76), 4326), '{"name": "Node C", "type": "junction"}'),
(4, ST_SetSRID(ST_MakePoint(-122.38, 37.76), 4326), '{"name": "Node D", "type": "terminal"}');

-- Insert sample edges
INSERT INTO edges (source, target, cost, reverse_cost, geom, properties) VALUES
(1, 2, 1.0, 1.0, ST_SetSRID(ST_MakeLine(
    ST_MakePoint(-122.42, 37.78),
    ST_MakePoint(-122.40, 37.78)
), 4326), '{"name": "Main St", "type": "road"}'),
(2, 3, 1.5, 1.5, ST_SetSRID(ST_MakeLine(
    ST_MakePoint(-122.40, 37.78),
    ST_MakePoint(-122.40, 37.76)
), 4326), '{"name": "1st Ave", "type": "avenue"}'),
(3, 4, 1.2, 1.2, ST_SetSRID(ST_MakeLine(
    ST_MakePoint(-122.40, 37.76),
    ST_MakePoint(-122.38, 37.76)
), 4326), '{"name": "Elm St", "type": "road"}'),
(2, 4, 1.8, 1.8, ST_SetSRID(ST_MakeLine(
    ST_MakePoint(-122.40, 37.78),
    ST_MakePoint(-122.38, 37.76)
), 4326), '{"name": "Diagonal Rd", "type": "highway"}');

-- Insert metadata
INSERT INTO metadata (key, value) VALUES
('version', '1.0.0'),
('last_updated', NOW()::TEXT);
