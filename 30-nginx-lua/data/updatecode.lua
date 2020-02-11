local DRIVER = assert(require("luasql.mysql"))
local JSON = assert(require('json'))
local REDIS = assert(require('nginx.redis'))
--创建环境对象
local env = assert(DRIVER.mysql())
local redis = REDIS:new()

redis:set_timeout(2000)
local ok,err = redis:connect("redis-server-ip",6379)

if not ok then
    ngx.say('{"code":1,"msg":"redis连接失败'..err..'","timestamp":'.. os.date("%s") ..'}')
    return
end

--选择数据库
--redis:select(0)

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

local function addRows(result,rows)
    for m,n in pairs(rows) do
        result[m]=n;
    end
end

local request_method = ngx.var.request_method
local args = {}
--获取参数的值
local args1 = ngx.req.get_uri_args()
addRows(args,args1);
ngx.req.read_body()
local args2 = ngx.req.get_post_args()
addRows(args,args2);

local code = args['code']

redis:del(code)
-- 根据具体视图修改SQL语句
for row in rows(conn ,"SELECT code,value,label from vw_dict where code ='"..code.."'") do
    local string = JSON.encode(row)
    redis:lpush(row.code,string)
end

local res = {code = 0,msg="",data = {},timestamp = os.date("%s")}
ngx.say(JSON.decode(res))

conn:close()
env:close()
redis:close()