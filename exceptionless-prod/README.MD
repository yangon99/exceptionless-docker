# 合肥 Exceptionless 生产环境 docker compose 配置

生产环境将 elasticsearch 和 exceptionless 分别启动的方式进行部署
因此使用 docker compose 是相对方便的东西

配置文件分为 nossl 和 ssl 两个版本。正式环境预计使用 nossl 版本，因为暂时没有找到让 exceptionless 使用 elasticsearch 自签名证书的办法

## 配置

配置主要修改 `exceptionless.env` 文件中的内容（正式环境该文件一般为 `.env` 文件，用于 docker compose 的环境配置）

具体内容参见文件

## 运行

直接在文件中使用命令

```shell
docker compose up -d
```

由于生产环境没有安装单独的 `docker-compose` 工具，只安装了对应的插件，所以需要注意命令有所不同