**Course Outline (Sketch)**

Overiew:

1. **general introduction**

- what stats is about
- different practices
  - frequentist:
    - (objective) probability from repeat experiment
    - tight regime of error control (-> significance testing)
  - Bayes:
    - (subjective) probability from beliefs
    - inference as rational belief update / decision making under uncertainty
  - learning goals
    - Use this on a slide:
      - "At the end of the course, students are to be able to independently evaluate statistical analyses based on their adequacy for a given research question and data set, and to critically assess the adequacy of analyses commonly found in the literature. The course seeks to convey the competence to understand complex data sets, and to manipulate the data and plot aspects of it in ways that are useful for answering a given research question."
    - Notice that this is modest! It doesn't actually say that we aim at the competence to /do it/ or even to /do it flawlessly/! We are aiming at understanding, because that is the foundation of practical success /and/ the foundation of an ability to learn more in the future. We do not teach tricks! We do not share recipes! [Hilfe zur Selbsthilfe]

2. **data**

*learning goal:* how to arrange, summarize and visualize (aspects of data) to address a question of interest ("hypothesis-driven data poking")

- different kinds of data
  - discrete/continuous
  - nominal/orginal/metric/count/...
  - ...
- data wrangling (practical R)
  - tidy data (read, write, ...)
  - `pivot_longer`, `pivot_wider`, `join` ...
    - check `vignette("pivot")`
  - nested tibbles
  - `group_by`, `summarize`, ...
- summary statistics (theory)
  - mean/mode/median/quantiles
  - variance, standard deviation
  - ...
- data plotting
- dependencies in data
  - plotting schemes
  - correlation
    - Bravais-Pearson
    - Spearman/Kendall
    - ...
    
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

- priors & likelihood (not yet complete)
- conceptual differences between frequentist and Bayesian approaches (revisited) (added - but have to shorten the section)
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
 

**Snippets**

- where to put correlation?
- where to put model criticism?
- use/mention Jasp/WebPPL?
