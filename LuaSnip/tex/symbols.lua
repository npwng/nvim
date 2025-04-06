local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- If you're using vimtex, define a helper function:
local function in_mathzone()
    -- This returns `1` if in math zone, `0` otherwise.
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end


return {
    s({
        trig = "lda",
        desc = "lambda",
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, {
            t("\\lambda ")
    }),

    s({
        trig = "([^\\])rho",
        desc = "rho",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\rho ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "sga",
        desc = "sigma",
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, {
            t("\\sigma ")
    }),

    s({
        trig = "([^\\])theta",
        desc = "theta",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\theta ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "([^\\])Theta",
        desc = "capital theta",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\Theta ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "([^\\])mu",
        desc = "mu",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\mu ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "([^\\])pi",
        desc = "pi",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\pi ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "([^\\])xi",
        desc = "xi",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\xi ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "([^\\])eta",
        desc = "eta",
        regTrig = true,
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, fmta(
        "<char>\\eta ",
        { 
            char = f(function(_, snip)
                return snip.captures[1]
            end, {}),
        }
    )),

    s({
        trig = "aph",
        desc = "alpha",
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, {
            t("\\alpha ")
    }),

    s({
        trig = "oma",
        desc = "omega",
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, {
            t("\\omega ")
    }),

    s({
        trig = "deg",
        desc = "degrees",
        snippetType = "autosnippet",
        condition = in_mathzone,
        wordTrig = false,
        }, {
            t("^{\\cdot} ")
    }),
}