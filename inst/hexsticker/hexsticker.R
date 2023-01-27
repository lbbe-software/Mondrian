#' 
#' Create an Hexagonal Sticker for the Package
#' 
library(hexSticker) # hexSticker generator
library(magick)     # Advanced image processing

sticker(
  subplot = magick::image_read(here::here("inst", "hexsticker", "icon.png")),
  package = "Mondrian",
  p_x = 0.96,                   # package name x-position
  p_y = 0.8,                 # package name y-position
  p_color = "black",       # package name color
  p_family = "Aller_Rg",     # package name font family
  p_fontface = "plain",      # package name font face
  p_size = 8,                # package name font size
  
  s_width = 2,                # subplot width
  s_height = 2,               # subplot height
  s_x = 1,                   # subplot x-position (left/right position)
  s_y = 1,                    # subplot y-position (up/down position)
  h_fill = 'white',           # hexSticker background color
  h_color = 'black',         # hexsticker border color
  filename = here::here("man", "figures", "hexsticker.png")
)

