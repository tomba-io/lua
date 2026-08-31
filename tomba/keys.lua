--- Tomba API Keys Management Service
-- @see https://docs.tomba.io/api/keys

local Tomba = require("tomba.client")

--- List Keys
-- Retrieve a list of API keys.
-- @return table API response with API keys.
-- @see https://docs.tomba.io/api/keys#get-keys
function Tomba:list_keys()
    return self:call(Tomba.KEYS_PATH, nil)
end

--- Get Key
-- Retrieve details for a specific API key.
-- @param key_id string The ID of the API key.
-- @return table API response with key details.
-- @see https://docs.tomba.io/api/keys#get-keys-keyid
function Tomba:get_key(key_id)
    return self:call(Tomba.KEYS_PATH .. "/" .. key_id, nil)
end

--- Create Key
-- Create a new API key. The Free plan can create only one key.
-- @return table API response with created key.
-- @see https://docs.tomba.io/api/keys#post-keys
function Tomba:create_key()
    return self:post(Tomba.KEYS_PATH, {})
end

--- Reset Key
-- Reset (regenerate) a specific API key.
-- @param key_id string The ID of the API key.
-- @return table API response.
-- @see https://docs.tomba.io/api/keys#put-keys-keyid
function Tomba:reset_key(key_id)
    return self:put(Tomba.KEYS_PATH .. "/" .. key_id, {})
end

--- Delete Key
-- Delete a specific API key.
-- @param key_id string The ID of the API key.
-- @return table API response.
-- @see https://docs.tomba.io/api/keys#delete-an-api-keys-keyid
function Tomba:delete_key(key_id)
    return self:delete_request(Tomba.KEYS_PATH .. "/" .. key_id)
end

return Tomba
