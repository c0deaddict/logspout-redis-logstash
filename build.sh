#!/bin/sh
cat > ./Dockerfile.example <<DOCKERFILE
FROM gliderlabs/logspout:master
DOCKERFILE

cat > ./modules.go <<MODULES
package main
import (
  _ "github.com/gliderlabs/logspout/httpstream"
  _ "github.com/gliderlabs/logspout/routesapi"
  _ "github.com/c0deaddict/logspout-redis-logstash"
)
MODULES

docker build -t c0deaddict/logspout-redis-logstash -f Dockerfile.example .

rm -f Dockerfile.example modules.go
