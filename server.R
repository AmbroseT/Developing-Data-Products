require(shiny)
require(googleVis)

## read in data
dat <- read.csv("www/crimeStates.csv", sep=",", header = TRUE, stringsAsFactors = FALSE)

## initialize axis data for scatterplot
plotNames <- "Population"

shinyServer(
  function(input, output) {
    
    myYear <- reactive({
      input$Year
    })
    
    ## Google Vis Map
    output$gvis <- renderGvis({
      myData <- subset(dat, 
                       (Year > (myYear()-1)) & (Year < (myYear()+1)))
      gvisGeoChart(myData,
                   locationvar="state", 
                   colorvar=input$crime,
                   options=list(region="US", 
                                resolution="provinces",
                                width=500, height=325,
                                colorAxis="{colors:['#FFFFFF', '#0000FF']}"
                   ))     
    })
    
    ## Google Vis scatterplot with linear regression
    output$myPlot <- renderGvis({
      plotNames <- c(plotNames, input$crime)
      myData <- subset(dat, 
                       (Year > (myYear()-1)) & (Year < (myYear()+1)))
      scatterDat <- myData[, names(myData) %in% plotNames]
      gvisScatterChart(scatterDat, options=list(trendlines="{0:{
                                                              color: 'red'
                                                               }
                                                            }",
                                                width=450, height=250,
                                                title=paste("You selected: ", input$crime, " in ", input$Year),
                                                hAxis="{title:'Population'}",
                                                legend = "{position: 'none'}"))
    })
})