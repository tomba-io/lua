--- Tomba Email Verifier Service
-- @see https://docs.tomba.io/api/verifier

local Tomba = require("tomba.client")

--- Email Verifier
-- Verify the deliverability of an email address.
-- @param email string Email address to verify.
-- @return table API response with verification result.
-- @see https://docs.tomba.io/api/verifier#get-email-verifier
function Tomba:email_verifier(email, opts)
    local params = { email = email }
    if opts ~= nil then
        if opts.webhook_url ~= nil then params.webhook_url = opts.webhook_url end
    end
    return self:call(Tomba.VERIFIER_PATH, params)
end

return Tomba
