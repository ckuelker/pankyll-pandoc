-- links-md-to-html.lua
-- 2020-03-22
-- usage:
-- pandoc -f markdown -t html5 in.md -o out.html --lua-filter=links-md-to-html.lua
function Link(el)
  el.target = string.gsub(el.target, "%.md", ".html")
  return el
end
