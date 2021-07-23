library(rstan)

x = c(63.4, 38.6, 36.6, 27.2, 29.6, 27.1, 28.6, 31.7, 29.5, 36.0)
y = c(442, 423, 322, 378, 329, 361, 347, 346, 388, 338)

model <- stan_model("model.stan")
fit <- sampling(model, data=list(N=10, x=x, y=y))

diff <- rstan::extract(fit)$diff
p <- sum(ifelse(diff>0,1,0)) / length(diff)
plot(density(diff))