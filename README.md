# Introduction to Data Analysis 

The book introduces key concepts of data analysis from a frequentist and a Bayesian tradition. It uses R to handle, plot and analyze data. It relies on simulation to illustrate selected statistical concepts.

Overiew:

1. **general introduction**

- what stats is about
- different practices
- learning goals

2. **data**

*learning goal:* how to arrange, summarize and visualize (aspects of data) to address a question of interest ("hypothesis-driven data poking")

- different kinds of data
- summary statistics
- data wrangling
- data plotting

3. **probability**

*learning goal:* get comfortable with basic notions of probability theory

[follow script from BDA_CM2018]
- basics of "probability"
  - outcomes, events, observations
  - probability distribution (on sigma-algebra)
  - interpretations of probability
- structured events and marginalization (like in script)
  - marginals, join-probability ...
  - conditional probability
- random variables (like in script, but)
  - move examples to next section
  - include more descriptive measures (mode, median based on what was in Section 2)
- selected distributions
  - (read McElreath: Chapter 8; "Meet the family")

4. **models**

*learning goal:* diagnosing the (conceptual) differences between kinds of statistical models

- priors & likelihood
- conceptual differences between frequentist and Bayesian approaches (revisited)
- notation (probabilistic causal networks)
- three example models:
  - "binomial model"
  - "factorial-design model"
  - simple linear regression model

5. **inference**

- MLE vs posterior
- confidence intervals
- credible intervals
- briefly: algorithms for MLE & Bayesian inference

6. **null hypothesis significance testing**

- p-value
  - error control
- binomial test 
- t-test
- ANOVA
- linear regression

7. **model comparison**

- AIC
  - check chapter 5 of McElreath
- likelihood ratio test
- Bayes factor

8. **Bayesian approaches to hypothesis testing**

- testing via Bayesian posterior inference
- testing via model comparison

9. **generalized regression modeling**

- applications
 

**Experiments**

- Presupposition failure :: binomial.text theta = 0.5
- Prospect Theory Tversky & Kahnemann :: 2 row 2 column contingency table -> chi-squared test
- Simon Task :: 2 group metric variable (RTs**
- Mental Rotation :: ANOVA 2x2 design
- Serial Exhaustive Search :: linear regression

**Snippets**

- where to put correlation?
- where to put model criticism?
