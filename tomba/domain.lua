--- Tomba Domain Search Service
-- @see https://docs.tomba.io/api/finder

local Tomba = require("tomba.client")

--- Search emails based on a website domain.
-- Returns all email addresses found on the internet for the given domain.
-- @param domain string Domain name (e.g., "stripe.com").
-- @return table API response with email addresses.
-- @see https://docs.tomba.io/api/finder#get-domain-search
function Tomba:domain_search(domain, opts)
    local params = { domain = domain }
    if opts ~= nil then
        if opts.enrich_mobile ~= nil then params.enrich_mobile = opts.enrich_mobile end
        if opts.webhook_url ~= nil then params.webhook_url = opts.webhook_url end
    end
    return self:call(Tomba.SEARCH_PATH, params)
end

return Tomba
