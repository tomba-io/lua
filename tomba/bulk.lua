--- Tomba Bulk Operations Service
-- @see https://docs.tomba.io/api/bulks

local Tomba = require("tomba.client")

local VALID_TYPES = {
    search = true, similar = true, company = true,
    finder = true, enrich = true, linkedin = true,
    author = true, verifier = true,
    ["phone-finder"] = true, ["phone-validator"] = true,
}

local function validate_type(bulk_type)
    if not bulk_type or not VALID_TYPES[bulk_type] then
        error('Invalid bulk type: "' .. tostring(bulk_type)
            .. '". Must be one of: search, similar, company,'
            .. ' finder, enrich, linkedin, author, verifier,'
            .. ' phone-finder, phone-validator')
    end
end

--- List Bulks
-- Retrieve a list of bulk operations for the given type.
-- Type can be: search, finder, verifier, enrich, author, linkedin, company,
-- phone-finder, phone-validator, similar.
-- @param bulk_type string The bulk operation type.
-- @param params table Pagination parameters (page, limit) (optional).
-- @return table API response with bulk operations.
-- @see https://docs.tomba.io/api/bulks
function Tomba:list_bulks(bulk_type, params)
    validate_type(bulk_type)
    return self:call("/bulk/" .. bulk_type, params)
end

--- Get Bulk
-- Retrieve details of a specific bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @return table API response with bulk details.
-- @see https://docs.tomba.io/api/bulks
function Tomba:get_bulk(bulk_type, id)
    validate_type(bulk_type)
    return self:call("/bulk/" .. bulk_type .. "/" .. id, nil)
end

--- Launch Bulk
-- Launch a bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @return table API response.
-- @see https://docs.tomba.io/api/bulks
function Tomba:launch_bulk(bulk_type, id)
    validate_type(bulk_type)
    return self:put("/bulk/" .. bulk_type .. "/" .. id, {})
end

--- Delete Bulk
-- Delete a bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @return table API response.
-- @see https://docs.tomba.io/api/bulks
function Tomba:delete_bulk(bulk_type, id)
    validate_type(bulk_type)
    return self:delete_request("/bulk/" .. bulk_type .. "/" .. id .. "/delete")
end

--- Archive Bulk
-- Archive a bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @return table API response.
-- @see https://docs.tomba.io/api/bulks
function Tomba:archive_bulk(bulk_type, id)
    validate_type(bulk_type)
    return self:delete_request("/bulk/" .. bulk_type .. "/" .. id .. "/archive")
end

--- Rename Bulk
-- Rename a bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @param name string New name for the bulk operation.
-- @return table API response.
-- @see https://docs.tomba.io/api/bulks
function Tomba:rename_bulk(bulk_type, id, name)
    validate_type(bulk_type)
    return self:put("/bulk/" .. bulk_type .. "/" .. id .. "/rename", { name = name })
end

--- Bulk Progress
-- Get progress of a bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @return table API response with progress data.
-- @see https://docs.tomba.io/api/bulks
function Tomba:bulk_progress(bulk_type, id)
    validate_type(bulk_type)
    return self:call("/bulk/" .. bulk_type .. "/" .. id .. "/progress", nil)
end

--- Bulk Download
-- Download results of a bulk operation.
-- @param bulk_type string The bulk operation type.
-- @param id string The bulk operation ID.
-- @return table API response with download data.
-- @see https://docs.tomba.io/api/bulks
function Tomba:bulk_download(bulk_type, id)
    validate_type(bulk_type)
    return self:call("/bulk/" .. bulk_type .. "/" .. id .. "/download", nil)
end

return Tomba
