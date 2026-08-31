--- Tomba Account Service
-- @see https://docs.tomba.io/api/account

local Tomba = require("tomba.client")

--- Returns information about the current account.
-- @return table Account information.
-- @see https://docs.tomba.io/api/account#get-me
function Tomba:account()
    return self:call(Tomba.ACCOUNT_PATH, nil)
end

return Tomba
