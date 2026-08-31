--- Tomba Email Count Service
-- @see https://docs.tomba.io/api/finder

local Tomba = require("tomba.client")

--- Returns total email addresses found for one domain.
-- @param domain string Domain name (e.g., "stripe.com").
-- @return table API response with email count.
-- @see https://docs.tomba.io/api/finder#get-email-count
function Tomba:count(domain)
    return self:call(Tomba.COUNT_PATH, { domain = domain })
end

return Tomba
