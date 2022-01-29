local tomba = require('tomba')

local client = tomba:init("ta_xxxx", "ts_xxxx")

local result = client:status('gmail.com')

print(result)

