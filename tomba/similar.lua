--- Tomba Similar Domains Service
-- @see https://docs.tomba.io/api/domain

local Tomba = require("tomba.client")

--- Similar
-- Retrieve similar domains based on a specific domain.
-- @param domain string Domain name (e.g., "stripe.com").
-- @return table API response with similar domains.
-- @see https://docs.tomba.io/api/domain#get-similar
function Tomba:similar(domain)
    return self:call(Tomba.SIMILAR_PATH, { domain = domain })
end

return Tomba
