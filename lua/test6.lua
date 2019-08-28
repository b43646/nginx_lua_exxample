

local http = require "resty.http"
local httpc = http:new()

local res, err = httpc:request_uri("http://127.0.0.1:8090/helloworld",{
    method = "POST",
    body = "a=1&b=2",
    header = {
        ["Content-Type"] = "application/x-www-form-urlencoded",
    }
})

if not res then
    ngx.say("failed to request: ", err)
    return
end


ngx.status = res.status

for k, v in pairs(res.headers) do
    --
end

ngx.say(res.body)


