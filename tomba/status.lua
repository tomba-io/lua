--- Tomba Domain Status Service
-- @see https://docs.tomba.io/api/domain

local Tomba = require("tomba.client")

--- Returns domain status indicating if it is a webmail or disposable domain.
-- @param domain string Domain name (e.g., "gmail.com").
-- @return table API response with domain status.
-- @see https://docs.tomba.io/api/domain#get-domain-status
function Tomba:status(domain)
    return self:call(Tomba.STATUS_PATH, { domain = domain })
end

--- Company Autocomplete API.
-- Auto-complete company names and retrieve logo and domain information.
-- @param search string Company name or website to search.
-- @return table API response with suggestions.
-- @see https://docs.tomba.io/api/domain-suggestions#get-domain-suggestions
function Tomba:autocomplete(search)
    return self:call(Tomba.AUTOCOMPLETE_PATH, { query = search })
end

return Tomba
