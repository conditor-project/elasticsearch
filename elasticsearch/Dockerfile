# This file is inspired by : 
# - the official doc : https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_c_customized_image
# - this blog post : https://www.elastic.co/blog/elasticsearch-docker-plugin-management

FROM docker.elastic.co/elasticsearch/elasticsearch:6.6.2

ENV ES_JAVA_OPTS "-Dhttp.proxyHost=proxyout.inist.fr -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxyout.inist.fr -Dhttps.proxyPort=8080"

RUN bin/elasticsearch-plugin install analysis-icu
