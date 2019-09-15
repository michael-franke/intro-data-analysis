# General overview of App collections
(Overview according to stat topics see below)
* https://statistics.calpoly.edu/shiny#probview (-)
* https://r.tquant.eu/ (-)
* https://www.albany.edu/psychology/statistics/shinypsych.htm (-)
* http://www.showmeshiny.com/
* https://sites.psu.edu/shinyapps/references/ (-)
* https://shinyapps.org/
* https://sahuvaibhav.shinyapps.io/Stats/ (-)
* http://www2.stat.duke.edu/~mc301/shinyed/ (-)
* http://www.artofstat.com/webapps.html
* https://www.marinedatascience.co/blog/2019/01/16/helpful-shiny-apps/
* https://github.com/gastonstat/shiny-introstats

# Overview according to topics
## Data
### General introduction
* https://rstudio.aws.science.psu.edu:3838/Boast/Data_Gathering/Variable_Types_Matching_Game/ (Game for learning scales - nominal, ordinal, metric)
### Summary Statistics 
* https://shiny.rit.albany.edu/stat/describe/ (Histogramm, Boxplot, violin, QQ)
* https://shiny.rit.albany.edu/stat/visualizess/ (Mean, deviation, sum of squares)
* https://istats.shinyapps.io/EDA_categorical/ (describing & plotting (one and two) categorical data for given data sets) (!)
* https://istats.shinyapps.io/EDA_quantitative/ (describing & plotting quantitative data for given data sets) (!)
* https://rstudio.aws.science.psu.edu:3838/Boast/Data_Description/Descriptive_Statistics/ (Game: Match Mean/Median to distributions)
* https://istats.shinyapps.io/MeanvsMedian/ (Difference between Median and Mean for various distribution shapes)
### Correlation
* http://shiny.calpoly.sh/Corr_Reg_Game/ (Game: guessing correl coef / regress parameters)
* https://istats.shinyapps.io/guesscorr/ (Game: guess the correlation)
* https://r.tquant.eu/UvA/BayesianCorrelationAnalysis/ (Bayesian Correlation)
* https://shiny.rit.albany.edu/stat/rectangles/ (scatterplot for correlation and covariance)
* https://shiny.rit.albany.edu/stat/corrsim/ (correlation with regression line)
* https://rstudio.aws.science.psu.edu:3838/Boast/Data_Description/Regression_Lines/ (Explore correlation and regression)
* https://istats.shinyapps.io/Association_Quantitative/ (corrleation: Pearson,Spearman, Kendall; regression line)
* https://istats.shinyapps.io/Association_Categorical/ (Association between two categorical variables)
### Interpretation problems / outliers / etc.
* https://rstudio.aws.science.psu.edu:3838/Boast/Data_Description/Effect_of_Outliers/ (Effect of outliers)

## Probability
### Distributions in General
* http://shiny.calpoly.sh/Prob_View/ (several distributions)
* https://r.tquant.eu/Tuebingen/discreteContDistrib/ (several distributions)
* https://istats.shinyapps.io/PoissonDist/ (explores Poisson distribution)
* https://shiny.rit.albany.edu/stat/binomial/ (only binomial distribution)
* https://istats.shinyapps.io/BinomialDist/ (explores binomial distribution)
* https://shiny.rit.albany.edu/stat/stdnormal/ (only standard normal)
* https://istats.shinyapps.io/NormalDist/ (explores normal distribution)
* https://shiny.rit.albany.edu/stat/tdist/ (only student-t)
* https://istats.shinyapps.io/tdist/ (explores student-t distribution)
* https://shiny.rit.albany.edu/stat/chisq/ (only chi-square)
* https://istats.shinyapps.io/ChisqDist/ (explores chi-square)
* https://shiny.rit.albany.edu/stat/fdist/ (only F-distribution)
* https://istats.shinyapps.io/FDist/ (explores F-distribution)
* https://gallery.shinyapps.io/dist_calc/ (several distributions)
### Sampling Distribution / Central Limit Theorem
* https://shiny.rit.albany.edu/stat/sampdist/ (sampling and central limit theorem)
* https://rstudio.aws.science.psu.edu:3838/Boast/Probability/Central_Limit_Theorem/ (Central Limit Theorem)
* https://gallery.shinyapps.io/CLT_prop/ (central limit theory for proportions)
* https://istats.shinyapps.io/SampDist_Prop/ (sampling distribution of the sample proportion) 
* https://gallery.shinyapps.io/CLT_mean/ (central limit theory for means)
* https://istats.shinyapps.io/sampdist_cont/ (sampling distribution of the sample mean-continous population)
* https://istats.shinyapps.io/SampDist_discrete/ (sampling distribution of the sample mean-discrete population)
### Misc
* https://r.tquant.eu/Tuebingen/urnmodel/ (Urn problems)
* http://shiny.calpoly.sh/Sampling_Distribution/ (Sampling distribution demonstration)

