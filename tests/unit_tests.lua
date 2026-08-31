local tomba = require('tomba')

-- Load .env file into a table
local function load_env(path)
    local env = {}
    local f = io.open(path, "r")
    if not f then return env end
    for line in f:lines() do
        local key, value = line:match("^([%w_]+)%s*=%s*(.+)$")
        if key and value then
            env[key] = value
        end
    end
    f:close()
    return env
end

local dotenv = load_env(".env")

-- Helper: get env var from real env or .env file, ignoring empty strings
local function getenv(name)
    local val = os.getenv(name)
    if val and val ~= "" then return val end
    return dotenv[name]
end

-- Test credentials: from env/.env, or dummy values for unit tests
local TEST_KEY = getenv("TOMBA_API_KEY")
local TEST_SECRET = getenv("TOMBA_SECRET_KEY")

-- Whether we have real credentials for integration tests
local HAS_CREDENTIALS = (getenv("TOMBA_API_KEY") ~= nil)

describe("Tomba SDK", function()

    describe("Constructor", function()

        it("should create a client with valid credentials", function()
            local client = tomba:init(TEST_KEY, TEST_SECRET)
            assert.are.same(TEST_KEY, client.key)
            assert.are.same(TEST_SECRET, client.secret)
        end)

        it("should error on invalid API key", function()
            assert.has_error(function()
                tomba:init("ta_xxx", TEST_SECRET)
            end, "Invalid Tomba api key")
        end)

        it("should error on invalid API secret", function()
            assert.has_error(function()
                tomba:init(TEST_KEY, "ts_xxxx")
            end, "Invalid Tomba api secret")
        end)

    end)

    describe("Method existence", function()

        local methods = {
            -- HTTP methods
            "call", "post", "put", "delete_request",
            -- Core endpoints
            "account", "domain_search", "count", "status", "autocomplete",
            "email_finder", "enrichment", "author_finder", "linkedin_finder",
            "email_verifier", "email_sources",
            -- Phone
            "phone_finder", "phone_validator",
            -- Additional finders
            "email_format", "get_location", "similar", "technology",
            -- Clearbit-compatible
            "person_find", "company_find", "combined_find",
            -- Companies search
            "companies_search",
            -- Usage / Logs
            "usage", "logs",
            -- Keys
            "list_keys", "get_key", "create_key", "reset_key", "delete_key",
            -- Flags
            "list_flags", "create_flag",
            -- Leads
            "list_leads", "get_lead", "create_lead", "update_lead", "delete_lead",
            -- Leads Lists
            "list_leads_lists", "get_leads_list", "create_leads_list",
            "update_leads_list", "delete_leads_list",
            -- Attributes
            "list_attributes", "get_attribute", "create_attribute",
            "update_attribute", "delete_attribute",
            -- Bulk operations
            "list_bulks", "get_bulk", "launch_bulk", "delete_bulk",
            "archive_bulk", "rename_bulk", "bulk_progress", "bulk_download",
        }

        for _, method in ipairs(methods) do
            it("should have method: " .. method, function()
                assert.is_function(Tomba[method])
            end)
        end

    end)

    describe("Version", function()

        it("should have a VERSION defined", function()
            assert.is_string(Tomba.VERSION)
            assert.is_truthy(string.len(Tomba.VERSION) > 0)
        end)

    end)

end)

if HAS_CREDENTIALS then

    describe("Tomba SDK Integration", function()

        local client

        before_each(function()
            client = tomba:init(TEST_KEY, TEST_SECRET)
        end)

        it("should retrieve account info", function()
            local result = client:account()
            assert.is_table(result)
        end)

        it("should retrieve usage", function()
            local result = client:usage()
            assert.is_table(result)
        end)

        it("should search domain", function()
            local result = client:domain_search("tomba.io")
            assert.is_table(result)
        end)

        it("should get email count", function()
            local result = client:count("tomba.io")
            assert.is_table(result)
        end)

        it("should check domain status", function()
            local result = client:status("gmail.com")
            assert.is_table(result)
        end)

        it("should autocomplete company", function()
            local result = client:autocomplete("googl")
            assert.is_table(result)
        end)

        it("should find email", function()
            local result = client:email_finder("asana.com", "Dustin", "Moskovitz")
            assert.is_table(result)
        end)

        it("should verify email", function()
            local result = client:email_verifier("b.mohamed@tomba.io")
            assert.is_table(result)
        end)

    end)

else

    describe("Tomba SDK Integration", function()
        pending("No API credentials set (TOMBA_API_KEY / TOMBA_SECRET_KEY)")
    end)

end
