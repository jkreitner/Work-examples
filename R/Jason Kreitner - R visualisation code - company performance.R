
stocks <- read.csv(file = 'C:/Users/jasonak/OneDrive - The University of Melbourne/Documents/Jason/LaTrobe/BUS5VA/Assignment 2/bigstocks.csv')

library(ggplot2)
install.packages("ggthemes")
library(ggthemes)

stocks$date <- as.Date(stocks$date, format = '%d/%m/%Y')

bigfour <- subset(stocks, company == "Apple" | company == "Amazon" | company == "Google" | company == "Facebook")

#comparing the shares performance of the big four companies over time
ggplot(bigfour, aes(x = date, y = close_price, color = company)) + 
  geom_line() + 
  xlab('Date') + ylab('Closing share price') + 
  ggtitle('Company performance over time according to closing share price') + 
  theme_bw()

#reducing the date range to between 2013 and 2015
bigfour2 <- subset(bigfour, date >= "2013-01-01" & date <= "2015-12-31")

#creating subsets for each company in the date range
apple <- subset(bigfour2, company == "Apple")
amazon <- subset(bigfour2, company == "Amazon")
google <- subset(bigfour2, company == "Google")
facebook <- subset(bigfour2, company == "Facebook")

#finding the median share volume for each company
applemedian <- median(apple$volume)
amazonmedian <- median(amazon$volume)
googlemedian <- median(google$volume)
facebookmedian <- median(facebook$volume)

#creating a jitter plot 
ggplot(data = bigfour2, aes(x = date, y = volume)) +
  geom_point() +  
  facet_wrap( . ~ factor(company), scales = 'free') +
  geom_point(data = amazon, color = 'red', size = 1) +
  geom_point(data = apple, color = 'green', size = 3) +
  geom_point(data = google, color = 'purple', size = 1) +
  geom_point(data = facebook, color = 'blue', size = 1) +
  xlab('Year') + ylab('Share volume') + ggtitle('Apple has the highest median share volume among the "Big Four" between 2013 and 2015') +
  theme(axis.text.x = element_text(angle = 50, hjust = 1))

