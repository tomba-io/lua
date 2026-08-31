--- Tomba Leads Management Service
-- @see https://docs.tomba.io/api/leads

local Tomba = require("tomba.client")

--- List Leads
-- Retrieve a paginated list of leads. Optionally filter by domain.
-- @param params table Query parameters: domain, page, limit (optional).
-- @return table API response with leads.
-- @see https://docs.tomba.io/api/leads#retrieve-a-single-leads
function Tomba:list_leads(params)
    return self:call(Tomba.LEADS_PATH, params)
end

--- Get Lead
-- Retrieve detailed information for a specific lead.
-- @param lead_id string The ID of the lead.
-- @return table API response with lead details.
-- @see https://docs.tomba.io/api/leads#retrieve-a-single-leads-leadid
function Tomba:get_lead(lead_id)
    return self:call(Tomba.LEADS_PATH .. "/" .. lead_id, nil)
end

--- Create Lead
-- Create a new lead. If the email already exists, fails with 422 status code.
-- @param body table Lead data: email (required), first_name, last_name, company, etc.
-- @return table API response with created lead.
-- @see https://docs.tomba.io/api/leads#post-leads
function Tomba:create_lead(body)
    return self:post(Tomba.LEADS_PATH, body)
end

--- Update Lead
-- Update the fields of a lead using its ID.
-- @param lead_id string The ID of the lead.
-- @param body table Updated lead fields.
-- @return table API response with updated lead.
-- @see https://docs.tomba.io/api/leads#put-leads-leadid
function Tomba:update_lead(lead_id, body)
    return self:put(Tomba.LEADS_PATH .. "/" .. lead_id, body)
end

--- Delete Lead
-- Delete a lead using its ID.
-- @param lead_id string The ID of the lead.
-- @return table API response.
-- @see https://docs.tomba.io/api/leads#delete-a-leads-leadid
function Tomba:delete_lead(lead_id)
    return self:delete_request(Tomba.LEADS_PATH .. "/" .. lead_id)
end

return Tomba
