local show_solutions = false

local function parseMeta(meta)
  if quarto.doc.is_format("latex") then
    quarto.doc.use_latex_package("tcolorbox", "skins,breakable")
  end
  show_solutions = meta['solutions']
end

local function parseSolutions(div)
  if div.classes:includes("ps-solution") then
    if show_solutions then
      return quarto.Callout({
        type = 'note',
        title = 'Solution',
        content = div.content,
        icon = "false",
        collapse = false
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
