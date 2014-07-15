library(shiny)
library(poppr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  mydata <- reactive({
  
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
  })
  
  gen.data <- reactive({
  
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
     read.genalex(inFile$datapath, sep=input$sep) 
  })

  basicstats <- reactive({
    poppr(gen.data(), clonecorrect=input$clone, sample = input$resample,
      quiet=TRUE)
  })
  
  output$poppr <- renderTable({
    basicstats()
  })
  
  output$loaddata <- renderTable({
    mydata()
  })

  output$sessioninfo <- renderPrint({
    cat("\n== R version ==\n")
    print(R.version)
    
    cat("\n== Date ==\n")
    print(date())
    
    cat("\n== poppr version ==\n")
    print(packageDescription("poppr", fields=c("Package", "Version", "Date", "Built")))
    
    cat("\n== attached packages ==\n")
    print(search())
    
  })
  
})