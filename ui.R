library(shiny)
library(markdown)
library(poppr)

shinyUI(
  navbarPage('Population Genetics in R',
     theme = 'bootstrap.css',
         tabPanel('Load data',
              sidebarPanel(
                fileInput('file1', 'Load data',
                          accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
#                tags$hr(),
                checkboxInput('header', 'Header', FALSE),
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
     navbarMenu('Analyses',
        tabPanel('Poppr',
                headerPanel('Poppr analysis'),
                sidebarPanel(
                  checkboxInput('clone', 'Clone correct', FALSE),
                  numericInput('resample', 'Permutation sample:', value = 0)
                ),
              mainPanel(
                tableOutput('poppr')
              )
          ),
        tabPanel('AMOVA'),
        tabPanel('Other')
      ),
     navbarMenu('Help',
        tabPanel('About',
            fluidRow(
                column(6,
                includeMarkdown('about.md')
            )
            )
      ),
        tabPanel('Session info', verbatimTextOutput('sessioninfo')
      ))
  )
  
# application UI
  
)

