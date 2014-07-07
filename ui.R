library(shiny)
library(markdown)
library(poppr)

shinyUI(
  navbarPage("Population Genetics | Poppr R",
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
     navbarMenu("Analyses",
        tabPanel("Poppr"),
        tabPanel("AMOVA"),
        tabPanel("Other")
      ),
     navbarMenu("Help",
        tabPanel("About",
            fluidRow(
                column(6,
                includeMarkdown("about.md")
            )
            )
      ),
        tabPanel("Session info", verbatimTextOutput("sessioninfo")
      ))
  )
  
# application UI
  
  
  
)

