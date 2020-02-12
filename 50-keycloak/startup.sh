#!/usr/bin/env bash

#/keycloak/bin/standalone.sh -D jboss.bind.address=0.0.0.0 &>/keycloak.log &

/keycloak/bin/standalone.sh &>/keycloak.log &

tail -f /dev/null