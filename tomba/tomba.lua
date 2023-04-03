-- @author    Mohamed Ben rebia <b.mohamed@tomba.io>
-- @copyright Apache-2.0
-- @release   1.0.0-2
-- @see       https://tomba.io/
local requests = require('requests')

Tomba = {}
Tomba.__index = Tomba

-- DEFAULT BASE URL

local DEFAULT_BASE_URL = "https://api.tomba.io/v1"

-- Account path
local ACCOUNT_PATH = "/me"
-- Usage path
local USAGE_PATH = "/usage"
-- Logs path
local LOGS_PATH = "/logs"
-- Search path
local SEARCH_PATH = "/domain-search"
-- Finder path
local FINDER_PATH = "/email-finder"
-- Finder path
local FINDER_PATH = "/email-finder"
-- Enrichment path
local ENRICHMENT_PATH = "/enrich"
-- Author path
local AUTHOR_PATH = "/author-finder"
-- Linkedin path
local LINKEDIN_PATH = "/linkedin"
-- Verifier path
local VERIFIER_PATH = "/email-verifier"
-- Email Sources path
local SOURCES_PATH = "/email-sources"
-- Email Count path
local COUNT_PATH = "/email-count"
-- Domain status path
local STATUS_PATH = "/domain-status"
-- Autocomplete path
local AUTOCOMPLETE_PATH = "/domains-suggestion"


-- 
-- Tomba Construct.
-- @param key   Tomba api key.
-- @param secret   Tomba secret key.

function Tomba:init(key, secret)
    local tomba = {}             -- our new object
    setmetatable(tomba,Tomba)  -- make Tomba handle lookup
    if string.len(key) < 39 then
        error("Invalid Tomba api key")
    end
    if string.len(secret) < 39 then
        error("Invalid Tomba api secret")
    end

    tomba.key = key
    tomba.secret = secret

    return tomba
end

-- Tomba http Client
-- @param path    A string specific path.
function Tomba:call(path, params)
    if path == nil then
        path = ""
    else
        path = path
    end

    local endpoint = DEFAULT_BASE_URL .. path
    local header = {
      ["Content-Type"] = "application/json",
      ["User-Agent"] = "Tomba Lua/client",
      ["X-Tomba-Key"] = self.key,
      ["X-Tomba-Secret"] = self.secret,
    }
  
    response = requests.get{endpoint, params=params,headers = header}
    local json_data = response.json()
    if response.status_code ~= 200 then
        error(response.text)
    end
  
    return json_data;
    
end

-- Returns information about the current account.
function Tomba:account()
    return self:call(ACCOUNT_PATH, nil)
end
-- Search emails are based on the website You give one domain name and it returns all the email addresses found on the internet.
-- @param domain    A string domain Domain name from which you want to find the email addresses. For example, "stripe.com".
function Tomba:domain_search(domain)
    return self:call(SEARCH_PATH, { domain = domain})
end

-- Returns total email addresses we have for one domain.
-- @param domain A string domain name from which you want to find the email addresses. For example, "stripe.com".
function Tomba:count(domain)
    return self:call(COUNT_PATH, { domain = domain})
end
-- Returns domain status if is webmail or disposable.
-- @param domain A string domain name from which you want to check. For example, "gmail.com".
function Tomba:status(domain)
    return self:call(STATUS_PATH, { domain = domain})
end
-- Company Autocomplete is an API that lets you auto-complete company names and retrieve logo and domain information.
-- @param search A string name company or website.
function Tomba:autocomplete(search)
    return self:call(AUTOCOMPLETE_PATH, { query = search})
end
-- Generates or retrieves the most likely email address from a domain name, a first name and a last name.
-- @param domain A string domain name of the company, used for emails. For example, "tomba.com".
-- @param fname A string The person's first name. It doesn't need to be in lowercase.
-- @param lname A string The person's last name. It doesn't need to be in lowercase.
function Tomba:email_finder(domain, fname, lname)
    return self:call(FINDER_PATH, { domain = domain, fisrt_name = fname, last_name= lname })
end

-- The Enrichment API lets you look up person and company data based on an email, For example, you could retrieve a person’s name, location and social handles from an email
-- @param email A string The email address to find data, "b.mohamed@tomba.io".
function Tomba:enrichment(email)
    return self:call(ENRICHMENT_PATH, { email = email})
end
-- This API endpoint generates or retrieves the most likely email address from a blog post url.
-- @param url A string The URL of the article. For example, "https://clearbit.com/blog/company-name-to-domain-api".
function Tomba:author_finder(url)
    return self:call(AUTHOR_PATH, { url = url})
end
-- This API endpoint generates or retrieves the most likely email address from a Linkedin URL.
-- @param url A string The URL of the Linkedin. For example, "https://www.linkedin.com/in/alex-maccaw-ab592978".
function Tomba:linkedin_finder(url)
    return self:call(LINKEDIN_PATH, { url = url})
end
-- Verify the deliverability of an email address.
-- @param email A string email address you want to verify.
function Tomba:email_verifier(email)
    return self:call(VERIFIER_PATH .. email, nil)
end

-- Find email address source somewhere on the web.
-- @param email A string email address you want to find sources.
function Tomba:email_sources(email)
    return self:call(SOURCES_PATH .. email, nil)
end
-- Check your monthly requests.
function Tomba:usage()
    return self:call(USAGE_PATH, nil)
end

-- Returns a your last 1,000 requests you made during the last 3 months.
function Tomba:logs()
    return self:call(LOGS_PATH, nil)
end

-- create and use an Tomba

return Tomba