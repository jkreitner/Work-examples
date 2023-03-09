
crime <- read.csv(file = 'C:/Users/jasonak/OneDrive - The University of Melbourne/Documents/Jason/LaTrobe/BUS5VA/Assignment 2/crimedata.csv')

install.packages("plotly")
install.packages("ggmap")
library(ggmap)
library(shiny)

register_google("AIzaSyBQSrHK6G8iKpgbfKHpbouEpyh_ail-qdk")
centre <- c(median(crime$lon, na.rm = T), median(crime$lat, na.rm = T))
map <- get_map(location = centre, zoom = 10)

crime$date <- as.Date(crime$date, format = '%d/%m/%Y')

ggmap(map) +
  stat_density2d(data = subset(crime, offense == 'rape'), aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
                 geom = 'polygon') +
  scale_fill_gradient(low = 'green', high = 'red') +
  scale_alpha_continuous(range = c(0, 0.5)) +
  ggtitle('Crime in Houston TX', subtitle = 'Occurrences of rape are concentrated around two areas in the city') +
  xlab('Longitude') + ylab('Latitude') +
  theme_bw()

marapr <- subset(crime, offense != "theft" & date >= "2010-03-01" & date <= "2010-04-30")

ui <- fluidPage(
  
  # Give the page a title
  titlePanel("Crime in Houston by offense: Mar - Apr 2010"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("offense", "Offense:", 
                  c("aggravated assault", "murder", "rape", "burglary", "robbery", "auto theft")),
      hr(),
      helpText("Data from Houston, TX)")
    ),
    
    # Create a spot for the plot
    mainPanel(
      plotOutput("crimePlot")  
    )
    
  )
  
)


# *******************************************************
# Create the server function
# *******************************************************
server <- function(input, output) {
  
  output$crimePlot <- renderPlot(
    
    ggmap(map) +
      stat_density2d(data = subset(marapr, offense == input$offense), aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
                     geom = 'polygon') +
      scale_fill_gradient(low = 'green', high = 'red') +
      scale_alpha_continuous(range = c(0, 0.5)) +
      ggtitle('Crime in Houston TX', subtitle = 'Crime in Houston TX by offense: Mar - Apr 2010') +
      xlab('Longitude') + ylab('Latitude') +
      theme_bw()
    
  )
  
}


# *******************************************************
# Run the App
# *******************************************************
shinyApp(ui, server)
