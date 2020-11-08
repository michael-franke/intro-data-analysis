data {
  int<lower=1> N1 ;
  int<lower=1> N2 ;
  vector[N1] y1 ;
  vector[N2] y2 ;
}
parameters {
  real mu ;
  real<lower=0> sigma ;
  real delta ;
} 
model {
  // priors
  target += log(1/sigma) ;
  delta ~ normal(0, 5) ;
  
  // likelihood
  y1 ~ normal(mu + sigma*delta/2, sigma^2) ;
  y2 ~ normal(mu - sigma*delta/2, sigma^2) ;
}
