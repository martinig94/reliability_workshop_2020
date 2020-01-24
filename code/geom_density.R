rm(list=ls(all=TRUE))

library(tidyverse)
library(magick)
data(faithful)

# Set working directory to repository root, works only with RStudio
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# ================================================================
# OPTIONS
# ================================================================

save_plot = TRUE

fig_units = "mm"
fig_width = 120
fig_height = 100
fig_dpi = 600

# ================================================================
# 
# ================================================================

m = ggplot(faithful, aes(x = eruptions, y = waiting))
m = m + geom_density_2d(color = 'gray', size=1)
m = m + geom_point(color = '#FBBC05') 
m = m + xlim(0.5, 6)
m = m + ylim(35, 110)

m = m + theme(
    panel.background = element_rect(fill = "transparent"), # bg of the panel
    plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
    panel.grid.major = element_blank(), # get rid of major grid
    panel.grid.minor = element_blank(), # get rid of minor grid
    legend.background = element_rect(fill = "transparent"), # get rid of legend bg
    legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
  )
m = m + theme(axis.title=element_blank(),
              axis.text=element_blank(),
              axis.ticks=element_blank())
print(m)


if (save_plot == TRUE) {
  fname = paste("figures/geom_density", sep="")
  fpath = paste(fname, ".png", sep="")
  ggsave(fpath, width = 1.2*fig_width, height = 1.2 * fig_height, dpi = fig_dpi, units=fig_units, bg = "transparent")
}

# resize proportionally to width: 200px
img = image_read(fpath)
img = image_scale(img, "300")
image_write(img, path = fpath, format = "png")
