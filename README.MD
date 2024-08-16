# Exceptionless 生产环境 docker compose 配置

生产环境将 elasticsearch 和 exceptionless 分别启动的方式进行部署
因此使用 docker compose 可能相对方便

由于部署环境不方便分享和更新自签名 https 证书，因此生产环境不使用 https

ref: 
- [dadoonet/legacy-search/docker-compose.yml](https://github.com/dadoonet/legacy-search/blob/7b7b3035df531248bfb2c93ccbb3aacd5e3188ad/docker-compose.yml)
- [exceptionless docker-compose sample](https://github.com/exceptionless/Exceptionless/blob/main/samples/docker-compose.yml)


## 配置

配置主要修改 `exceptionless.env` 文件中的内容（正式环境该文件一般为 `.env` 文件，用于 docker compose 的环境配置）

具体内容参见文件

## 运行

直接在文件中使用命令

```shell
bash -ex run.sh
```
