--- Tomba Leads Lists Management Service
-- @see https://docs.tomba.io/api/lead-lists

local Tomba = require("tomba.client")

--- List Leads Lists
-- Retrieve a list of leads lists.
-- @return table API response with leads lists.
-- @see https://docs.tomba.io/api/lead-lists#get-leads_lists
function Tomba:list_leads_lists()
    return self:call(Tomba.LEADS_LISTS_PATH, nil)
end

--- Get Leads List
-- Retrieve details of a specific leads list.
-- @param list_id string The ID of the leads list.
-- @return table API response with list details.
-- @see https://docs.tomba.io/api/lead-lists#get-leads_lists-listid
function Tomba:get_leads_list(list_id)
    return self:call(Tomba.LEADS_LISTS_PATH .. "/" .. list_id, nil)
end

--- Create Leads List
-- Create a new leads list.
-- @param body table Leads list data (name, etc.).
-- @return table API response with created list.
-- @see https://docs.tomba.io/api/lead-lists#post-leads_lists
function Tomba:create_leads_list(body)
    return self:post(Tomba.LEADS_LISTS_PATH, body)
end

--- Update Leads List
-- Update a specific leads list.
-- @param list_id string The ID of the leads list.
-- @param body table Updated list fields.
-- @return table API response with updated list.
-- @see https://docs.tomba.io/api/lead-lists#put-leads_lists-listid
function Tomba:update_leads_list(list_id, body)
    return self:put(Tomba.LEADS_LISTS_PATH .. "/" .. list_id, body)
end

--- Delete Leads List
-- Delete a specific leads list.
-- @param list_id string The ID of the leads list.
-- @return table API response.
-- @see https://docs.tomba.io/api/lead-lists#delete-leads_lists-listid
function Tomba:delete_leads_list(list_id)
    return self:delete_request(Tomba.LEADS_LISTS_PATH .. "/" .. list_id)
end

return Tomba
