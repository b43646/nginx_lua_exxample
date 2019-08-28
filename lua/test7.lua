


-- HTTP Get
local curl = require "lcurl"


function writefunc(buf)
    ngx.say(buf)
end

local http = curl.easy{
    url = 'http://127.0.0.1:8090/get',
    httpheader = {
        "X-Test-Header1: Header-Data1",
        "X-Test-Header2: Header-Data2",
    },
    writefunction = writefunc -- use io.stderr:write()
}:perform()

ngx.say(http:getinfo(curl.INFO_RESPONSE_CODE))

http:close()