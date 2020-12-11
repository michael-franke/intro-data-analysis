data {
  int<lower=1> N ;
  int<lower=0,upper=N> k[6] ;
  int<lower=0> t[6];
}
parameters {
  real<lower=0,upper=1.5> c ;
  real<lower=0,upper=1.5> d ;
} 
model {
  // likelihood
  for (i in 1:6) {
    target += binomial_lpmf(k[i] | N,  c * t[i]^(-d)) ;
  }
}
