**Experiments**

We want experiments with data for different types of data. The basic ones will be the following 5:

1. `binom.test` :: one group binary choice data -> test if theta = 0.5

- presupposition failure experiment; give sentences like "The King of France is bald."; participants rate whether this is true or false; we check if, on average, the probability of truth-value choices is 0.5

2. `chi.squared` :: two group binary choice data -> test if different theta between groups

- Prospect Theory Tversky & Kahnemann; give standard vignettes on positive/negative framing of gains/losses; participants choose one of two wagers;
- moral decision problems; push the heavy man in front of a train?

3. `t.test` :: two groups metric data -> test if means are different between two groups

- Simon Task; as implemented already \_magpie

4. `anova` :: 2x2 design; 2 crossed categorical factors with metric measures

- Mental Rotation, as implemented already in \_magpie

5. `lm` :: one metric variable depending on another; correlation and simple linear regression case

- Serial Exhaustive Search, as implemented already in \_magpie

