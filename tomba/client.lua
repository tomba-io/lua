--- Tomba Email Finder Lua SDK
-- Official Lua client library for the Tomba.io Email Finder API.
-- Core client module: constants, constructor, and HTTP methods.
-- @author    Mohamed Ben rebia <b.mohamed@tomba.io>
-- @copyright Apache-2.0
-- @release   1.1.0
-- @see       https://tomba.io/
-- @see       https://docs.tomba.io/

local requests = require('requests')
local json = require('cjson')

Tomba = {}
Tomba.__index = Tomba

--- SDK version
Tomba.VERSION = "1.1.0"

-- DEFAULT BASE URL
Tomba.BASE_URL = "https://api.tomba.io/v1"

-- Account path
Tomba.ACCOUNT_PATH = "/me"
-- Usage path
Tomba.USAGE_PATH = "/usage"
-- Logs path
Tomba.LOGS_PATH = "/logs"
-- Search path
Tomba.SEARCH_PATH = "/domain-search"
-- Finder path
Tomba.FINDER_PATH = "/email-finder"
-- Enrichment path
Tomba.ENRICHMENT_PATH = "/enrich"
-- Author path
Tomba.AUTHOR_PATH = "/author-finder"
-- Linkedin path
Tomba.LINKEDIN_PATH = "/linkedin"
-- Verifier path
Tomba.VERIFIER_PATH = "/email-verifier"
-- Email Sources path
Tomba.SOURCES_PATH = "/email-sources"
-- Email Count path
Tomba.COUNT_PATH = "/email-count"
-- Domain status path
Tomba.STATUS_PATH = "/domain-status"
-- Autocomplete path
Tomba.AUTOCOMPLETE_PATH = "/domain-suggestions"
-- Phone Finder path
Tomba.PHONE_FINDER_PATH = "/phone-finder"
-- Phone Validator path
Tomba.PHONE_VALIDATOR_PATH = "/phone-validator"
-- Email Format path
Tomba.EMAIL_FORMAT_PATH = "/email-format"
-- Location path
Tomba.LOCATION_PATH = "/location"
-- Similar path
Tomba.SIMILAR_PATH = "/similar"
-- Technology path
Tomba.TECHNOLOGY_PATH = "/technology"
-- Person Find (Clearbit-compatible)
Tomba.PERSON_FIND_PATH = "/people/find"
-- Company Find (Clearbit-compatible)
Tomba.COMPANY_FIND_PATH = "/companies/find"
-- Combined Find (Clearbit-compatible)
Tomba.COMBINED_FIND_PATH = "/combined/find"
-- Companies search (Reveal)
Tomba.COMPANIES_SEARCH_PATH = "/reveal/search"
-- Keys path
Tomba.KEYS_PATH = "/keys"
-- Flag path
Tomba.FLAG_PATH = "/flag"
-- Leads path
Tomba.LEADS_PATH = "/leads"
-- Leads Lists path
Tomba.LEADS_LISTS_PATH = "/leads_lists"
-- Attributes path
Tomba.ATTRIBUTES_PATH = "/attributes"


-------------------------------------------------------------------------------
-- Constructor
-------------------------------------------------------------------------------

--- Tomba Constructor.
-- Creates a new Tomba client instance.
-- @param key string Tomba API key (minimum 39 characters).
-- @param secret string Tomba API secret key (minimum 39 characters).
-- @return table New Tomba client instance.
-- @see https://docs.tomba.io/authentication
function Tomba:init(key, secret)
    local tomba = {}
    setmetatable(tomba, Tomba)
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


-------------------------------------------------------------------------------
-- HTTP Client Methods
-------------------------------------------------------------------------------

