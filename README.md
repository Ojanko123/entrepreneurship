# Entrepreneurial Success — Logistic Regression Analysis (R)


A logistic regression study examining whether **initial capital** and **age** influence the probability of entrepreneurial success. Both simple and multiple logistic regression models are fitted and evaluated using goodness-of-fit tests, confusion matrices, and odds ratios.

This is a BSc-level statistics lab project completed as part of a Statistics and Insurance Science degree.

---

## Problem Statement

An economist aims to determine whether initial capital (in thousands of euros) and a person's age (in years) can predict whether a newly founded business remains viable after two years.

- **Outcome variable:** Business status (1 = Sustainable, 0 = Unsustainable)
- **Sample size:** 30 businesses founded within the last two years

---

## Tools & Libraries

| Library | Purpose |
|---|---|
| Base R | Data management and GLM fitting |
| `descr` | Confusion matrix (crosstab) |
| `caret` | Detailed confusion matrix with performance metrics |
| `DescTools` | Pseudo R² statistics (Cox & Snell, Nagelkerke) |
| `glmtoolbox` | Hosmer-Lemeshow goodness-of-fit test |

---

## Analysis

### Part B — Simple Logistic Regression

Fitted a logistic regression model relating business status to **initial capital** alone:

```r
fit = glm(Status ~ Capital, family=binomial(link='logit'), data=data)
```

- Constructed a classification table comparing actual vs predicted business status
- Evaluated goodness of fit using the **Hosmer-Lemeshow test** and **-2 Log-Likelihood**
- Computed **Pseudo R²** (Cox & Snell and Nagelkerke)
- Calculated **odds ratios** and **95% confidence intervals**

### Part C — Multiple Logistic Regression

Extended the model by adding **age** as a second predictor:

```r
fit1 = glm(Status ~ Capital + Age, family=binomial(link='logit'), data=data)
```

- Compared model fit against the simple model using deviance and Pseudo R²
- Re-evaluated classification accuracy via confusion matrix
- Computed odds ratios and confidence intervals for both Capital and Age

---

## Key Concepts Demonstrated

- Binary outcome modelling with logistic regression
- Model evaluation using Hosmer-Lemeshow goodness-of-fit test
- Classification accuracy via confusion matrices (sensitivity, specificity, accuracy)
- Odds ratio interpretation with confidence intervals
- Simple vs multiple logistic regression comparison
- Pseudo R² measures for logistic models (Cox & Snell, Nagelkerke)

---

## How to Run

1. Open `entr..R` in RStudio
2. Install required packages if not already installed:
```r
install.packages(c("descr", "caret", "DescTools", "glmtoolbox"))
```
3. Run the script section by section (Part A → B → C)

---


**Oresti Janko**
BSc Statistics and Insurance Science — University of Piraeus
Focus: Statistical modelling, logistic regression, quantitative analysis
