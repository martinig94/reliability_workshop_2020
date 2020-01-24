# Gaussian process regression fit and plot
#
#
# Adapted from: https://cran.rstudio.com/web/packages/GPfit/GPfit.pdf

library(tidyverse)
library(kdecopula)

# ================================================================
# OPTIONS/SETTINGS
# ================================================================

fig_units = "mm"
fig_width = 120
fig_height = 100
fig_dpi = 600

TNO_bright = "#73bbf2"
green_custom = "#03964a"
orange = "#ffa500"

color = orange

data(wdbc)

# ================================================================
# MODEL FIT & PREDICT
# ================================================================
u = apply(wdbc[, c(2, 8)], 2, rank) / (nrow(wdbc) + 1)  # empirical PIT

kde.fit = kdecop(u)  # kernel estimation (bandwidth selected automatically)
summary(kde.fit)


# ================================================================
# VISUALIZE
# ================================================================

plot(kde.fit)

par_original = par()
par(bg=NA)

contour(kde.fit, col = terrain.colors(15),
        lwd=3,
        levels = seq(0, 0.3, by = 0.02),
        drawlabels = FALSE,
        xaxt='n', xlab='',
        yaxt='n', ylab='',
        axes=FALSE, frame.plot=FALSE, ann=FALSE)

# ================================================================
# SAVE
# ================================================================

fname = paste("figures/2d_copula", sep="")
fpath = paste(fname, ".png", sep="")

dev.copy(png, fpath, width = 1.2*fig_width, height = 1.2*fig_height, res = fig_dpi, units=fig_units)
dev.off()
par(par_original)

# resize proportionally to width: 200px
img = image_read(fpath)
img = image_scale(img, "300")
image_write(img, path = fpath, format = "png")
