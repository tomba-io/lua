--- Tomba Companies Search (Reveal) Service
-- @see https://docs.tomba.io/api/reveal

local Tomba = require("tomba.client")

--- Companies Search
-- Search for companies using natural language queries or structured filters.
-- @param body table Search parameters (query or filters).
-- @return table API response with company results.
-- @see https://docs.tomba.io/api/reveal#post-reveal-search
function Tomba:companies_search(body)
    return self:post(Tomba.COMPANIES_SEARCH_PATH, body)
end

return Tomba
