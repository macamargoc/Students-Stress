Introduction

Student stress is a significant concern in today's educational landscape, particularly affecting students' overall well-being and academic performance. The sources of student stress are diverse, encompassing academic pressures such as heavy workloads, social challenges related to adapting to new environments, and mental health concerns like depression. 
Understanding the main causes and contributors to student stress is thus crucial for educational institutions. By identifying these factors, schools and universities can develop more effective interventions and support systems for students improving their personal and academic growth.
To address this critical issue of student stress, our study utilizes a dataset that explores the various factors impacting students' stress. This dataset includes 21 distinct variables, carefully selected and organized into five categories: psychological, physiological, social, environmental, and academic factors.
The central question arising from using this dataset is thus: Which specific feature within each factor group has the most significant impact on student stress, based on the dataset? 
The aim of this study is hence to identify the specific factors within each category that strongly impact students' stress levels. This is done by examining the relationships and correlations between these variables to clarify the relative influence of each factor. Ultimately, the results will inform practical recommendations to improve student well-being by focusing on the most critical areas for intervention.
The study will proceed in the following steps. First it begins with a description of the 21 variables related to student stress followed by an explanation of the data source and context. Then the data dictionary will define each variable. After that the methodology will outline the analytical techniques used. After that the results and insights will be presented. Finally it concludes.



Data description

Source and context
To obtain our data, we explored various topics on Kaggle and selected the "Student Stress Factors" dataset: A Comprehensive Analysis (Database). 
The dataset includes a sample of students from various high schools and colleges in Dharan, Nepal, including institutions like Tribhuvan University. The data was collected between June 2022 and October 2022.

Data dictionary

The dataset contains a total of 1001 rows and 21 variables, which provide an overview of the student stress experience.

The variables were carefully selected to form five main factor groups: psychological, physiological, social, environmental, and academic. The psychological factors include anxiety level, self-esteem, mental health history, and depression. Physiological factors consist of headache, blood pressure, sleep quality, and breathing problems. Social factors are represented by social support, peer pressure, extracurricular activities, and bullying. Environmental factors include noise level, living conditions, safety, and basic needs. Finally, the academic factors are academic performance, study load, teacher-student relationships, and future career concerns.
Here a representation of the data dictionary, providing a detailed explanation of each of the 21 factors and their meanings.

Psychological:
anxiety_level: integer
definition: anxiety level reported by the student according to the GAD-7 measure (GAD-7).
description: 0-4: minimal anxiety / 5-9: mild anxiety / 10-14: moderate anxiety / 15-21: severe anxiety.
quality: No missing values.
self_esteem: integer
definition: Self esteem level reported by the student according to the Rosenberg Self Esteem Scale (Rosenberg Self Esteem Scale).
description: 0-10: Low / 11-20: Moderate / 21-30: High self Esteem.
quality: No missing values.
mental_health_hisotry: integer/binary
definition: Reports if  students have a mental health history.
description: 0 if no metal health history, 1 if mental health history.
quality: No missing values.
depression: integer
definition: Depression level reported by the student according to PHQ-9 (PHQ-9).
description: 0-4: Minimal / 5-9: Mild / 10-14: Moderate  / 15-19:Moderately Severe / 20-27 Severe.
quality: No missing values.

Physiological:
headache: integer
definition: Headaches level reported by students.
description: From 0 to 5, 0 being light or rarely frequency and 5 being strong headaches or frequent.
quality: No missing values.
blood_pressure: integer
definition: Increased heart beat that leads to higher blood circulation.
description: From 1 to 3, considering 1 as too low, 2 as normal  and 3 to high.
quality: No missing values.
sleep_quality: integer
definition: Evaluation of the quality of the sleep by the student.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
breathing_problem: integer
definition: This column indicates if the student has some breathing problems.
description: From 0 to 5, considering 0 as no problems and 5 as a lot of problems.
quality: No missing values.

Social:
social_support: integer
definition: Allow us to know if the student has social support.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
peer_pressure: integer
definition: Show us if the student is influenced by other people (peers) to act in a certain way.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
extracuriccular_activities: integer
definition: Allow us to know if the student participates in extracurricular activities.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
bullying: integer
definition: Assess whether the student is being bullied.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.


