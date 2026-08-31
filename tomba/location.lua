--- Tomba Location Service
-- @see https://docs.tomba.io/api/finder

local Tomba = require("tomba.client")

--- Location
-- Retrieve employees location breakdown based on the domain name.
-- @param domain string Domain name (e.g., "stripe.com").
-- @return table API response with location data.
-- @see https://docs.tomba.io/api/finder#get-location
function Tomba:get_location(domain)
    return self:call(Tomba.LOCATION_PATH, { domain = domain })
end

return Tomba
