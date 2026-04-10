
# Problem 
 
 
#A. Data management
 

Capital=c(20.667,17.845,21.158,17.640,17.153,17.172,19.741,20.580,10.687,15.041,13.509,10.223,13.700,15.150,13.100,18.700,11.500,16.200,10.100,15.800,9.500,8.700,18.900,8.200,14.700,13.300,17.000,15.700,15.300,17.900) # A1 - Entry of variable "Capital"
Age=c(29,35,33,29,33,34,26,32,31,28,34,32,31,33,29,29,35,33,36,35,32,32,27,32,29,34,34,28,31,28)
Status=c(1,0,1,1,1,0,1,1,1,1,0,1,1,1,0,1,0,1,0,0,0,0,1,0,1,0,0,1,1,1)
data=data.frame(Capital, Age, Status)  
data$Status = factor(data$Status,levels = c(0,1), labels=c("unsustainable","sustainable"))  
data # The dataframe is printed

data2 <- data[order(data$Age,decreasing=FALSE),]
data2  
data3 <- data[order(data$Capital,decreasing=FALSE),]
data3  


#B Simple Logistic Regression
fit = glm(Status ~ Capital, family=binomial(link='logit'), data=data) # Fitting Generalized Linear Models
summary(fit) 
library(descr)
fitted.results = ifelse(fitted(fit) > 0.5, 1, 0) # Extract Model Fitted Values
fitted.results = factor(fitted.results,levels = c(0,1), labels=c("unsustainable","sustainable"))  
crosstab(data$Status, fitted.results) #  Confusion Matrix
library(caret)
confusionMatrix(data=fitted.results, reference = data$Status, positive = "sustainable")  #  Confusion Matrix (more informative)
library(DescTools)
-2*logLik(fit) # Extract Deviance from an lm Object 
# The -2*logLik value of a model is a way to measure the goodness of fit for a model. The lower the value of the -2*logLik, the better a model fits a dataset.
summary(fit)$deviance

PseudoR2(fit, which="CoxSnell") # Pseudo R2 Statistics
PseudoR2(fit, which="Nagelkerke") # Pseudo R2 Statistics
library(glmtoolbox)
hltest(fit) # Hosmer-Lemeshow goodness-of-fit test 
 
exp(fit$coefficients) # OR
exp(confint(fit)) #  confidence interval for OR
exp(cbind(fit$coefficients, confint(fit)))  


#C. Multiple logistic regression
fit1 = glm(Status ~ Capital + Age, family= binomial(link='logit'), data=data)
summary(fit1)
library(DescTools)
-2*logLik(fit1)
# or alternatively, 
summary(fit1)$deviance
PseudoR2(fit1, which="CoxSnell") # Pseudo R2 Statistics
PseudoR2(fit1, which="Nagelkerke") # Pseudo R2 Statistics
library(glmtoolbox)
hltest(fit1) # Hosmer-Lemeshow goodness-of-fit test 
library(descr)
fitted.results1 = ifelse(fitted(fit1) > 0.5, 1, 0) # Extract Model Fitted Values
fitted.results1 = factor(fitted.results1,levels = c(0,1), labels=c("unsustainable","sustainable"))  
crosstab(data$Status, fitted.results1) #  Confusion Matrix
library(caret)
confusionMatrix(data=fitted.results1, reference = data$Status, positive = "sustainable")  #  Confusion Matrix (more informative)
exp(fit1$coefficients)
exp(confint(fit1))
exp(cbind(fit1$coefficients, confint(fit1))) 



#In section B I performed the following tasks
#########################################################################################################
#Fit a logistic regression model that relates the status of the businesses to the initial capital.
#Construct a classification table comparing the actual data values regarding business status with the corresponding values predicted by the model.
#Examine the goodness of fit of the model.
#Calculate the odds ratio as well as the 95% confidence interval.
#########################################################################################################

#In section C
################################################################################################
#Fit a logistic regression model that relates business status to initial capital and the individual's age.
#Examine the goodness of fit of the model.
#Construct a classification table comparing the actual data values regarding business status with the corresponding values predicted by the model.
#Calculate the odds ratio and the 95% confidence interval for the variables Capital and Age.
################################################################################################

