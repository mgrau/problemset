local show_solutions = false

local function parseMeta(meta)
  show_solutions = meta['solutions']
end

local function parseSolutions(el)
  if el.classes:includes('sol') then
    if show_solutions then
      return quarto.Callout({
        type = 'note',
        title = 'Solution',
        content = el.content,
        icon = "false",
        collapse = true
      })
    else
      return pandoc.Str('')
    end
  end
end

return {
  { Meta = parseMeta },
  { Div = parseSolutions }
}
