-- add-url-pfx.lua
-- author: Christian Külker
-- 0.1.0 2024-03-13 Initial release to pankyll-pandoc

-- DESCRIPTION:
--   Add a base URL to all relative links

-- USAGE:
--   pandoc --metadata=pfx:<PATH> --lua-filter=add-url-pfx.lua \
--     -o out.html in.markdown

-- EXAMPLE:
--   cat i.markdown
--   Add prefix to [link](url) before 'url' directory.
--
--   pandoc --metadata=pfx:/TEST/ --lua-filter=add-url-pfx.lua \
--    -o o.html i.markdown
--
--   cat o.html
--   <p>Add prefix to <a href="/TEST/url">link</a> before ‘url’ directory.</p>
--

local pfx = '/view' -- base URL prefix

-- Get meta data and store it in the local (global) variable pfx
function Meta(meta)
    if meta.pfx then
      pfx = tostring(meta.pfx)
    else
      error("ERROR: Filter requires --metadata=pfx:PATH")
    end
end

function Link(el)
  -- Prepend pfx to the link target if it's a relative URL
  if not (el.target:match('^http://') or el.target:match('^https://') or el.target:match('^/')) then
    el.target = pfx .. el.target
  end
  return el
end

-- The traversal order for filters is:
--   1. functions for Inline elements
--   2. the Inlines filter function
--   3. functions for Block elements
--   4. the Blocks filter function
--   5. the Meta filter function, and last
--   6. the Pandoc filter function
-- So we need to change the traversal order for this filter
return {
  { Meta = Meta},
  { Link = Link}
}
