library(data.table)
library("ggplot2")
library("lattice")
library("caret")
setwd("C:\\Users\\57305\\OneDrive\\Escritorio\\Academico\\TBS\\UE2\\R\\R proyect")
data<-fread("StressLevelDataset.csv")
summary(data)
#We filtered the factors into groups
stress <- data$stress_level
Psychological <- data.frame(data$anxiety_level,data$self_esteem ,
                            data$mental_health_history, data$depression)
Physiological <- data.frame(data$headache, data$blood_pressure,
                            data$sleep_quality, data$breathing_problem)
Social <- data.frame(data$social_support, data$peer_pressure,
                     data$extracurricular_activities, data$bullying)
Environmental <- data.frame(data$noise_level, data$living_conditions,
                            data$safety, data$basic_needs)
Academic <- data.frame(data$academic_performance, data$study_load,
                       data$teacher_student_relationship, data$future_career_concerns)
#Find out the correlation between each group and stress level to find out which ones are the most strongly correlated
cor(stress,Psychological)
cor(stress, Physiological)
cor(stress,Social)
cor(stress, Environmental)
cor(stress, Academic)
# linear regression between all the variables and stress, but each time we eliminate the less 
#significant variable
model<-lm(stress_level~.,data=data)
summary(model)
model1<-lm(stress_level~.-anxiety_level,data=data)
summary(model1)
model2<-lm(stress_level~. - anxiety_level - mental_health_history,data=data)
summary(model2)
model3<-lm(stress_level~. - anxiety_level - mental_health_history - future_career_concerns,data=data)
summary(model3)
model4<-lm(stress_level~. - anxiety_level - mental_health_history - future_career_concerns -
             living_conditions,data=data)
summary(model4)
model5<-lm(stress_level~. - anxiety_level - mental_health_history - future_career_concerns -
             living_conditions - breathing_problem,data=data)
summary(model5)
model6<-lm(stress_level~. - anxiety_level - mental_health_history - future_career_concerns -
             living_conditions - breathing_problem - social_support,data=data)
summary(model6)
model7<-lm(stress_level~. - anxiety_level - mental_health_history - future_career_concerns -
             living_conditions - breathing_problem - social_support - blood_pressure,data=data)
summary(model7)
# We decided to only keep highly significant p-values (<0.001)
model8<-lm(stress_level~.- peer_pressure - depression - teacher_student_relationship - 
             anxiety_level - breathing_problem - blood_pressure 
           - mental_health_history - living_conditions - social_support - future_career_concerns,data=data)
summary(model8)

#Histograms to visualize the score distribution of students (we need to do this for each significative variable)
#Self_esteem, headache, sleep_quality, noise_level, safety, basic_needs, academic_performance, study_load, extracurricular_activities and bullying
hist(data$self_esteem,main = "Histogram of self esteem",
     xlab = "Level of self esteem",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$self_esteem) - 0.5, max(data$self_esteem) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$self_esteem) - 0.5, max(data$self_esteem) + 0.5))
hist(data$headache,main = "Histogram of headache",
     xlab = "Level of headache",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$headache) - 0.5, max(data$headache) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$headache) - 0.5, max(data$headache) + 0.5))
hist(data$sleep_quality,main = "Histogram of sleep quality",
     xlab = "Level of Sleep quality",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$sleep_quality) - 0.5, max(data$sleep_quality) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$sleep_quality) - 0.5, max(data$sleep_quality) + 0.5))
hist(data$noise_level,main = "Histogram of Noise Level",
     xlab = "Level of Noise Level",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$noise_level) - 0.5, max(data$noise_level) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$noise_level) - 0.5, max(data$noise_level) + 0.5))
hist(data$safety,main = "Histogram of Safety",
     xlab = "Level of Safety",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$safety) - 0.5, max(data$safety) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$safety) - 0.5, max(data$safety) + 0.5))
hist(data$basic_needs,main = "Histogram of Basic Needs",
     xlab = "Level of Basic Needs",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$basic_needs) - 0.5, max(data$basic_needs) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$basic_needs) - 0.5, max(data$basic_needs) + 0.5))
hist(data$academic_performance,main = "Histogram of Academic Performance",
     xlab = "Level of Academic Performance",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$academic_performance) - 0.5, max(data$academic_performance) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$academic_performance) - 0.5, max(data$academic_performance) + 0.5))
hist(data$study_load,main = "Histogram of Study Load",
     xlab = "Level of Study Load",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$study_load) - 0.5, max(data$study_load) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$study_load) - 0.5, max(data$study_load) + 0.5))
hist(data$extracurricular_activities,main = "Histogram of Extracurricular Activities",
     xlab = "Level of Extracurricular Activities",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$extracurricular_activities) - 0.5, max(data$extracurricular_activities) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$extracurricular_activities) - 0.5, max(data$extracurricular_activities) + 0.5))
hist(data$bullying,main = "Histogram of Bullying",
     xlab = "Level of Bullying",
     ylab = "Density",
     col = "orange",
     border = "black",
     freq = FALSE,
     breaks = seq(min(data$bullying) - 0.5, max(data$bullying) + 0.5, by = 1),  # Ajust the bins
     xlim = c(min(data$bullying) - 0.5, max(data$bullying) + 0.5))
#Relationship between basic need and safety
cor(data$basic_needs, data$safety)
cor( data$extracurricular_activities, data$study_load)

#Data frame to visualization
coefficients <- summary(model8)$coefficients
coef_df <- as.data.frame(coefficients[-1, 1])  # Exclude the intercept
names(coef_df) <- "Estimate"
coef_df$Variable <- rownames(coefficients)[-1]
# We created a barplot in order to visualize the relative importance of each significant variable
# VISUALIZATION OF THE SIGNIFICANCY
ggplot(coef_df, aes(x = reorder(Variable, abs(Estimate)), y = Estimate, fill = Estimate > 0)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Variables'impact on stress level",
       x = "Variables", y = "Coefficients estimates") +
  theme_minimal() +
  scale_fill_manual(values = c("red", "green"))  # Red for negative,green for positive.
#Logistic Regression
#Only for significant variables Self_esteem, headache, sleep_quality, noise_level,
#safety, basic_needs, academic_performance, study_load, extracurricular_activities and bullying
data$Stressed_student <- ifelse(data$stress_level==0,0,1)
data_training <-data[1:(dim(data)[1] - 100),]
data_test <- data[(dim(data)[1]-100+1):dim(data)[1]]
logit_model <- glm(Stressed_student~self_esteem + headache + sleep_quality + noise_level + safety +
                     basic_needs + academic_performance + study_load + extracurricular_activities +
                     bullying+peer_pressure + teacher_student_relationship + depression,
                   data=data_training,binomial(link="logit"))
summary(logit_model)
varImp(logit_model)
prediction_test <-predict(logit_model, newdata= data_test, type="response")
prop.table(table(data_test$Stressed_student,prediction_test > 0.5))
#The results shows 88% of accuracy (24% true negatives and 64% true positives)
