# api: Student performance in California schools

# The Academic Performance Index is computed for all California  schools based on standardised testing of students. The data sets  contain information for all schools with at least 100 students and  for various probability samples of the data. Please see the following website for the columns definitions:
  # https://www.rdocumentation.org/packages/survey/versions/4.1-1/topics/api 

## Details

# "apipop" is the entire population, 
# "apisrs" is a simple random sample, 
# "apiclus1" is a cluster sample of school districts, 
# "apistrat" is a sample stratified by stype, and 
# "apiclus2" is a two-stage cluster sample of schools within districts. 
# The sampling weights in apiclus1 are incorrect (the weight should be 757/15) but are as obtained from UCLA.

# Assignment 4
# To use the "apipop" dataframe please run the following syntaxes. The dataframe for all parts is "apipop".
# ========================================================================
library(tidyverse)
library(survey)
data(api)

# ========================================================================

## Part a) 
# create a bar plot to show the number of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================
school_count <- apipop %>% 
  group_by(stype) %>% 
  summarise(n = n())

ggplot(school_count, aes(x = stype, y = n)) + 
  geom_col() + 
  labs(x = "School Type", y = "Number of Schools", title = "Number of Schools by Type")

# ========================================================================

## Part b) 
# create a bar plot to show the percentage of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================
school_percent <- apipop %>% 
  group_by(stype) %>% 
  summarise(n = n()) %>% 
  mutate(perc = n/sum(n)*100)

ggplot(school_percent, aes(x = stype, y = perc)) + 
  geom_col() + 
  labs(x = "School Type", y = "Percentage of Schools", title = "Percentage of Schools by Type")

# ========================================================================

## Part c) 
# create a bar plot to show the number of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  
# ========================================================================
awards_count <- apipop %>% 
  group_by(stype, awards) %>% 
  summarise(n = n())

ggplot(awards_count, aes(x = stype, y = n, fill = awards)) + 
  geom_col(position = "dodge") + 
  labs(x = "School Type", y = "Number of Schools", fill = "Awards Eligibility", title = "Number of Schools by Awards Eligibility and Type")


# ========================================================================

## Part d) 
# create a bar plot to show the percentage of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  

# ========================================================================
awards_percent <- apipop %>% 
  group_by(stype, awards) %>% 
  summarise(n = n()) %>% 
  mutate(perc = n/sum(n)*100)

ggplot(awards_percent, aes(x = stype, y = perc, fill = awards)) + 
  geom_col(position = "dodge") + 
  labs(x = "School Type", y = "Percentage of Schools", fill = "Awards Eligibility", title = "Percentage of Schools by Awards Eligibility and Type")

# ========================================================================

## Part e) 
# use facet to create two histogram to show the distributions of the "number of students enrolled" in all school whether are "Eligible for awards program" or not (bins=30).
# ========================================================================
apipop %>%
  ggplot(aes(x = enroll)) +
  geom_histogram(aes(fill = factor(awards)), 
                 binwidth = 30, 
                 alpha = 0.7, 
                 position = "dodge") +
  facet_wrap(~awards, ncol = 2) +
  labs(x = "Number of Students Enrolled", y = "Frequency",
       title = "Distribution of Number of Students Enrolled by Eligibility for Awards Program") +
  theme_bw()


# ========================================================================
