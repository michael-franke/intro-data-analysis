data {
  int<lower=1> N ;
  int<lower=0,upper=N> k ;
  int<lower=0> t ;
}
parameters {
  real<lower=0,upper=1.5> a ;
  real<lower=0,upper=1.5> b ;
} 
model {
  // likelihood
  k ~ binomial(N,a * exp(-t*b)) ;
}
