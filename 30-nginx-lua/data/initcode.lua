local DRIVER = assert(require("luasql.mysql"))
local JSON = assert(require('json'))
local REDIS = assert(require('nginx.redis'))
--创建环境对象
local env = assert(DRIVER.mysql())
local redis = REDIS:new()

redis:set_timeout(2000)
local ok,err = redis:connect("redis-server-ip",6379)

if not ok then
    ngx.say("redis连接失败",err)
    return
end

--选择数据库
--redis:select(0)
--清空redis数据
redis:flushdb()

--连接数据库
-- TODO 具体修改
-- 数据库名,用户名,密码,服务器地址,服务器端口
local conn = assert(env:connect("db-name","username","password","mysql-server-ip",3306))

function rows (conn, sql)
  local cursor = assert (conn:execute (sql))
  return function ()
    return cursor:fetch({},"a")
  end
end

-- 根据具体视图修改SQL语句
for row in rows(conn ,"SELECT code,value,label from vw_dict group by code") do
    local string = JSON.encode(row)
    redis:lpush(row.code,string)
end

val res = {code = 0,data = {},timestamp = os.date("%s")}
ngx.say(JSON.decode(res))

conn:close()
env:close()
redis:close()