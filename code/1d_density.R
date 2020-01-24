rm(list=ls(all=TRUE))

library(tidyverse)
library(magick)

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

TNO_bright = "#73bbf2"
green_custom = "#03964a"
orange = "#ffa500"

color = orange
# ================================================================
# VISUALIZATION
# ================================================================

x1 = rchisq(2e4, 1, ncp = 50)
x2 = rnorm(1e4, mean=mean(x1)-3*sd(x1), sd = sd(x1))
x = c(x1, x2)

df = data.frame(x = x)

m = ggplot(df, aes(x = x))
# m = m + geom_density(size=1, color = color)
m = m + stat_density(geom="line", size=2, color = TNO_bright)

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

# ================================================================
# SAVE
# ================================================================

if (save_plot == TRUE) {
  fname = paste("figures/1d_density", sep="")
  fpath = paste(fname, ".png", sep="")
  ggsave(paste(fname, ".png", sep=""), width = 1.2*fig_width, height = 1.2 * fig_height, dpi = fig_dpi, units=fig_units, bg = "transparent")
  
  # resize proportionally to width: 200px
  img = image_read(fpath)
  img = image_scale(img, "200")
  image_write(img, path = fpath, format = "png")
}
