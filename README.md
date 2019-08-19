# ClusterMeans
# Language: R
# Input: TXT (keyword, value pairs)
# Output: CSV (trimmed file)
# Tested with: PluMA 1.0, R 3.2.5

PluMA plugin to take a set of clusters and compute the mean edge weight between them, taking
into account nodes in each pair of clusters.

The plugin accepts as input a TXT file with (keyword, value) pairs.  Three keywords are accepted:

network: The name of the CSV file with the network.  This is assumed to have both rows and columns
representing nodes, with entry (i, j) the edge between node i and node j
clusters: The name of the CSV file with clusters.  Clusters are assumed to have nodes on single lines, in
this format:
"", "x"
"1","node1"
"2","node2"
...
"", "x"

Nodes are therefore numbered within each cluster, and each cluster is separated by "", "x"

numclusters: The number of clusters (n)

The output file will also be a CSV file, of size nxn.  Entry (i, j) is the mean weight
between cluster i and cluster j 
