library(shinythemes)

shinyUI(navbarPage(img(src = 'BMNT_White_Smaller.png', align = "right", 
                       width = 150, height = 50),
                   theme = shinytheme("flatly"),
                   tabPanel(actionButton("viability", "Viability Calculator"),
  
                    sidebarLayout(
                          sidebarPanel(
                            helpText("Top Deficencies "),
                            
                            htmlOutput("text"),
                            
                            helpText(),
                            selectInput('x', 'Choose Contract:',
                                        choices = data$`Problem Owner Title`),
                            radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                                         inline = TRUE),
                            downloadButton('downloadReport')
                          ),
                          mainPanel(
                            htmlOutput("googleForm")
                          )
    )
  )
)
)
