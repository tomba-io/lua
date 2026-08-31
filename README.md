# [<img src="https://tomba.io/logo.svg" alt="Tomba" width="25"/>](https://tomba.io/) Tomba Lua SDK

> The #1 Rated Email Intelligence Platform — Find professional emails with unmatched accuracy.

[![LuaRocks](https://img.shields.io/luarocks/v/benemohamed/tomba.svg)](https://luarocks.org/modules/benemohamed/tomba)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tomba-io/lua/ci.yml?branch=main)](https://github.com/tomba-io/lua/actions)

Official Lua client library for the [Tomba.io](https://tomba.io) Email Finder API.

## About Tomba

[Tomba.io](https://tomba.io) is the #1 rated email intelligence platform, trusted by **150,000+ sales teams** worldwide.

- **Best Email Finder** — 98% accuracy, ranked #1 in independent benchmarks
- **Best Email Verification** — Real-time SMTP verification with catch-all detection
- **Best Phone Finder** — Direct dial numbers linked to professional emails
- **Best Domain Search** — 450M+ verified contacts across all industries
- **81% Coverage** — The highest in the industry, proven in 5,000-lead independent tests

### Why Tomba?

| Feature             | Tomba              | Others        |
| ------------------- | ------------------ | ------------- |
| Email Coverage      | **81%**            | 30-60%        |
| Verification        | **Real-time SMTP** | Pattern-based |
| Phone Numbers       | **Direct dials**   | Limited       |
| Catch-all Detection | **AI-powered**     | Basic         |
| API Rate Limits     | **Generous**       | Restrictive   |

[Get your free API key](https://app.tomba.io/auth/register) — No credit card required.

## Installation

Install via [LuaRocks](https://luarocks.org/modules/benemohamed/tomba):

```bash
luarocks install tomba
```

## Authentication

Sign up for a free account at [https://app.tomba.io/auth/register](https://app.tomba.io/auth/register) to get your API key and secret.

```lua
local Tomba = require("tomba")

local client = Tomba:init("ta_xxxx", "ts_xxxx")
```

## Quick Start

```lua
local Tomba = require("tomba")

local client = Tomba:init("ta_xxxx", "ts_xxxx")

-- Search emails by domain
local result = client:domain_search("example.com")

-- Find an email address
local result = client:email_finder("example.com", "John", "Doe")

-- Verify an email
local result = client:email_verifier("john@example.com")
```

## Services

### Account

Get information about the current account.

```lua
local result = client:account()
```

### Domain Search

Search emails based on a website domain.

```lua
local result = client:domain_search("example.com")
```

### Email Finder

Find the most likely email address from a domain, first name, and last name.

```lua
local result = client:email_finder("example.com", "John", "Doe")
```

### Email Verifier

Verify the deliverability of an email address.

```lua
local result = client:email_verifier("john@example.com")
```

### Author Finder

Find the email address of an article author from a blog post URL.

```lua
local result = client:author_finder("https://clearbit.com/blog/company-name-to-domain-api")
```

### LinkedIn Finder

Find the email address associated with a LinkedIn profile URL.

```lua
local result = client:linkedin_finder("https://www.linkedin.com/in/alex-maccaw-ab592978")
```

### Email Enrichment

Look up person and company data based on an email address.

```lua
local result = client:enrichment("john@example.com")
```

### Phone Finder

Find the phone number associated with an email address.

```lua
local result = client:phone_finder("john@example.com")
```

### Phone Validator

Validate a phone number.

```lua
local result = client:phone_validator("+1234567890")
```

### Email Count

Get the number of email addresses found for a domain.

```lua
local result = client:count("example.com")
```

### Domain Status

Check if a domain is webmail, disposable, or a regular email provider.

```lua
local result = client:status("example.com")
```

### Domain Suggestions

Auto-complete company names and get domain suggestions.

```lua
local result = client:autocomplete("google")
```

### Email Sources

Find web sources where an email address has been found.

```lua
local result = client:email_sources("john@example.com")
```

### Email Format

Get the email format pattern used by a domain.

```lua
local result = client:email_format("example.com")
```

### Similar

Find domains similar to a given domain.

```lua
local result = client:similar("example.com")
```

### Technology

Discover technologies used by a domain.

```lua
local result = client:technology("example.com")
```

### Location

Get the employee location breakdown for a domain.

```lua
local result = client:location("example.com")
```

### Person API

Get person data from an email address (Clearbit-compatible).

```lua
local result = client:person_find("john@example.com")
```

### Company API

Get company data from a domain (Clearbit-compatible).

```lua
local result = client:company_find("example.com")
```

### Combined API

Get combined person and company data from an email address (Clearbit-compatible).

```lua
local result = client:combined_find("john@example.com")
```

### Companies Search (Reveal)

Search companies using natural language queries or structured filters (location, industry, size, technologies, and more).

```lua
local result = client:companies_search({ query = "Real Estate in Europe", page = 1 })
```

### Usage

Get your account's monthly API usage statistics.

```lua
local result = client:usage()
```

### Logs

Get your account's API request logs.

```lua
local result = client:logs()
```

### Keys

Manage your API keys.

```lua
-- List all keys
local result = client:list_keys()

-- Get a specific key
local result = client:get_key("key_id")

-- Create a new key
local result = client:create_key()

-- Reset a key
local result = client:reset_key("key_id")

-- Delete a key
local result = client:delete_key("key_id")
```

### Flag

Report incorrect email data.

```lua
-- List submitted flags
local result = client:list_flags({})

-- Create a flag
local result = client:create_flag({
    email = "john@example.com",
    reason = "invalid"
})
```

### Leads

Manage leads in your Tomba CRM.

```lua
-- List leads
local result = client:list_leads({})

-- Get a specific lead
local result = client:get_lead("lead_id")

-- Create a lead
local result = client:create_lead({
    email = "lead@example.com",
    first_name = "John",
    last_name = "Doe"
})

-- Update a lead
local result = client:update_lead("lead_id", {
    first_name = "Jane"
})

-- Delete a lead
local result = client:delete_lead("lead_id")
```

### Leads Lists

Manage lead lists for organizing your leads.

```lua
-- List all lead lists
local result = client:list_leads_lists()

-- Get a specific list
local result = client:get_leads_list("list_id")

-- Create a list
local result = client:create_leads_list({ name = "My List" })

-- Update a list
local result = client:update_leads_list("list_id", { name = "Updated Name" })

-- Delete a list
local result = client:delete_leads_list("list_id")
```

### Leads Attributes

Manage custom attributes for your leads.

```lua
-- List all attributes
local result = client:list_attributes()

-- Get a specific attribute
local result = client:get_attribute("attr_id")

-- Create an attribute
local result = client:create_attribute({ name = "Company Size" })

-- Update an attribute
local result = client:update_attribute("attr_id", { name = "Updated Name" })

-- Delete an attribute
local result = client:delete_attribute("attr_id")
```

### Bulk Operations

Create and manage bulk processing jobs for domain search, email finder, verifier, and more.

```lua
-- List bulk operations
local result = client:list_bulks("domain-search", {})

-- Get a specific bulk operation
local result = client:get_bulk("domain-search", "bulk_id")

-- Launch a bulk operation
local result = client:launch_bulk("domain-search", "bulk_id")

-- Get progress
local result = client:bulk_progress("domain-search", "bulk_id")

-- Download results
local result = client:bulk_download("domain-search", "bulk_id")

-- Rename a bulk operation
local result = client:rename_bulk("domain-search", "bulk_id", "New Name")

-- Archive a bulk operation
local result = client:archive_bulk("domain-search", "bulk_id")

-- Delete a bulk operation
local result = client:delete_bulk("domain-search", "bulk_id")
```

Supported bulk types: `domain-search`, `email-finder`, `author-finder`, `email-verifier`, `enrichment`, `linkedin-finder`, `phone-finder`, `department-search`, `technology-search`, `name-finder`.

## Testing

```bash
busted
```

## Documentation

- [Official API Documentation](https://docs.tomba.io/)
- [LuaRocks Package](https://luarocks.org/modules/benemohamed/tomba)
- [API Reference](https://docs.tomba.io/api)
- [All Client Libraries](https://docs.tomba.io/libraries)

## About Tomba

Founded to solve the problem of unreliable email data, [Tomba.io](https://tomba.io) is the leading B2B email intelligence platform.

### Products

- **[Email Finder](https://tomba.io/email-finder)** — Find any professional email address
- **[Email Verifier](https://tomba.io/email-verifier)** — Verify emails in real-time
- **[Domain Search](https://tomba.io/domain-search)** — Find all emails for a company
- **[Phone Finder](https://tomba.io/phone-finder)** — Find direct phone numbers
- **[Bulk Enrichment](https://tomba.io/bulks)** — Enrich contacts at scale
- **[AI Company Search](https://tomba.io/reveal)** — Find companies with AI-powered search
- **[CLI](https://tomba.io/cli)** — Command-line interface for Tomba
- **[MCP Server](https://tomba.io/mcp)** — Connect AI tools (Claude, ChatGPT, Cursor) to Tomba
- **[REST API](https://tomba.io/api)** — Full programmatic access

### Browser Extensions & Add-ons

- **[Chrome Extension](https://chromewebstore.google.com/detail/tomba-email-finder-email/icmjegjggphchjckknoooajmklibccjb)** — Find emails while browsing
- **[Google Sheets Add-on](https://tomba.io/sheets)** — Enrich leads in spreadsheets
- **[Microsoft Excel Add-in](https://tomba.io/excel)** — Email finder in Excel
- **[Airtable Integration](https://tomba.io/airtable)** — Connect with Airtable

### Integrations

50+ CRM integrations: [Salesforce](https://tomba.io/integrations) · [HubSpot](https://tomba.io/integrations) · [Zapier](https://tomba.io/integrations) · [Pipedrive](https://tomba.io/integrations) · [and more...](https://tomba.io/integrations)

### Other Tomba SDKs

| Language | Package                                                     |
| -------- | ----------------------------------------------------------- |
| Node.js  | [tomba](https://www.npmjs.com/package/tomba)                |
| Python   | [tomba-io](https://pypi.org/project/tomba-io/)              |
| PHP      | [tomba-io/php](https://packagist.org/packages/tomba-io/php) |
| Ruby     | [tomba](https://rubygems.org/gems/tomba)                    |
| Go       | [tomba-io/go](https://pkg.go.dev/github.com/tomba-io/go)    |
| Rust     | [tomba](https://crates.io/crates/tomba)                     |
| Dart     | [tomba](https://pub.dev/packages/tomba)                     |
| Deno     | [@tomba/sdk](https://jsr.io/@tomba/sdk)                     |
| Elixir   | [tomba](https://hex.pm/packages/tomba)                      |
| C#       | [Tomba](https://www.nuget.org/packages/Tomba)               |
| Perl     | [Tomba::Client](https://metacpan.org/pod/Tomba::Client)     |
| Lua      | [tomba](https://luarocks.org/modules/tomba/tomba)           |
| R        | [tomba](https://github.com/tomba-io/r)                      |

### Resources

- [Blog](https://tomba.io/blog) · [Help Center](https://help.tomba.io) · [API Docs](https://docs.tomba.io) · [Pricing](https://tomba.io/pricing) · [Status](https://status.tomba.io)

---

**[Try Tomba Free](https://app.tomba.io/auth/register)** — Find your first email in seconds. No credit card required.

## License

Apache 2.0 -- see [LICENSE](http://www.apache.org/licenses/LICENSE-2.0.html) for details.
