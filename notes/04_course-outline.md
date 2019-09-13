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
- summary statistics (theory)
  - mean/mode/median/quantiles
  - variance, standard deviation
  - ...
- data wrangling (practical R)
  - tidy data (read, write, ...)
  - `gather`, `spread`, `join` ...
  - `group_by`, `summarize`, ...
  - 
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

- priors & likelihood
- conceptual differences between frequentist and Bayesian approaches (revisited)
- notation (probabilistic causal networks)
  - [possibly] elaborate on "stochastic d-independence"?
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
 

**Snippets**

- where to put correlation?
- where to put model criticism?
- use/mention Jasp/WebPPL?
