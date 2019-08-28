
local mysql = require "resty.mysql"
local db, err = mysql:new()
if not db then
    ngx.say("failed to instantiate mysql: ", err)
    return
end


db:set_timeout(1000)

local ok, err, errno, sqlstate = db:connect{
    host = "127.0.0.1",
    port = 3306,
    database = "test",
    user = "root",
    password = "123456",
    max_package_size = 1024
}

if not ok then
    ngx.say("failed to connect: ", err, ":", errno, " ", sqlstate)
    return
end

res, err, errno, sqlstate = db:query("select id, username, age from users where id=1")
if not res then
    ngx.say("bad result: ", err, ":", errno, ":", sqlstate, ".")
    return
end

local cjson = require "cjson"
ngx.say(cjson.encode(res))




