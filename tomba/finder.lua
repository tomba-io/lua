--- Tomba Email Finder Service
-- @see https://docs.tomba.io/api/finder

local Tomba = require("tomba.client")

--- Email Finder
-- Generates or retrieves the most likely email address from a domain name, first name, and last name.
-- @param domain string Domain name of the company (e.g., "tomba.com").
-- @param first_name string The person's first name.
-- @param last_name string The person's last name.
-- @return table API response with the found email.
-- @see https://docs.tomba.io/api/finder#get-email-finder
function Tomba:email_finder(domain, first_name, last_name, opts)
    local params = { domain = domain, first_name = first_name, last_name = last_name }
    if opts ~= nil then
        if opts.webhook_url ~= nil then params.webhook_url = opts.webhook_url end
    end
    return self:call(Tomba.FINDER_PATH, params)
end

--- Author Finder
-- Generates or retrieves the most likely email address from a blog post URL.
-- @param url string The URL of the article.
-- @return table API response with the author's email.
-- @see https://docs.tomba.io/api/finder#get-author-finder
function Tomba:author_finder(url, opts)
    local params = { url = url }
    if opts ~= nil then
        if opts.webhook_url ~= nil then params.webhook_url = opts.webhook_url end
    end
    return self:call(Tomba.AUTHOR_PATH, params)
end

--- Linkedin Finder
-- Generates or retrieves the most likely email address from a LinkedIn URL.
-- @param url string The URL of the LinkedIn profile.
-- @return table API response with the found email.
-- @see https://docs.tomba.io/api/finder#get-linkedin
function Tomba:linkedin_finder(url, opts)
    local params = { url = url }
    if opts ~= nil then
        if opts.webhook_url ~= nil then params.webhook_url = opts.webhook_url end
    end
    return self:call(Tomba.LINKEDIN_PATH, params)
end

--- Enrichment
-- Look up person and company data based on an email.
-- Retrieve a person's name, location and social handles.
-- @param email string Email address to find data for (e.g., "b.mohamed@tomba.io").
-- @return table API response with enrichment data.
-- @see https://docs.tomba.io/api/enrichment#get-enrich
function Tomba:enrichment(email, opts)
    local params = { email = email }
    if opts ~= nil then
        if opts.webhook_url ~= nil then params.webhook_url = opts.webhook_url end
    end
    return self:call(Tomba.ENRICHMENT_PATH, params)
end

return Tomba
