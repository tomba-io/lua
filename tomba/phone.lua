--- Tomba Phone Service
-- @see https://docs.tomba.io/api/phone

local Tomba = require("tomba.client")

--- Phone Finder
-- Search for phone numbers based on an email, domain, or LinkedIn URL.
-- @param params table Parameters: email, domain, or linkedin (one required).
-- @return table API response with phone data.
-- @see https://docs.tomba.io/api/phone#get-phone-finder
function Tomba:phone_finder(params)
    return self:call(Tomba.PHONE_FINDER_PATH, params)
end

--- Phone Validator
-- Validate a phone number and retrieve its associated information.
-- @param phone string Phone number to validate (e.g., "+14155552671").
-- @param country_code string ISO 2-letter country code (optional, e.g., "US").
-- @return table API response with phone validation data.
-- @see https://docs.tomba.io/api/phone#get-phone-validator
function Tomba:phone_validator(phone, country_code)
    local params = { phone = phone }
    if country_code ~= nil then
        params.country_code = country_code
    end
    return self:call(Tomba.PHONE_VALIDATOR_PATH, params)
end

return Tomba
