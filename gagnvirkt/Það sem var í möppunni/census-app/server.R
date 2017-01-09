# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)


shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      data = switch(input$var,
                    "Percent White" = counties$white,
                    "Percent Black" = counties$black,
                    "Percent Hispanic" = counties$hispanic,
                    "Percent Asian" = counties$asian )
      
      legend = switch(input$var,
                    "Percent White" = "% White",
                    "Percent Black" = "% Black",
                    "Percent Hispanic" = "% Hispanic",
                    "Percent Asian" = "% Asian")
      
      color = switch(input$var,
                      "Percent White" = "darkgreen",
                      "Percent Black" = "black",
                      "Percent Hispanic" = "darkorange",
                      "Percent Asian" = "darkviolet")
      
      
      percent_map(data, "darkgreen",legend,input$range[1],input$range[2])
    })
    
  }
)
