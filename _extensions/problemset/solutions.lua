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
      if quarto.doc.is_format("latex") then
        local beginEnv =
        '\\begin{tcolorbox}[enhanced jigsaw, left=2mm, breakable, opacityback=0, toptitle=1mm, titlerule=0mm, colbacktitle=blue!10!white, coltitle=black, colback=white, leftrule=.75mm, colframe=blue!50!black, title={Solution}, opacitybacktitle=0.6, bottomtitle=1mm, rightrule=.15mm, bottomrule=.15mm, toprule=.15mm, arc=.35mm]'
        local endEnv = '\n\\end{tcolorbox}'
        if #div.content > 0 and div.content[1].t == "Para" and div.content[#div.content].t == "Para" then
          table.insert(div.content[1].content, 1, pandoc.RawInline('tex', beginEnv .. "\n"))
          table.insert(div.content[#div.content].content, pandoc.RawInline('tex', "\n" .. endEnv))
        else
          table.insert(div.content, 1, pandoc.RawBlock('tex', beginEnv))
          table.insert(div.content, pandoc.RawBlock('tex', endEnv))
        end
      elseif quarto.doc.is_format("html") then
        local header = pandoc.Div(pandoc.Div("Solution", { class = 'callout-title-container flex-fill' }),
          { class = 'callout-header d-flex align-content-center' })
        div = pandoc.Div(div.content, { class = 'callout-body-container callout-body' })
        div = pandoc.Div(div, { class = 'callout callout-style-default callout-tip no-icon callout-titled' })
        table.insert(div.content, 1, header)

        -- else
        --   div = pandoc.BlockQuote(div.content,{class = 'callout'})
        --   table.insert(div.content, 1, pandoc.Strong("Solution"))
      end
      return div
    else
      return pandoc.Str('')
    end
  end
end

return {
  { Meta = parseMeta },
  { Div = parseSolutions }
}
