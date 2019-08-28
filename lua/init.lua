local redis = require 'resty.redis'
local json = require 'cjson'

count = 1
local shared_data = ngx.shared.shared_data
shared_data.set("count",1)
