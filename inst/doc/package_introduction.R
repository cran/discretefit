## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning = FALSE---------------------------------------------------
library(discretefit)
library(bench)

x <- c(42, 0, 13, 2, 109)
p <- c(0.2, 0.05, 0.1, 0.05, 0.6)

pp <- c(rep(1, 4),
        rep(2, 1),
        rep(3, 2),
        rep(4, 1),
        rep(5, 12))

chisq_gof(x, p)
rms_gof(x, p)
g_gof(x, p)
ks_gof(x, p)

## -----------------------------------------------------------------------------
set.seed(499)
chisq_gof(x, p, reps = 2000)
set.seed(499)
chisq.test(x, p = p, simulate.p.value = TRUE)$p.value

## -----------------------------------------------------------------------------
bench::system_time(
  chisq_gof(x, p, reps = 20000)
)

bench::system_time(
  chisq.test(x, p = p, simulate.p.value = TRUE, B = 20000)
)

## -----------------------------------------------------------------------------
x <- c(114, 118, 112, 158)
y <- c(1, 2, 3, 4, 5, 5)
p <- c(0.2, 0.2, 0.2, 0.4)
  
bench::system_time(
  ks_gof(x, p, reps = 20000)
)

bench::system_time(
  dgof::ks.test(x, ecdf(y), simulate.p.value = TRUE, B = 20000)
)

## -----------------------------------------------------------------------------
x <- c(15, 5, rep(0, 48))
p <- c(0.25, 0.25, rep(1/(2 * 50 -4), 48))

chisq_gof(x, p)
g_gof(x, p)

## -----------------------------------------------------------------------------
rms_gof(x, p)

