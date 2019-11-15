#!/usr/bin/env bash

sed -i "$acluster.name: es-cluster\nnode.name: ${HOSTNAME}\nnetwork.host: 0.0.0.0\ndiscovery.seed_hosts:[\"elastic-node1\",\"elastic-node2\",\"elastic-node3\"]\ncluster.initial_master_nodes: [\"elastic-node1\",\"elastic-node2\",\"elastic-node3\"]" /etc/elasticsearch/elasticsearch.yml 
/etc/init.d/elasticsearch start

tail -f /dev/null