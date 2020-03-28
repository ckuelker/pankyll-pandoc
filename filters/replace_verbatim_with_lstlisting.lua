-- replace_verbatim_with_lstlisting.lua
-- 2020-03-22
--
-- Block of code.
--
-- Values of this type can be created with the pandoc.CodeBlock constructor.
--
-- Fields:
--
--  text
--      code string (string)
--  attr
--      element attributes (Attr)
--  identifier
--      alias for attr.identifier (string)
--  classes
--      alias for attr.classes (List of strings)
--  attributes
--      alias for attr.attributes (Attributes)
--  tag, t
--      the literal CodeBlock (string)

local function CodeBlock (elem)

      if elem.c[1][2][1] == nil then
          return pandoc.RawBlock("latex", "\n\\begin{lstlisting}[style=pankyllListingStyle]\n"..elem.text.."\n\\end{lstlisting}\n")
      else
        return elem
      end
end

return { { CodeBlock = CodeBlock } }
