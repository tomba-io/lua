local tomba = require('tomba')

local client = tomba:init("ta_xxxx", "ts_xxxx")

local result = client:email_verifier('b.mohamed@tomba.io')

print(result)

