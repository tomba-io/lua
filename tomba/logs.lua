--- Tomba Logs Service
-- @see https://docs.tomba.io/api/account

local Tomba = require("tomba.client")

--- Logs
-- Returns your last 1,000 requests made during the last 3 months.
-- @return table API response with request logs.
-- @see https://docs.tomba.io/api/account#get-logs
function Tomba:logs(params)
    return self:call(Tomba.LOGS_PATH, params)
end

return Tomba
