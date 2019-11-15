local JSON = assert(require('json'))
local REDIS = assert(require('nginx.redis'))
--创建环境对象
local redis = REDIS:new()

redis:set_timeout(2000)
local ok,err = redis:connect("redis-server-ip",6379)

if not ok then
    ngx.say("redis连接失败",err)
    return
end

--选择数据库
--redis:select(0)

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

if type == nil or type == '' or code == nil or code == '' then
    local res = {code = 0,data = {},timestamp = os.date("%s")}
    ngx.say(JSON.decode(res))
else
    local res = {code = 0,data = {},timestamp = os.date("%s")}
    local info = redis:lrange(code,0,-1)
    for m,n in ipairs(info) do
        res.data[m] = JSON.decode(n)
    end

    ngx.say(JSON.decode(res))    
end

redis:close()
