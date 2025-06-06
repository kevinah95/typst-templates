


function Div(el)
  if el.identifier == "quote" then
    local blocks = pandoc.List({})
    -- Create the opening part of the quote with optional attribution
    local opening = '#quote(block: true'
    if el.attributes and el.attributes.attribution then
      opening = opening .. ', attribution: [' .. el.attributes.attribution .. ']'
    end
    -- Complete the opening with the starting bracket for content
    opening = opening .. ')['
    -- Add the opening to blocks
    blocks:insert(pandoc.RawBlock('typst', opening))
    -- Add the content
    blocks:extend(el.content)
    -- Close the quote
    blocks:insert(pandoc.RawBlock('typst', ']'))
    return blocks
  end
  if el.classes:includes('article') then
    local blocks = pandoc.List({
      pandoc.RawBlock('typst', '#article[')
    })
    blocks:extend(el.content)
    blocks:insert(pandoc.RawBlock('typst', ']\n'))
    return blocks
  end
end
