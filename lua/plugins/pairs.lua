return {
    "echasnovski/mini.pairs",
    opts = {
        modes = { insert = true, command = true, terminal = false },
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
        mappings = {
            ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = "[^%a\\'].", register = { cr = false } },
        }
    },
}