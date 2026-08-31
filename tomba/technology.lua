--- Tomba Technology Service
-- @see https://docs.tomba.io/api/domain

local Tomba = require("tomba.client")

--- Technology
-- Retrieve the technologies used by a specific domain.
-- @param domain string Domain name (e.g., "stripe.com").
-- @return table API response with technology data.
-- @see https://docs.tomba.io/api/domain#get-technology
function Tomba:technology(domain)
    return self:call(Tomba.TECHNOLOGY_PATH, { domain = domain })
end

return Tomba
