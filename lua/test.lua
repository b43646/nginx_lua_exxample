local redis = require "resty.redis"

local red = redis:new()

red:set_timeout(1000)

local ok, err = red:connect("127.0.0.1", 6379)

if not ok then
    ngx.say("failed to connect:", err)
end

local res, err = red:auth("test123")

if not res then
    ngx.say("failed to auth:", err)
end


local res, err = red:get("cnt")
if not res then
    ngx.say("failed to get dog:", err)
end

local cnt = res + 1

ok, err = red:set("cnt", cnt)
if not ok then
    ngx.say("failed to set dog:", err)
end

ngx.say("set result:", ok)


ngx.say("cnt:",cnt)

