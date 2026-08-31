--- Tomba Usage Service
-- @see https://docs.tomba.io/api/account

local Tomba = require("tomba.client")

--- Usage
-- Check your monthly requests.
-- @return table API response with usage data.
-- @see https://docs.tomba.io/api/account#get-usage
function Tomba:usage()
    return self:call(Tomba.USAGE_PATH, nil)
end

return Tomba
