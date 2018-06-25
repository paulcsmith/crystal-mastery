class ExceptionPage::Styles
  # accent = "#e57310"
  # highlight = "#ebe1d7"
  # red_highlight = "#ffe5e5"
  # light_accent = "#c0bda0"
  # gray = "#807e60"
  # line_color = "#eee"
  # text_color = "#271708"
  # monospace_font = "menlo, consolas, monospace"

  getter accent : String,
    highlight : String,
    flash_highlight : String,
    light_accent : String,
    line_color : String,
    text_color : String

  def initialize(
    @accent,
    @highlight,
    @flash_highlight,
    @light_accent,
    @line_color,
    @text_color = "#271708"
  )
  end
end
