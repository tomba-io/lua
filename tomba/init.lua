--- Tomba Email Finder Lua SDK
-- Official Lua client library for the Tomba.io Email Finder API.
-- Entry point: loads the core client and all service modules.
-- @author    Mohamed Ben rebia <b.mohamed@tomba.io>
-- @copyright Apache-2.0
-- @release   1.1.0
-- @see       https://tomba.io/
-- @see       https://docs.tomba.io/

local Tomba = require("tomba.client")

-- Load all service modules (each attaches methods to the Tomba class)
require("tomba.account")
require("tomba.domain")
require("tomba.finder")
require("tomba.verifier")
require("tomba.phone")
require("tomba.count")
require("tomba.status")
require("tomba.sources")
require("tomba.format")
require("tomba.similar")
require("tomba.technology")
require("tomba.location")
require("tomba.enrichment")
require("tomba.reveal")
require("tomba.keys")
require("tomba.usage")
require("tomba.logs")
require("tomba.flag")
require("tomba.leads")
require("tomba.leads_lists")
require("tomba.leads_attributes")
require("tomba.bulk")

return Tomba
