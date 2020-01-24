# Gaussian process regression fit and plot
#
#
# Adapted from: https://cran.rstudio.com/web/packages/GPfit/GPfit.pdf

library(tidyverse)
library(lhs)
library(GPfit)


## 1D Example 2
# ================================================================
# OPTIONS/SETTINGS
# ================================================================

fig_units = "mm"
fig_width = 120
fig_height = 100
fig_dpi = 600

ci = 0.9
n = 5
d = 1
computer_simulator <- function(x) {
  y = log(x + 0.1) + sin(3 * pi * x)
  return(y)
}

TNO_bright = "#73bbf2"
green_custom = "#03964a"
orange = "#ffa500"

color = orange
# ================================================================
# MODEL FIT & PREDICT
# ================================================================
set.seed(1)

x = maximinLHS(n, d)
y = computer_simulator(x)

GPmodel = GP_fit(x, y)

xx = seq(0, 1.1, length.out = 100)
pred = predict(GPmodel, xx)

yy_mean = pred[["Y_hat"]]
yy_std = pred[["MSE"]]

k = qnorm((1+ci)/2)
yy_lb = yy_mean*(1 - k*yy_std)
yy_ub = yy_mean*(1 + k*yy_std)

df_obs = data.frame(x = x, y = y)
df_model = data.frame(x = xx, y = yy_mean, y_lb = yy_lb, y_ub = yy_ub)

# ================================================================
# VISUALIZE
# ================================================================

g = ggplot(df_model, aes(x, y))
g = g + geom_ribbon(aes(ymin = y_lb, ymax = y_ub), fill = color, alpha = 1)
g = g + geom_path(size=1)

g = g + geom_point(data = df_obs, size=3)

g = g + theme(panel.background = element_rect(fill = "transparent"), # bg of the panel
              plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
              panel.grid.major = element_blank(), # get rid of major grid
              panel.grid.minor = element_blank(), # get rid of minor grid
              legend.background = element_rect(fill = "transparent"), # get rid of legend bg
              legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
        )
g = g + theme(axis.title=element_blank(),
              axis.text=element_blank(),
              axis.ticks=element_blank())

print(g)

# ================================================================
# SAVE
# ================================================================

if (save_plot == TRUE) {
  fname = paste("figures/1d_gpr", sep="")
  fpath = paste(fname, ".png", sep="")
  ggsave(fpath, width = 1.2*fig_width, height = 1.2 * fig_height, dpi = fig_dpi, units=fig_units, bg = "transparent")
  
  # resize proportionally to width: 200px
  img = image_read(fpath)
  img = image_scale(img, "300")
  image_write(img, path = fpath, format = "png")
}