local tomba = require('tomba')

local client = tomba:init("ta_xxxx", "ts_xxxx")

local result = client:linkedin_finder('https://www.linkedin.com/in/alex-maccaw-ab592978')

print(result)

