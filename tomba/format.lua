--- Tomba Email Format Service
-- @see https://docs.tomba.io/api/finder

local Tomba = require("tomba.client")

--- Email Format
-- Retrieve the email format patterns used by a specific domain.
-- @param domain string Domain name (e.g., "stripe.com").
-- @return table API response with email format patterns.
-- @see https://docs.tomba.io/api/finder#get-email-format
function Tomba:email_format(domain)
    return self:call(Tomba.EMAIL_FORMAT_PATH, { domain = domain })
end

return Tomba
