
data{
    int N;
    real x[N];
    real y[N];
}

parameters{
    real mu_x;
    real <lower=0> sigma_x;
    real mu_y;
    real <lower=0> sigma_y;
}

model{
    mu_x ~ normal(0, 10000);
    sigma_x ~ cauchy(0, 5);
    mu_y ~ normal(0, 10000);
    sigma_y ~ cauchy(0, 5);

    for(i in 1:N){
        x[i] ~ normal(mu_x, sigma_x);
        y[i] ~ normal(mu_y, sigma_y);
    }
}

generated quantities{
    real diff;
    diff <- mu_y - mu_x;
}
