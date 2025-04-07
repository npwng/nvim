local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
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
    trig = "//",
    desc = "fraction",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "\\frac{<>}{<>}",
    { i(1),i(2) }
  )),

  s({
    trig = "==",
    desc = "align equals",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "&= <> \\\\",
    { i(1) }
  )),


  s({
    trig = "/s/",
    desc = "sfraction",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "\\sfrac{<>}{<>}",
    { i(1),i(2) }
  )),

  s({
    trig = "sb",
    desc = "subscript",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "_{<>}",
    { i(1) }
  )),

  s({
    trig = "td",
    desc = "superscript",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "^{<>}",
    { i(1) }
  )),

  s({
    trig = "ot",
    desc = "cdot",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
    }, {
        t("\\cdot ")
  }),

  s(
    {
      -- 'blr(.)(.)' captures exactly 2 characters after 'blr'
      trig = "blr(.)(.)",
      regTrig = true,
      wordTrig = false,
      priority = 100,
      condition = in_mathzone, 
      desc = "Match any two chars after 'blr' and wrap them in \\left...\\right... with size choice",
    },
    fmta(
      "\\<>l<lcap> <> \\<>r<rcap>",
      {
        lcap = f(function(_, snip)
          return snip.captures[1]
        end, {}),
        rcap = f(function(_, snip)
          return snip.captures[2]
        end, {}),
        c(1, {
          t("big"),
          t("Big"),
          t("bigg"),
          t("Bigg"),
        }),
        i(2) ,
        rep(1),  
      }
    )
  ),

  s(
    {
      -- 'lr(.)(.)' captures exactly 2 characters after 'lr'
      trig = "lr(.)(.)",
      regTrig = true,
      wordTrig = false,
      priority = 10,
      condition = in_mathzone, 
      desc = "Match any two chars after 'lr' and wrap them in \\left...\\right...",
    },
    {
      -- \leftX
      t("\\left"),
      f(function(_, snip)
        -- snip.captures[1] is the 1st capture group (the 3rd character typed)
        return snip.captures[1]
      end, {}),
      t(" "),       -- a small space or omit it if you prefer none
      i(1),         -- snippet content
      t(" \\right"),
      f(function(_, snip)
        -- snip.captures[2] is the 2nd capture group (the 4th character typed)
        return snip.captures[2]
      end, {}),
      i(0),
    }
  ),

    s({trig=";I",snippetType="autosnippet",desc="integral with infinite or inserted limits",wordTrig=false},
    fmta([[
        <>
        ]],
        {
        c(1,{
            t("\\int_{-\\infty}^\\infty"),
            sn(nil,fmta([[ \int_{<>}^{<>} ]],{i(1),i(2)})),
            })
        }
    )
  ),


  s({
    trig = "([^\\])cos",
    desc = "cos",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>\\cos",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
    }
  )),

  s({
    trig = "([^\\])sin",
    desc = "sin",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>\\sin",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
    }
  )),

  s({
    trig = "([^\\])tan",
    desc = "tan",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>\\tan",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
    }
  )),

  s({
    trig = "([^\\])sum",
    desc = "sum",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>\\sum_{<>}^{<>}",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
      i(1, "n-1"), i(2, "\\infty")
    }
  )),

  s({
    trig = "([^\\])int",
    desc = "integral",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>\\int_{<>}^{<>}",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
      i(1, "-\\infty"), i(2, "\\infty")
    }
  )),

  s({
    trig = "([^\\])sq",
    desc = "square root",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>\\sqrt{<>}",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
      i(1)
    }
  )),

  s({
    trig = "([^\\])abs",
    desc = "absolute",
    regTrig = true,
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "<char>|<>|",
    { 
      char = f(function(_, snip)
        return snip.captures[1]
      end, {}),
      i(1)
    }
  )),

  s({
    trig = "umb",
    desc = "underbrace",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "\\underbrace{<>}_{<>}",
    { i(1),i(2) }
  )),

  s({
    trig = "fu",
    desc = "function",
    snippetType = "autosnippet",
    condition = in_mathzone,
    wordTrig = false,
  }, fmta(
    "(<>)",
    { i(1) }
  )),

  s({
    trig = "si",
    desc = "siunitx",
    condition = in_mathzone,
  }, fmta(
    "\\si{<>}{<>}",
    { i(1),i(2) }
  )),

}