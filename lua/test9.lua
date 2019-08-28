

local server = require "resty.websocket.server"

local wb, err = server:new{
    timeout = 50000,
    max_payload_len = 65535,
}
if not wb then
    ngx.log(ngx.ERR, "failed to new websocket: ", err)
    return ngx.exit(444)
end

while true do

local data, typ, err = wb:recv_frame()

if not data then
    ngx.log(ngx.ERR, "failed to receive a frame: ", err)
    return ngx.exit(444)
end




bytes, err = wb:send_text(data)
if not bytes then
    ngx.log(ngx.ERR, "failed to send a text frame: ", err)
    return ngx.exit(444)
end

end

--local bytes, err = wb:send_close(1000, "enough, enough!")
--if not bytes then
--    ngx.log(ngx.ERR, "failed to send the close frame: ", err)
--    return
--end

























