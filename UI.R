shinyServer(
  navbarPage("Histogram with simulated random variables",
      tabPanel("Graph",
      
      sidebarLayout(
        sidebarPanel(
        selectInput("distribution", "Please select the Distribution type:",
                choices=c("Normal", "Exponential")),
        sliderInput("sampleSize", "Please select Sample Size:",
                      min=100, max=5000, value=1000, step=100),
        conditionalPanel(condition="input.distribution == 'Normal'",
                         textInput("mean", "Please select the mean", 10),
                         textInput("sd", "Please select the Standard Deviation",3)),
        conditionalPanel(condition="input.distribution == 'Exponential'",
                         textInput("lambda", "Please select Exponential Lambda:",1))
        ),
    
      mainPanel(   
        plotOutput("myplot")
        )   
      )
      
      ),
    
    tabPanel("About",
             mainPanel(
               includeMarkdown("about.md")
             )
    )
)
)