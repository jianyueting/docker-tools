#!/usr/bin/env bash

echo "cluster.name: es-cluster
node.name: ${HOSTNAME}
network.host: 0.0.0.0
transport.tcp.port: 9300
http.port: 9200
discovery.seed_hosts: [\"elastic-node1\",\"elastic-node2\",\"elastic-node3\"]
cluster.initial_master_nodes: [\"elastic-node1\",\"elastic-node2\",\"elastic-node3\"]
http.cors.enabled: true
http.cors.allow-origin: \"*\"
http.cors.allow-headers: Authorization
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true" >> /etc/elasticsearch/elasticsearch.yml
/etc/init.d/elasticsearch start

tail -f /dev/null