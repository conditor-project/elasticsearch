RED=\033[0;31m
NC=\033[0m

.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check-sysctl:
	@if [ "$$(/sbin/sysctl -n vm.max_map_count)" -lt "262144" ]; then echo "${RED}You have to set vm.max_map_count greater than 262144 or elasticsearch will not start${NC}"; echo "${RED}see: https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode${NC}"; exit 1; fi

run-prod: check-sysctl ## run istex-kibana with prod parameters
	docker-compose up -d rp

kill: ## stop running containers (the hard way)
	docker-compose -f ./docker-compose.yml kill
stop: ## stop running containers
	docker-compose -f ./docker-compose.yml stop

ps: ## show current container status
	docker-compose -f ./docker-compose.yml ps

cleanup-indexes: ## destroy istex-corpus-* indexes for elasticsearch
	curl -XDELETE 'localhost:9200/notices?pretty' -H 'Content-Type: application/json'
