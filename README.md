# 模板带后端
# 注意
该模板是带后端，所以需要安装Go环境，配套使用Caddy Web服务器，请自行安装这些环境

请push到私有仓库或者在`.gitignore`添加`config.yaml`文件，防止密码信息泄露

## 配置

修改hugo.toml中博客配置信息

修改config.yaml中后端配置信息

```yaml
auth:
  username: admin
  password: password
imgbed:
  domain: http://xxx.com
```

上面分别为登录用户名和密码，下面是你的博客域名(记住带上https)

修改`Caddyfile`

```Caddyfile
example.com {
        root * hugo_directory
        file_server
        reverse_proxy /api/* 127.0.0.1:3000
}
```

example.com是你的博客域名，hugo_directory是你的hugo目录，如果你的Caddyfile在hugo目录下，那么这个目录就是`.`
也就是
```Caddyfile
example.com {
        root * .
        file_server
        reverse_proxy /api/* 127.0.0.1:3000
}
```

## 运行

后端服务启动
```bash
tmux new -s blog
./hugo_backend-linux-amd64
```

程序会运行在3000端口上


web服务器启动
```bash
caddy start
```