Environmental:
noise_level: integer
definition: This is an indicator of how noisy the student’s environment is.
description: From 0 to 5, 0 considering as no noise and 5 as very noisy, disturbing.
quality: No missing values.
living_conditions: integer
definition: This variable evaluates the quality of the living conditions, like sanitary, space, security, access to infrastructures…
description: From 0 to 5, 0 is considered as the worst conditions possible and 5 as very good living conditions.
quality: No missing values.
safety: integer
definition: This variable measures the security feeling of the student in his/her environment.
description: From 0 to 5, considering 0 as a very weak security feeling and 5 as a strong security feeling.
quality: No missing values.
basic_needs: integer
definition: Basic needs are the essential requirements for human survival and well-being, including food, water, etc.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.

Academic:
academic_performance: integer
definition: Student's achievement in educational setting (grades, test scores).
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
study_load: integer
definition: Amount of academic work or coursework assigned to students.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
teacher_students_relationship: integer
definition: dynamic and ongoing interactions between teachers and students.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.
futur_career_concerns: integer
definition: Allow us to know if the student is concerned about his career.
description: From 0 to 5, considering 0 as the lowest and 5 as the highest.
quality: No missing values.


Other category:
stress_level: integer
definition: This variable measures the level of stress that the student feels.
description: From 0 to 2, considering 0 is low, 1 is mid and 2 is high.
quality: No missing values.
	
Methodology

Data import and setup

The dataset was imported by using the fread() function from the data.table package for efficient loading. To ensure the correct file path, we first set the working directory using the setwd() function

Data summary and exploration
	The function summary() enabled getting an overview of the distribution, the basic statistics, as well as the range of each variable, which led to a better understanding of the dataset. 

Categorization of factors into groups.
As said, the variables were then categorized into five factor groups: psychological, physiological, social, environmental and academic, using dataframe() as function.


Correlation analysis
With the correlation test using cor() the relation between the stress_level and the five main categories could be analyzed. This illustrated the most strongly associated factors  with stress allowing a more in-depth analysis.


Regression analysis
Building a series of linear regression models led to an enhanced assessment of the influence of various factors on stress level. The respective function is lm(stress_level~., data=data).Then, by systematically removing variables with no statistical significance, the focus only on the factors that were most impactful was ensured. To enable visualization of the impact of each variable, we used the function ggplot() creating bar plot, of the coefficients of the final linear regression model with the relevant factors.


Histograms
In order to visualize the distribution of the key variables with a significant regression coefficient that influence stress level histograms were utilized. The density of scores is displayed on the x-axis and the frequency on the y-axis. 

Logistic Regression
To better understand the factors most associated with stress levels, a binary variable was created to categorize students as either "stressed" or "not stressed". That way, and thanks to the logistic regression, this allowed the estimation of a student’s probability of being classified as stressed based on his/her factor response. Used were the functions glm() to fit the logistic regression model, summary() to view model details, predict() to generate predicted probabilities, ifelse() to convert probabilities to binary classifications,  confusionMatrix() to Evaluate model performance, varImp to assess and the importance of factor and prob.table() to visualize the model accuracy in classifying the students.


Insights and results

Correlation
As it was explained in the data description, considering the nature of the variables, we decided to group the features of the study into 5 groups: psychological, physiological, social, environmental and academic factors.This decision was made to identify the feature within each group that has the highest correlation with stress.

The results reveal that self-esteem has the strongest correlation with stress within the psychological group, with a value of -0.756. The negative relation indicates that as self-esteem increases, stress decrease. It's also worth noting that all the psychological factors show a strong correlation with stress, with values around 0.6 or higher, highlighting their significant impact on stress levels. On the other hand, within the physiological factor group, headache (0.713) and sleep quality (-0.749) show the strongest correlations with stress, followed by breathing problems (0.573) and blood pressure (0.394), which have the lowest positive correlations. This means that as headache, blood pressure, and breathing problems increase, stress also increases, whereas improvements in sleep quality are associated with a decrease in stress. From the social factor we again see an overall strong correlation across all the variables, bullying (0.75) being the one with the strongest relation. For the environmental factors safety (-0.709) and basic needs (-0.708) show the strongest relationship within the group conversely to noise levels (0.663) and living conditions (-0.581) which have a lower correlation. Finally, within the academic factors, both the teacher-student relationship (-0.680) and academic performance (-0.720) show strong negative correlations with stress, while study load (0.634) and future career concerns (0.742) exhibit positive relationships. Of these, future career concerns has the strongest correlation with stress.

