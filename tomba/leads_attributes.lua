--- Tomba Lead Attributes Management Service
-- @see https://docs.tomba.io/api/lead-attributes

local Tomba = require("tomba.client")

--- List Attributes
-- Retrieve a list of lead attributes.
-- @return table API response with lead attributes.
-- @see https://docs.tomba.io/api/lead-attributes#get-attributes
function Tomba:list_attributes()
    return self:call(Tomba.ATTRIBUTES_PATH, nil)
end

--- Get Attribute
-- Retrieve details for a specific lead attribute.
-- @param attribute_id string The ID of the lead attribute.
-- @return table API response with attribute details.
-- @see https://docs.tomba.io/api/lead-attributes#get-attributes-attributeid
function Tomba:get_attribute(attribute_id)
    return self:call(Tomba.ATTRIBUTES_PATH .. "/" .. attribute_id, nil)
end

--- Create Attribute
-- Create a new lead attribute.
-- @param body table Attribute data: name (required), type (required: string, date, number).
-- @return table API response with created attribute.
-- @see https://docs.tomba.io/api/lead-attributes#post-attributes
function Tomba:create_attribute(body)
    return self:post(Tomba.ATTRIBUTES_PATH, body)
end

--- Update Attribute
-- Update a lead attribute.
-- @param attribute_id string The ID of the lead attribute.
-- @param body table Updated attribute fields: name, type.
-- @return table API response.
-- @see https://docs.tomba.io/api/lead-attributes#put-attributes-attributeid
function Tomba:update_attribute(attribute_id, body)
    return self:put(Tomba.ATTRIBUTES_PATH .. "/" .. attribute_id, body)
end

--- Delete Attribute
-- Delete a specific lead attribute.
-- @param attribute_id string The ID of the lead attribute.
-- @return table API response.
-- @see https://docs.tomba.io/api/lead-attributes#delete-attributes-attributeid
function Tomba:delete_attribute(attribute_id)
    return self:delete_request(Tomba.ATTRIBUTES_PATH .. "/" .. attribute_id)
end

return Tomba
