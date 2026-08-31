--- Tomba Email Sources Service
-- @see https://docs.tomba.io/api/finder

local Tomba = require("tomba.client")

--- Email Sources
-- Find email address source somewhere on the web.
-- @param email string Email address to find sources for.
-- @return table API response with sources.
-- @see https://docs.tomba.io/api/finder#get-email-sources
function Tomba:email_sources(email)
    return self:call(Tomba.SOURCES_PATH, { email = email })
end

return Tomba
