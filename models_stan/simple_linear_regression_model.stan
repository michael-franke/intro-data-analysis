data {
  int<lower=1> N ;
  vector[N] x ;
  vector[N] y ;
}
parameters {
  real intercept ;
  real slope ;
  real<lower=0> sigma ;
} 
model {
  // priors
  intercept ~ student_t(1, 0, 10) ;
  slope ~ student_t(1, 0, 10) ;
  sigma ~ normal(0, 5) ;

  // likelihood
  y ~ normal(intercept + slope * x, sigma) ;
}
