shinyServer(
  function(input, output, session){
    
    output$myplot <- renderPlot({
      
      distType <- input$distribution
      size <- input$sampleSize
      
      if (distType == "Normal") {
        
        randomVec <- rnorm(size, mean = as.numeric(input$mean), sd=as.numeric(input$sd))
        #randomVec <- rnorm(1000, mean = 15, sd=2)
        
      }
      else {
        randomVec <- rexp(size, rate = 1/ as.numeric(input$lambda))
        #randomVec <- rexp(100, rate = 1/ 1)
      }
      
      hist(randomVec, col="blue")
    })
  }
  
  )