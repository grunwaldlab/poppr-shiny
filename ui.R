shinyUI(
  navbarPage("Population Genetics in R",
     theme = "bootstrap.css",
         tabPanel("Load data",
              sidebarPanel(
                fileInput('file1', 'Load data',
                          accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                tags$hr(),
                checkboxInput('header', 'Header', TRUE),
                radioButtons('sep', 'Separator',
                             c(Comma=',',
                               Semicolon=';',
                               Tab='\t'),
                             'Comma')
              ),
              mainPanel(
                tableOutput('loaddata')
              )
         ),
     navbarMenu("Analysis",
        tabPanel("Poppr"),
        tabPanel("More")
      ),
     navbarMenu("Help",
        tabPanel("Help"),
        tabPanel("Session info", verbatimTextOutput("sessioninfo")
      )
  )
  
# application UI
  
  
  
))

