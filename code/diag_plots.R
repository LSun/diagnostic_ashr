set.seed(777)
library(ashr)

p <- 1e4

theta <- rnorm(p)
s <- 1
X <- rnorm(p, theta, s)
fit.ashr <- ashr::ash(X, 1, mixcompdist = "normal", method = "shrink")
pdf("~/GitHub/diagnostic_ashr/output/good.pdf", height = 6, width = 8)
par(mfrow = c(2, 2))
ashr::plot_diagnostic(fit.ashr)



dev.off()

theta <- sample(c(rnorm(p/2, -2, 1), rnorm(p/2, 2, 1)))
s <- 1
X <- rnorm(p, theta, s)
fit.ashr <- ashr::ash(X, 1, mixcompdist = "normal", method = "shrink")
pdf("~/GitHub/diagnostic_ashr/output/bad.pdf", height = 6, width = 8)
par(mfrow = c(2, 2))
ashr::plot_diagnostic(fit.ashr)



dev.off()

theta <- rnorm(1e4)
z <- readRDS("~/GitHub/cashr_paper/data/z.sel.rds")[3, ]
X <- theta + z
fit.ashr <- ashr::ash(X, 1, mixcompdist = "normal", method = "shrink")
pdf("~/GitHub/diagnostic_ashr/output/ugly.pdf", height = 6, width = 8)
par(mfrow = c(2, 2))
ashr::plot_diagnostic(fit.ashr)



dev.off()