library(ggplot2)
library(showtext)

# Font

font_title <- "Josefin Sans"
font_text <- "Montserrat"

font_add_google(font_text, font_title)
showtext_auto()

# Color

color_base <- "#0086AB"
color_base_light <- "#97D3E3"
color_text <- "#272822"
color_accent <- "#EB811B"
color_accent_light <- "#E6855E"

grey <- scales::alpha("grey", 0.7)
dark_grey <- "#6d6d6d"

# Theme

theme_set(theme_minimal(base_size = 20, base_family = font_text))
theme_update(
  plot.title = element_text(size = rel(1.2), face = "bold",
                            family = font_title),
  plot.subtitle = element_text(size = rel(1), face = "plain",
                               family = font_text),
  plot.caption = element_text(size = rel(0.8),
                              color = "grey50",
                              face = "plain",
                              family = font_text,
                              margin = margin(t = 10)),
  panel.grid.minor = element_blank(),
  strip.text = element_text(size = rel(0.9), hjust = 0,
                            family = font_text, face = "bold"),
  strip.background = element_rect(fill = "#ffffff", color = NA),
  axis.ticks = element_blank(),
  axis.title = element_text(family = font_text, face = "plain",
                            size = rel(0.8)),
  axis.title.x = element_text(margin = margin(t = 5)),
  axis.text = element_text(family = font_text, face = "plain"),
  legend.title = element_blank(),
  legend.key = element_blank(),
  legend.text = element_text(size = rel(0.75),
                             family = font_text, face = "plain"),
  legend.spacing = unit(0.1, "lines"),
  legend.box.margin = margin(t = -0.5, unit = "lines"),
  legend.margin = margin(t = 0),
  legend.position = "bottom",
  plot.title.position = "plot"
)
