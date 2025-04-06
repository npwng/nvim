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
local tex_utils = {}
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env('itemize')
end


return {
    s({
        trig = "table",
        desc = "Table environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{table}[<>]
                \centering
                \caption{<>}
                \label{<>}
                \begin{tabular}{<>}
                <>
                \end{tabular}
            \end{table}
        ]],
        {
            i(1),i(2),i(3),i(4),i(5),
        }
    )),

    s({
        trig = "fig",
        desc = "figure environment",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
            \begin{table}[<>]
                \centering
                \caption{<>}
                \label{<>}
                \begin{tabular}{<>}
                <>
                \end{tabular}
            \end{table}
        ]],
        {
            i(1),i(2),i(3),i(4),i(5),
        }
    )),

    s({
        trig = "ite",
        desc = "itemize environment",
        snippetType = "autosnippet",
        condition = line_begin and tex_utils.in_itemize
    }, fmta(
        [[
            \item <>
        ]],
        {
            i(1),
        }
    )),

    s({
        trig = "split",
        desc = "split",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
        \begin{figure}[H]
            \begin{minipage}{0.45\textwidth}
                <>
            \end{minipage}
            \hfill
            \begin{minipage}{0.45\textwidth}
                <>
            \end{minipage}
        \end{figure}
        ]],
        {
            i(1),i(2)
        }
    )),

    s({
        trig = "plot",
        desc = "pgfplot",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
        \begin{figure}[H]
            \centering
            \begin{tikzpicture}
                \begin{axis}[
                    title={--Title--},
                    xlabel={--x Label--},
                    ylabel={--y Label--},
                    legend pos=north west,
                    ymajorgrids=true,
                    grid style=dashed,
                    clip mode=individual,
                    width=20em,
                    height=20em,
                ]
                
                % For plots of discrete values
                \addplot[
                    only marks,
                    color=red,
                    mark=x,
                    on layer=background,
                    ]
                    coordinates {
                };
                \addlegendentry{legne 1}

                % For equation plot
                \addplot[
                        color=blue,
                        samples=2,
                        %line width=0.25mm,
                        %domain=0.003:0.983,
                        on layer=foreground,
                ]
                {equation};
                \addlegendentry{legne 1}

                \end{axis}
            \end{tikzpicture}
            \caption{--Caption Here--}
        \end{figure}
        endsnippet
        ]],
        { }
    )),

    s({
        trig = "csvplot",
        desc = "pgfplot",
        snippetType = "autosnippet",
        condition = line_begin
    }, fmta(
        [[
        \begin{figure}[H]
            \centering
            \begin{tikzpicture}
                \begin{axis}[
                    title={--Title--},
                    xlabel={--x Label--},
                    ylabel={--y Label--},
                    legend pos=north west,
                    ymajorgrids=true,
                    grid style=dashed,
                    clip mode=individual,
                    width=20em,
                    height=20em,
                ]
                
                % For plots of discrete values
                \addplot[
                    only marks,
                    color=red,
                    mark=x,
                    on layer=background,
                    ]table[
                        col sep=comma,
                        header=true,
                        x=col1,
                        y=col2,
                        %header=false,
                        %x index=0,
                        %y index=1,
                    ] {};
                \addlegendentry{legne 1}

                % For equation plot
                \addplot[
                        color=blue,
                        samples=2,
                        %line width=0.25mm,
                        %domain=0.003:0.983,
                        on layer=foreground,
                ]
                {equation};
                \addlegendentry{legne 1}

                \end{axis}
            \end{tikzpicture}
            \caption{--Caption Here--}
        \end{figure}
        endsnippet
        ]],
        { }
    )),
}