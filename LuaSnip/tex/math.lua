local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- If you're using vimtex, define a helper function:
local function in_mathzone()
  -- This returns `1` if in math zone, `0` otherwise.
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end


return {
  s({
    trig = "//",
    desc = "fraction",
    snippetType = "autosnippet",
    condition = in_mathzone,  -- <--- only expand in math
  }, {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    i(0),
  }),
  }