-- Luacheck configuration for Tomba Lua SDK
std = "lua51+lua52+lua53+luajit"

-- Global objects
globals = {
    "Tomba",
}

read_globals = {
    "describe",
    "it",
    "before_each",
    "after_each",
    "setup",
    "teardown",
    "assert",
    "spy",
    "stub",
    "mock",
    "pending",
}

-- Allow unused self in methods
self = false

-- Max line length
max_line_length = 120

-- Max cyclomatic complexity
max_cyclomatic_complexity = 15

-- Files to check
include_files = {
    "tomba/**/*.lua",
    "tests/**/*.lua",
}

-- Files to exclude
exclude_files = {
    "lua_modules/**",
    ".luarocks/**",
}
