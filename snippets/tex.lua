local ls = require("luasnip")
local s = ls.s
local i = ls.i -- insert node
local t = ls.t -- text node

local snippets, autosnippets = {}, {}

-- quick text
local mathbb = s("mbb", {
    t("\\mathbb{"),
    i(1),
    t("}"),
    i(2),
})

local frac = s("frac", {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
    i(3),
})

local under = s("under", {
    i(1),
    t("_{"),
    i(2),
    t("}"),
    i(3),
})

local upper = s("upper", {
    i(1),
    t("^{"),
    i(2),
    t("}"),
    i(3),
})

local rarrow_inline = s("rarrow_line", { t("$\\Rightarrow$ ") })
local rarrow = s("rarrow", { t("\\Rightarrow ") })

local bmatrix = s("bmatrix", {
    t({ "\\begin{bmatrix}", "" }),
    i(1),
    t(" & "),
    i(2),
    t({ "", "\\end{bmatrix}", "" }),
})

local emptyset_inline = s("emptyset_inline", { t("$\\emptyset$ ") })
local emptyset = s("emptyset", { t("\\emptyset ") })

local section = s("sect", {
    t("\\section{"),
    i(1),
    t({ "}", "" }),
    i(2),
})

local subsection = s("subs", {
    t("\\subsection{"),
    i(1),
    t({ "}", "" }),
    i(2),
})

local subsubsection = s("subs2", {
    t("\\subsubsection{"),
    i(1),
    t({ "}", "" }),
    i(2),
})
table.insert(snippets, mathbb)
table.insert(snippets, frac)
table.insert(snippets, under)
table.insert(snippets, upper)
table.insert(snippets, rarrow)
table.insert(snippets, rarrow_inline)
table.insert(snippets, emptyset_inline)
table.insert(snippets, emptyset)
table.insert(snippets, bmatrix)
table.insert(snippets, section)
table.insert(snippets, subsection)
table.insert(snippets, subsubsection)

return snippets, autosnippets