## Models
* showShinyApp("Beta") --> shiny-package
* https://r.tquant.eu/KULeuven/Frog/ (Frog Game: Getting intuition about updating belief)

## Inference (& Estimation)
### Confidence interval
* https://shiny.rit.albany.edu/stat/confidence/ (Confidence Interval for a Sample Mean: A simulation)
* https://rstudio.aws.science.psu.edu:3838/Boast/Estimation_and_Testing/STMeans/ 
* https://sahuvaibhav.shinyapps.io/Stats/ (show CI for normal)
### p-value
* https://r.tquant.eu/UCM/P-Values/ (BF vs. p-value for Binomial Test, correlation & t-test)
### MLE
* http://shiny.calpoly.sh/MLE_Binomial/ (PMF/Likelihood/Maximum Likelihood Estimation for the Binomial Distribution)

## Hypothesis Testing
### Regression
* http://shiny.calpoly.sh/3d_regression/ (visualize regression models for given data sets)
* https://gallery.shinyapps.io/slr_diag/ (diagnostics for simple linear regression)
* https://istats.shinyapps.io/ExploreLinReg/ (explore linear regression)
* https://istats.shinyapps.io/LinearRegression/ (linear regression with residuals, CI, ANOVA,...) 
* https://istats.shinyapps.io/MultivariateRelationship/ (multiple linear regression)
### Proportion
* https://rstudio.aws.science.psu.edu:3838/Boast/Estimation_and_Testing/Inference_of_Proportion/
* https://istats.shinyapps.io/Inference_prop/ (inference of one sample proportion)
* https://istats.shinyapps.io/2sample_prop/ (Inference of comparing two pop. proportions)
### T-Test
* http://shiny.calpoly.sh/t_Test/ (t-test with diagnostics)
* https://r.tquant.eu/UvA/t-test/ (Bayesian t-test / BF)
* http://shiny.calpoly.sh/WilcoxonMW/ (Performance of Wilcoxon-Mann-Whitney Test and t-test)
* https://rstudio.aws.science.psu.edu:3838/Boast/Estimation_and_Testing/Inference_of_Means/ (Inference for means and CIs)
* https://sahuvaibhav.shinyapps.io/Stats/ (t-test and z-test for two means)
* https://istats.shinyapps.io/Inference_mean/ (one sample t-test mean)
* https://istats.shinyapps.io/2sample_mean/ (Confidence interval and t-test for the difference in means - data have to generated by oneself)
### ANOVA 
* http://shiny.calpoly.sh/ANOVA_robust/ (How robust is the ANOVA F-test to violation of constant variance?)
* https://r.tquant.eu/tquant/Tartu/Frequentist_vs_Bayes_post_hoc/ (Comparison of Frequentist and Bayesian analysis in ANOVA post-hoc settings)
* https://r.tquant.eu/KULeuven/Distributions/ (Violation of Assumptions)
* https://shiny.rit.albany.edu/stat/mod2/ (concepts of interaction, moderator analysis, simple main effects, and simple slopes)
* https://rstudio.aws.science.psu.edu:3838/Boast/ANOVA/ANCOVA/ (Interaction plots for given data sets)
* https://rstudio.aws.science.psu.edu:3838/Boast/Multivariable_Topics/ANOVA/ (one-way ANOVA)
* https://istats.shinyapps.io/ANOVA/ (one-way ANOVA - self input of data)
### Chi-square Test
* https://istats.shinyapps.io/ChiSquaredTest/ (Chi-square test - data have to be generated self)
## Model comparison
* https://r.tquant.eu/Lisbon/MCAmodel1/ (Frequentistic via linear regression)
* https://r.tquant.eu/Lisbon/MCAmodel2/ (same as above just more complex)

## GLM

## Misc
### Type I/II Error
* https://r.tquant.eu/Tuebingen/selectionDecision/ (Selection Decisions in Diagnostic Applications - FalseNegative, FalsePositive)
* https://shiny.rit.albany.edu/stat/betaprob/ (Visualize Type I/II errors: One-sample Test of Means)
* https://istats.shinyapps.io/power/ (Type I/II error + Power for prop. and mean)
### Power analysis
* https://r.tquant.eu/Tuebingen/simulatedPower/ (for t-test and ANOVA)
* https://r.tquant.eu/KULeuven/Fpower/ (An app on power calculation for the ANOVA F test)
### Law of large numbers
* https://rstudio.aws.science.psu.edu:3838/Boast/Probability/Law_of_Large_Number/ 
