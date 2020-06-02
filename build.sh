#!/bin/bash

REPOSITORY=registry.qseco.fr/tk4-k8s
 
declare -a containers=("tk4-node" "tn3270-web-node" "web-ui")

for container in "${containers[@]}"
do
	docker buildx build --platform linux/amd64 --load -t $REPOSITORY/$container:amd64 $container/
	docker buildx build --platform linux/arm64 --load -t $REPOSITORY/$container:arm64 $container/

	docker push $REPOSITORY/$container:arm64
	docker push $REPOSITORY/$container:amd64
done
