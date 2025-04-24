rockspec_format = "3.0"
package = "tomba"
version = "1.0.0-2"
source = {
   url = "git://github.com/tomba-io/lua.git"
}
description = {
   summary = "Official Lua library for Tomba Email Finder",
   detailed = [[
     Tomba: Tomba.io is an Email Finder for B2B sales and email marketing
     This is the Lua client library for the [Email Finder](https://tomba.io) API.
     It allows you to lookup the following details :
        -   [Domain Search](https://tomba.io/domain-search) (Search emails are based on the website You give one domain name and it returns all the email addresses found on the internet.)
        -   [Email Finder](https://tomba.io/email-finder) (This API endpoint generates or retrieves the most likely email address from a domain name, a first name and a last name..)
        -   [Author Finder](https://tomba.io/author-finder) (Instantly discover the email addresses of article authors.)
        -   [Enrichment](https://tomba.io/author-finder) (The Enrichment lets you find the current job title, company, location and social profiles of the person behind the email.)
        -   [Linkedin Finder](https://tomba.io/author-finder) (The Linkedin lets you find the current job title, company, location and social profiles of the person behind the linkedin URL.)
        -   [Email Verifier](https://tomba.io/email-verifier) (checks the deliverability of a given email address, verifies if it has been found in our database, and returns their sources.)
   ]],
   homepage = "https://tomba.io/",
   issues_url = "https://github.com/tomba-io/lua/issues",
   license = "Apache-2.0",
   maintainer = "info@tomba.io"
}
dependencies = {
   "lua >= 5.1",
   "lua-requests",
}
build = {
   type    = "builtin",
   modules = {
      ["tomba"] = "tomba/tomba.lua"
   }
}