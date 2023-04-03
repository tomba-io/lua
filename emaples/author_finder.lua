local tomba = require('tomba')

local client = tomba:init("ta_xxxx", "ts_xxxx")

local result = client:author_finder('https://clearbit.com/blog/company-name-to-domain-api')

print(result)

