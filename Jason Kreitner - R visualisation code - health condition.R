
health <- read.csv(file = 'C:/Users/jasonak/OneDrive - The University of Melbourne/Documents/Jason/LaTrobe/BUS5VA/Assignment 2/aushealth.csv')

library(ggplot2)


ggplot(health, aes(x = year, y = prop_population, color = factor(health_cond))) + 
  geom_point() + xlab('Year') + ylab('Population proportion') + 
  ggtitle('Proportion of population by health condition: change from 2011 - 2018') + 
  geom_smooth(method = 'lm') +
  geom_point(data = subset(health, health_cond == 'Back problems'), color = 'green', size = 4) +
  geom_point(data = subset(health, health_cond == 'Mental and behavioural problems'), color = 'purple', size = 4) +
  theme_bw()

