--- Tomba Enrichment Service (Clearbit-compatible)
-- @see https://docs.tomba.io/api/enrichment

local Tomba = require("tomba.client")

--- Person Find
-- Fetch social details tied to an email address (Clearbit-compatible Person API).
-- @param email string Email address to find data for.
-- @return table API response with person data.
-- @see https://docs.tomba.io/api/enrichment#get-people-find
function Tomba:person_find(email)
    return self:call(Tomba.PERSON_FIND_PATH, { email = email })
end

--- Company Find
-- Look up company data via a domain (Clearbit-compatible Company API).
-- @param domain string Domain name to look up.
-- @return table API response with company data.
-- @see https://docs.tomba.io/api/enrichment#get-companies-find
function Tomba:company_find(domain)
    return self:call(Tomba.COMPANY_FIND_PATH, { domain = domain })
end

--- Combined Find
-- Returns both person and company data from an email (Clearbit-compatible Combined API).
-- @param email string Email address.
-- @return table API response with person and company data.
-- @see https://docs.tomba.io/api/enrichment#get-combined-find
function Tomba:combined_find(email)
    return self:call(Tomba.COMBINED_FIND_PATH, { email = email })
end

return Tomba
