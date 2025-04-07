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
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({
        trig = "\\sc",
        desc = "section",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \section{<>}

        ]],
        { i(1) }
    )),

    s({
        trig = "\\ssc",
        desc = "subsection",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \subsection{<>}

        ]],
        { i(1) }
    )),

    s({
        trig = "\\sssc",
        desc = "subsubsection",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \subsubsection{<>}

        ]],
        { i(1) }
    )),

    s({
        trig = "it",
        desc = "italic",
    }, fmta(
        "\\textit{<>}",
        { i(1) }
    )),

    s({
        trig = "bld",
        desc = "bold",
    }, fmta(
        "\\textbf{<>}",
        { i(1) }
    )),

    s({
        trig = "emph",
        desc = "emph",
    }, fmta(
        "\\emph{<>}",
        { i(1) }
    )),

    s({
        trig = "ref",
        desc = "reference",
    }, fmta(
        "\\cref{<>}",
        { i(1) }
    )),

    s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
    fmta(
        [[\href{<>}{<>}]],
        {
            i(1, "url"),
            i(2, "display name"),
        }
        )
    ),

    s({
        trig = "beg",
        desc = "environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{<>}
                <>
            \end{<>}
        ]],
        {
            i(1),
            i(2),
            rep(1),  -- this node repeats insert node i(1)
        }
    )),

    s({
        trig = "nn",
        desc = "equation environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{equation*}
                <>
            \end{equation*}
        ]],
        {
            i(1),
        }
    )),

    s({
        trig = "nc",
        desc = "labelled equation environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{equation}\label{<>}
                <>
            \end{equation}
        ]],
        {
            i(1),i(2)
        }
    )),

    s({
        trig = "ng",
        desc = "gather environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{gather*}
                <>
            \end{gather*}
        ]],
        {
            i(1),
        }
    )),

    s({
        trig = "na",
        desc = "align environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{align*}
                <>
            \end{align*}
        ]],
        {
            i(1),
        }
    )),

    s({
        trig = "tke",
        desc = "inline math",
        snippetType = "autosnippet",
    }, fmta(
        "$<>$",
    {
        i(1),
    }
    )),
}