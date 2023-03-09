
grandslam <- read.csv(file = 'C:/Users/jasonak/OneDrive - The University of Melbourne/Documents/Jason/LaTrobe/BUS5VA/Assignment 2/grandslamdata.csv')

library(plyr)

totals <- count(grandslam, winner)

totals

winners <- head(arrange(totals,desc(n)), n = 10)

ggplot(data = winners, aes(x = winner, y = n, color = winner)) +
  geom_bar(stat="identity", fill = "white") +
  xlab('Player') + ylab('Total grand slams won') + ggtitle('Top 10 winners of grand slam tournaments since 1955') +
  theme(axis.text.x = element_text(angle = 50, hjust = 1))

top10 <- subset(grandslam, winner == "Roger Federer" | winner == "Rafael Nadal" | 
                  winner == "Pete Sampras" | winner == "Novak Djokovic" | winner == "Roy Emerson" | 
                  winner == "Bjorn Borg" |
                  winner == "Rod Laver" |
                  winner == "William T. Tilden" |
                  winner == "Andre Agassi" |
                  winner == "Fred Perry")


performance <- count(top10, winner, tournament)



ggplot(data = performance, aes(x = winner, y = n, color = winner)) +
  geom_bar(stat="identity", fill = "white") +
  xlab('Player') + ylab('Total grand slams won') + ggtitle('Top 10 winners of grand slam tournaments since 1955') +
  facet_wrap( . ~ factor(tournament), nrow = 4) +
  theme(axis.text.x = element_text(angle = 50, hjust = 1))