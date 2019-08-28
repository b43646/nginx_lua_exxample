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


red:init_pipeline()
red:set("cat3", "Marry")
red:set("horse3", "Bob")

local val_cat3 ,err = red:get("cat3")
local val_horse3, err = red:get("horse3")

ngx.say("get cat3:", val_cat3)
ngx.say("get horse3:", val_horse3)

local results, err = red:commit_pipeline()
if not results then
    ngx.say("failed to commit the pieplined requests:", err)
    return
end

for i,res in ipairs(results) do
    if type(res) == "table" then
        if res[1] == false then
            ngx.say("failed to run command ", i, ":", res[2])
        else
            -- process the table value
        end
    else
        --process the scalar value
        ngx.say(res)
    end

end

local ok, err = red:set_keepalive(10000, 100)
if not ok then
    ngx.say("failed to set keepalive: ", err)
    return
end



































