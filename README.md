elasticsearch
=======
Config files needed to start Elasticsearch Stack via Docker for Conditor Project :
  * a config file for Elasticsearch
  * a config log4j for Elasticsearch
  * a docker-compose file for running Elasticsearch, Kibana and nginx reverse-proxy for authentication

## Prerequisites

- [Docker](https://docs.docker.com/engine/installation/) (Version ⩾ 17.05.0)
- [Docker Compose](https://docs.docker.com/compose/install/) (Version ⩾ 1.17.0)
- vm.max_map_count ⩾ 262144 ([see elasticsearch doc](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode))

<u>Notes :</u>

* Elasticsearch is listening on the standard port `9200`
* Kibana is listening on the standard port `5601` : accessible without authentication
* Nginx is listening on the port `8081` and makes Kibana accessible in a <u>read-only mode</u>, with a basic *login/password* authentication. If you want to share Kibana outside of your organization, you probably shoud use this option as entrypoint.

## Starting app in development mode

```shell
CK_ADMIN_USERNAME="kibana-conditor" \
CK_ADMIN_PASSWORD="changeme" \
make run-debug
```

## Starting app id production mode

```shell
CK_ADMIN_USERNAME="kibana-conditor" \
CK_ADMIN_PASSWORD="changeme" \
CK_BASEURL="https://kibana.conditor.fr" \
make run-prod
```

<u>Note : </u>

"rp" container in production mode relies on the [conditor/conditores-rp](https://registry.hub.docker.com/u/conditor/conditores-rp/) image, hosted on Docker Hub.

"elasticsearch" container in production mode relies on the [conditor/conditores-elasticsearch](https://registry.hub.docker.com/u/conditor/conditores-elasticsearch/) image, hosted on Docker Hub.

## 


## Building & deploying "rp" docker image

Building (from application directory) :

```shell
make build
```

Deploying on docker hub :

```shell
docker push conditor/conditores-rp:<TAG_NO>
docker push conditor/conditores-elasticsearch:<TAG_NO>
```

