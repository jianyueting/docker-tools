#!/usr/bin/env bash

/consul agent -dev --client 0.0.0.0 &

tail -f /dev/null