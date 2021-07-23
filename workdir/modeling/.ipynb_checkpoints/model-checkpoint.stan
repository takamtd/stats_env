
data{
    int N;
    real x[N];
    real y[N];
}

parameters{
    mu_x ~ normal(0, 100);
    sigma_x ~ cauchy();
    mu_x ~ normal();
    sigma_x ~ cauchy();
}

model{
    mu_x ~ normal();
    sigma_x ~ cauchy();
    mu_y ~ normal();
    sigma_y ~ cauchy();

    x ~ normal(mu_x, sigma_x);
    y ~ normal(mu_y, sigma_y);
}

generated quantities{
    real diff;
    diff <- mu_y - mu_x;
}