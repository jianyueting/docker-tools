#!/usr/bin/env bash

echo "cluster.name: es-cluster
node.name: ${HOSTNAME}
network.host: 0.0.0.0
http.port: 9200
discovery.seed_hosts: [\"elastic-node1\",\"elastic-node2\",\"elastic-node3\"]
cluster.initial_master_nodes: [\"elastic-node1\",\"elastic-node2\",\"elastic-node3\"]" >> /etc/elasticsearch/elasticsearch.yml
/etc/init.d/elasticsearch start

tail -f /dev/null