Regression analysis
Although the correlation analysis gave us meaningful insights into the level and relationship of each feature with stress, a regression analysis was needed to find out the significance of each factor to students’ stress. The final model only includes highly significant variables with  p-values lower than 0.001.
As demonstrated, the most influential factors on the students’ stress, in descending order according to the p-value are: self esteem, noise level, headache, sleep quality, bullying, basic needs, academic performance, study load and extracurricular activities. The lowest p-value of the model (<2.2e-16 ) and high F-statistic (414.4) indicates that the linear regression is well adjusting the data. The coefficient indicates that for each unit that the variable increases, the stress of the student is going to be affected according to the value of the coefficient. For example, for each unit headache increases, the stress level of the student is going to increase by 0.07 %, being the most influential factor. Followed by noise level, bullying and sleep quality. Hence, if the school is interested in implementing measures to decrease students' stress levels, these measures will be more effective if they focus on reducing noise levels and bullying, since headaches are not a factor that they can realistically control. On the other hand, regarding the objective question of this report,  “which specific feature within each factor group has the most significant impact on student stress, based on the dataset?” and using the result of the linear regression, we can state that the most significant feature between the psychological factors is self esteem , for physiological is headache, for social is bullying , for environmental is noise level and for academic is academic performance. 

Histograms

We decided to visualize the most influential variables of our regression model to understand the overall characteristics of the students using histograms. This approach helps identify the general condition of the students and determine how many may need intervention from the school. 

Regarding study load, self-esteem, extracurricular activities, and bullying, the overall results show a medium perception of study load, low scores on bullying, a medium score for extracurricular activities, and high self-esteem. These findings suggest that, in general, the students are in a good condition, with relatively low levels of bullying and a strong sense of self-esteem. However, the school may want to look deeper into the students who marked the maximum score on bullying and the lowest on self esteem as these may indicate emergency cases. On the other hand, the school could investigate further on the students who reported a high study load because that may be impeding the extracurricular activities as these two variables showed a strong correlation of almost 0.6 and the high study load and low extracurricular activities consequently enhance the stress of the students. Another valuable insight is that the majority of the students reported bad sleep quality and a good proportion indicated high levels of headaches and high exposure to noise. Addressing these issues could potentially reduce the stress levels among students. For instance, a campaign to improve sleep hygiene, stocking the school with natural treatments for headaches, and creating quiet learning environments could be beneficial in supporting the well-being of the students. 

Logistic regression

Here now the output from the logistic regression model that attempts to predict whether a student is stressed (Stressed_student) based on various predictors, including psychological, physiological, social, environmental, and academic factors. 
Focusing on the factors with a statistically significant impact, the results show that academic performance, sleep quality, basic needs, safety, and headaches have the strongest influence on student stress, with both positive and negative log-odds values indicating whether these factors increase or decrease the likelihood of a student being classified as stressed. For example, basic needs has the largest negative effect (-0.477), meaning that when basic needs are not met, the likelihood of being stressed decreases by 0.477 on the log-odds scale. The same interpretation can be applied to the other significant factors.
The varImp() function reveals the relative importance of each predictor based on its contribution to the model. Basic needs (3.928), academic performance (3.882), sleep quality (3.630), and safety (3.285) have the highest importance values, indicating they are the most influential factors in predicting stress. In contrast, self-esteem (0.404), peer pressure (0.697), and teacher-student relationship (0.619) have the lowest importance, suggesting they are less significant predictors of stress.
The prop.table() function converts the counts in the confusion matrix into proportions, helping to evaluate the model's accuracy. The model shows good accuracy, with high proportions of correct predictions: 64% for stressed students and 24% for non-stressed students. It has a low false negative rate of 1%, meaning it rarely misses identifying stressed students, but an 11% false positive rate, indicating it sometimes incorrectly classifies non-stressed students as stressed.


Conclusion

In conclusion, this study offers a thorough analysis of the primary factors influencing student stress, categorized into psychological, physiological, social, environmental, and academic domains. The findings reveal that self-esteem, headaches, bullying, noise levels, and academic performance significantly impact stress levels. Notably, noise and bullying are highlighted as key areas where schools can intervene to reduce stress effectively.
The regression analysis emphasizes that fulfilling basic needs, ensuring safety, and promoting good sleep quality are strongly linked to lower stress levels. Furthermore, strong teacher-student relationships and social support can help mitigate the stress associated with academic demands. These insights suggest that schools could effectively lower student stress by addressing environmental factors, implementing anti-bullying policies, and providing wellness resources. By focusing on these strategies, educational institutions can foster a more supportive environment that promotes both student well-being and academic success.

