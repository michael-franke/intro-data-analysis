# Course Outline (Sketch)

## Part One: Foundations

### 1. General introduction

- goals of this course
- what stats is about
- dual-pronged approach: frequentist vs Bayes
- learning goals
  - Use this on a slide:
    - "At the end of the course, students are to be able to independently evaluate statistical analyses based on their adequacy for a given research question and data set, and to critically assess the adequacy of analyses commonly found in the literature. The course seeks to convey the competence to understand complex data sets, and to manipulate the data and plot aspects of it in ways that are useful for answering a given research question."

### 2. Basics of R

- first steps
- data types
- functions
- loops, maps & pipes

## Part Two: Data

### 3. Kinds of data 

*learning goal:* how to arrange, summarize and visualize (aspects of data) to address a question of interest ("hypothesis-driven data poking")

- different kinds of data
  - discrete/continuous
  - nominal/orginal/metric/count/...
  - ...
  
### 4. Data wrangling

- data wrangling (practical R)
  - tidy data (read, write, ...)
  - `pivot_longer`, `pivot_wider`, `join` ...
    - check `vignette("pivot")`
  - nested tibbles
  - `group_by`, `summarize`, ...
- data cleaning

### 5. Summary statistics

- simple summary statistics (theory)
  - mean/mode/median/quantiles/bootstraped CI of mean
  - variance, standard deviation
  - ...
- exploring dependencies in data
  - plotting schemes
  - correlation
    - Bravais-Pearson
    - Spearman/Kendall
    - ...
  - multiple correlations
    - show `pairs` plots
    - find a good data set (also for later in simple linear regressions)
- bootstrap
  - 95% confidence intervals for mean estimates 
    - use for plotting
    
### 6. Visualization

- principles of helpful plotting
- using ggplot
  - geoms
  - scales & stats
  - faceting
  - legends

## Part 3: Models and inference

### 7. Basics of probability theory

*learning goal:* get comfortable with basic notions of probability theory

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

### 8. Two approaches to statistical modeling

- dual-pronged approach
  - frequentist:
    - (objective) probability from repeat experiment
    - tight regime of error control (-> significance testing)
  - Bayes:
    - (subjective) probability from beliefs
    - inference as rational belief update / decision making under uncertainty

### 9. Models

*learning goal:* diagnosing the (conceptual) differences between kinds of statistical models

- priors & likelihood (not yet complete)
- notation
  - explain `~` notation (added)
  - explain how `d_i ~ N(0,1)` means that all d_i are i.i.d. (added)
- probabilistic causal networks
  - [possibly] elaborate on "stochastic d-independence"? (has to be done)
- three example models:
  - "binomial model" (added as explanatory example - coin flip)
  - "factorial-design model" (added as beta-binomial two group case -- but not refered to factorial design - flip two coins)
  - simple linear regression model (added - cars data)
- additional things to mention:
  - give an example of a hierarchical model (motivated / something that comes back later?) (has to be done)
  - show how to computer priors of intermediary nodes (has to be done - perhaps in "prior"-section)
    - use beta-binomial example from BDA+CM 2018
    - mention the usefulness of reparameterization (of beta, in terms of kappa and omega)
  - show how to derive the prior predictive distribution (Bayesian) (has to be done - perhaps as outline in the "prior&likelihood"-section)
- (included a part that should help to understand the link between parameters and model -- perhaps we should include it elsewhere, but when it comes to interpretation of R output (e.g. from tests) then the link between parameters and model has to be clear...)

### 10. Parameter inference

- MLE vs posterior
- confidence intervals
- credible intervals
- briefly: algorithms for MLE & Bayesian inference

### 11. Hypothesis testing

- p-value
  - error control
- binomial test 
- t-test
- ANOVA
- linear regression

### 12. Model comparison

- AIC
  - check chapter 5 of McElreath
- likelihood ratio test
- Bayes factor

### 13. Bayesian approaches to hypothesis testing

- testing via Bayesian posterior inference
- testing via model comparison

### 14. Model criticism

- posterior predictive checks (visual inspection)
- (posterior) predictive $p$-values

## Part Four: Applied (generalized) linear modeling

### 15. simple linear regression

- "multiple" = "more than one predictor"
  - interactions
  - collinearity
- categorical predictors
  - relation to t-test and ANOVA
  - different coding shemes
- robust regression

### 16. logistic regression

### 17. multinomial regression

### 18. Ordinal regression
 
### 19. Hierarchical regression

- random effects

**Snippets**

- where to put correlation?
- where to put model criticism?
- use/mention Jasp/WebPPL/greta?

 ## Appendix
 
1.  Further useful information material

- Installation Issues
  - (base) R
  - RStudio
  - brms-package
  - tidyverse-package
  - greta-package [IN PROGRESS]
- Reading material
  - Textbooks on *Introduction to Probability*
  - Textbooks on *Bayesian Data Analysis*
  - Textbooks on *Frequentist statistics* [IN PROGRESS]
  - Textbooks on *R, Tidyverse, etc.* [IN PROGRESS]
  - Package documentation [IN PROGRESS]
  - Further information for RStudio (e.g. Shortcuts)

2.  Common probability distributions

- Selected continous distributions of random variables
  - Normal distribution
  - Chi-squared distribution
  - F distribution
  - Student-t distribution
  - Beta distribution
  - Uniform distribution
  - 
- Selected discrete distributions of random variables
  - Binomial distribution
  - Bernoulli distribution
  - Beta binomial distribution
  - Poisson distribution
- Understanding distributions as random variables [IN PROGRESS] (if the integration of WebPPL is possible then better to do it with WebPPL)

3. Exponential Family and Maximum Entropy

- An important family: The Exponential Family
- Excursos: "Information Entropy" and "Maximum Entropy Principal"
  - Information Entropy
    - Shannon's theorem
    - Wallis derivation
  - Deriving Probability Distributions using the Maximum Entropy Principle
    - Lagrangian multiplier technique
    - Example 1: Derivation of maximum entropy pdf with no other constraints
    - Example 2: Derivation of maximum entropy pdf with given mean $\mu$ and variance $\sigma^2$
