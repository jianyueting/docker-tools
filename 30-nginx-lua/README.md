nginx lua
====

### 说明
----
主要是和redis配置使用，统一提供字典数据功能。本功能现仅提供内部使用，没有安全机制验证。后续考虑安全验证。

返回数据格式如下，code为0表示正常返回，data包含具体字典数据，timestamp为当前系统时间秒数

```json
{"code":0,"msg":"","data":[{"code":"","value":"","label":""},{}],"timestamp":...}
```

路径说明

|路径|请求方式|参数|说明|
|----|----|----|----|
|/initcode|GET|无|行删除redis中的旧数据，再从mysql数据库中初始化数据到redis中，可以每天定时任务调用此连接，更新最新数据|
|/syscode|GET|code|从redis中获取对应字典数据，如果没有参数则获取最新的100条热数据|
|/updatecode|GET|code|从数据库中更新code的数据到redis中|

程序调用的lua脚本存放在/data中，具体配置看lua-server配置。

**备注**  mysql数据库提供字典视图，名称待定。