--- Make a GET request to the Tomba API.
-- @param path string API endpoint path.
-- @param params table Query parameters (optional).
-- @return table Parsed JSON response.
-- @see https://docs.tomba.io/authentication
function Tomba:call(path, params)
    if path == nil then
        path = ""
    end

    local endpoint = Tomba.BASE_URL .. path
    local header = {
        ["Content-Type"] = "application/json",
        ["User-Agent"] = "Tomba Lua/client " .. Tomba.VERSION,
        ["X-Tomba-Key"] = self.key,
        ["X-Tomba-Secret"] = self.secret,
    }

    local response = requests.get{endpoint, params = params, headers = header, timeout = 120}
    local json_data = response.json()
    if response.status_code ~= 200 then
        error(response.text)
    end

    local rate_limit = Tomba._parse_rate_limit_headers(response)

    return { data = json_data, rate_limit = rate_limit }
end

--- Make a POST request to the Tomba API with a JSON body.
-- @param path string API endpoint path.
-- @param body table Request body to be encoded as JSON.
-- @param params table Query parameters (optional).
-- @return table Parsed JSON response.
function Tomba:post(path, body, params)
    return self:_request("POST", path, body, params)
end

--- Make a PUT request to the Tomba API with a JSON body.
-- @param path string API endpoint path.
-- @param body table Request body to be encoded as JSON.
-- @param params table Query parameters (optional).
-- @return table Parsed JSON response.
function Tomba:put(path, body, params)
    return self:_request("PUT", path, body, params)
end

--- Make a DELETE request to the Tomba API.
-- @param path string API endpoint path.
-- @param params table Query parameters (optional).
-- @return table Parsed JSON response.
function Tomba:delete_request(path, params)
    return self:_request("DELETE", path, nil, params)
end

--- Internal method for POST/PUT/DELETE requests.
-- @param method string HTTP method (POST, PUT, DELETE).
-- @param path string API endpoint path.
-- @param body table Request body (optional).
-- @param params table Query parameters (optional).
-- @return table Parsed JSON response.
function Tomba:_request(method, path, body, params)
    if path == nil then
        path = ""
    end

    local endpoint = Tomba.BASE_URL .. path
    local header = {
        ["Content-Type"] = "application/json",
        ["User-Agent"] = "Tomba Lua/client " .. Tomba.VERSION,
        ["X-Tomba-Key"] = self.key,
        ["X-Tomba-Secret"] = self.secret,
    }

    local json_body = nil
    if body ~= nil then
        json_body = json.encode(body)
    end

    local response
    if method == "POST" then
        response = requests.post{endpoint, data = json_body, params = params, headers = header, timeout = 120}
    elseif method == "PUT" then
        response = requests.put{endpoint, data = json_body, params = params, headers = header, timeout = 120}
    elseif method == "DELETE" then
        response = requests.delete{endpoint, params = params, headers = header, timeout = 120}
    end

    local ok, json_data = pcall(function() return response.json() end)
    if not ok then
        json_data = { status = response.status_code }
    end

    local rate_limit = Tomba._parse_rate_limit_headers(response)

    return { data = json_data, rate_limit = rate_limit }
end


-------------------------------------------------------------------------------
-- Rate limit header parsing
-------------------------------------------------------------------------------

--- Rate limit header names to extract from API responses.
Tomba.RATE_LIMIT_HEADERS = {
    "x-second-rate-limit",
    "x-minute-rate-limit",
    "x-daily-rate-limit",
    "x-minute-request-left",
    "x-daily-request-left",
    "x-minute-reset-seconds",
    "x-daily-reset-seconds",
    "retry-after",
    "ratelimit-policy",
    "ratelimit",
}

--- Parse rate limit headers from an HTTP response.
-- @param response table The HTTP response object from lua-requests.
-- @return table A table mapping header names to their values.
function Tomba._parse_rate_limit_headers(response)
    local rate_limit = {}
    if response and response.headers then
        for _, name in ipairs(Tomba.RATE_LIMIT_HEADERS) do
            local val = response.headers[name]
            if val ~= nil then
                rate_limit[name] = val
            end
        end
    end
    return rate_limit
end


-- return module
return Tomba
