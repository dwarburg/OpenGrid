# Sample Data

This directory contains sample data for demonstration and testing purposes.

## Files

- `sample_network.sql`: Inserts a small network with 4 nodes and 4 edges
- `sample_topology.sql`: Sets up a topology for the sample network

## Expected Results

After loading the sample data, you should have:
- 4 nodes in the `nodes` table
- 4 edges in the `edges` table
- A topology named `sample_topology` with the network data

## Usage

To load the sample data, run the SQL files in this order:

1. First, make sure the schema is created
2. Then run `sample_network.sql`
3. Finally, run `sample_topology.sql`

You can verify the data was loaded correctly by running:

```sql
SELECT COUNT(*) FROM nodes;  -- Should return 4
SELECT COUNT(*) FROM edges;  -- Should return 4
SELECT * FROM metadata;      -- Should show version and last_updated
