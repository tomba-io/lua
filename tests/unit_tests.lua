local tomba = require('tomba/tomba')

describe("tomba init", function()
    local key = "ta_5c8610a2d48c8e5ab9d010f01cad0fcab0000"
    local secret = "ts_00000000-7288-4e78-a52a-6262acd056e9"
    local client = tomba:init(key, secret)
    assert.are.same(key, client.key)
    assert.are.same(secret, client.secret)
end)

describe("tomba init error key", function()
    local key = "ta_xxx"
    local secret = "ts_00000000-7288-4e78-a52a-6262acd056e9"
    local client = tomba:init(key, secret)
    assert.are.error("Invalid Tomba api key")
end)
describe("tomba init error secret", function()
    local key = "ta_5c8610a2d48c8e5ab9d010f01cad0fcab0000"
    local secret = "ts_xxxx"
    local client = tomba:init(key, secret)
    assert.are.error("Invalid Tomba api secret")
end)