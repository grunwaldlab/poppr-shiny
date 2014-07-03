library(shiny)
library(poppr)

shinyUI(
  navbarPage("Population Genetics in R",
             theme = "bootstrap.css",
             tabPanel("Load data"),
             navbarMenu("Analysis",
                tabPanel("Poppr", verbatimTextOutput("poppr")),
                tabPanel("More")),
             tabPanel("Help"),
             sidebarPanel(
               fileInput('file1', 'Load file',
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
            tableOutput('contents')
            )
             
      # application UI              
))
