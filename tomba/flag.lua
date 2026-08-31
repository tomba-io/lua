--- Tomba Flag Service
-- @see https://docs.tomba.io/api/flag

local Tomba = require("tomba.client")

--- List Flags
-- Returns a paginated list of data flags submitted by the authenticated user.
-- @param params table Pagination parameters (page, limit) (optional).
-- @return table API response with flags.
-- @see https://docs.tomba.io/api/flag#get-flag
function Tomba:list_flags(params)
    return self:call(Tomba.FLAG_PATH, params)
end

--- Create Flag
-- Report incorrect data such as hard bounces, invalid emails, or wrong organization info.
-- @param body table Flag data: flag_type, value, reason, comment.
-- @return table API response with created flag.
-- @see https://docs.tomba.io/api/flag#post-flag
function Tomba:create_flag(body)
    return self:post(Tomba.FLAG_PATH, body)
end

return Tomba
