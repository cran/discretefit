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

chisq_gof(x, p)
rms_gof(x, p)
g_gof(x, p)
ft_gof(x, p)
ks_gof(x, p)
cvm_gof(x, p)

## -----------------------------------------------------------------------------
x <- c(15, 5, rep(0, 48))
p <- c(0.25, 0.25, rep(1/(2 * 50 -4), 48))

chisq_gof(x, p)
g_gof(x, p)
ft_gof(x, p)

## -----------------------------------------------------------------------------
rms_gof(x, p)

## -----------------------------------------------------------------------------
set.seed(499)
chisq_gof(x, p, reps = 2000)$p.value
set.seed(499)
chisq.test(x, p = p, simulate.p.value = TRUE)$p.value

## -----------------------------------------------------------------------------
bench::system_time(
  chisq_gof(x, p, reps = 20000)
)

bench::system_time(
  chisq.test(x, p = p, simulate.p.value = TRUE, B = 20000)
)

