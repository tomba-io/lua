local tomba = require('tomba')

local client = tomba:init("ta_xxxx", "ts_xxxx")

local result = client:account()

print(result.data.email)
