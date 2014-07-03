library(shiny)
library(poppr)

shinyUI(
  navbarPage("Population Genetics in R",
             theme = "bootstrap.css",
             tabPanel("Load data"),
             navbarMenu("Analysis",
                tabPanel("Poppr"),
                tabPanel("More")),
             navbarMenu("Help",
                tabPanel("Help", verbatimTextOutput("help")),
                tabPanel("Session info", verbatimTextOutput("sessioninfo"))),
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
            tableOutput('load_data')
            )
             
      # application UI              
))
