#!/bin/bash -ex

# 启用 exceptionless 及其所需的 elasticsearch
sudo sysctl -w vm.max_map_count=262144

sudo useradd --system --shell /sbin/nologin elasticsearch

sed s/ES_USER_ID=[0-9]*/ES_USER_ID=$(id -u elasticsearch)/g -i .env

# 从 .env 获取 ES_CERT_PATH、ES_DATA_PATH、ES_LOG_PATH、KIBANA_DATA_PATH
# 创建目录并授权
source .env
mkdir "${ES_CERT_PATH}" -p
mkdir "${ES_DATA_PATH}" -p
mkdir "${ES_LOG_PATH}" -p
mkdir "${KIBANA_DATA_PATH}" -p
chown -R elasticsearch:elasticsearch "${ES_CERT_PATH}" "${ES_DATA_PATH}" "${ES_LOG_PATH}" "${KIBANA_DATA_PATH}"


# 0. load docker images
sudo docker load -i ./kibana_${STACK_VERSION}.tar
sudo docker load -i ./es_${STACK_VERSION}.tar
sudo docker load -i ./ex_app_${EXCEPTIONLESS_VERSION}.tar
sudo docker load -i ./ex_job_${EXCEPTIONLESS_VERSION}.tar

# 1. start docker compose
sudo docker compose up -d
