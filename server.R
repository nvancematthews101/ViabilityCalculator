# server.R


calculator <- parse("ViabilityCalculator.R")
eval(calculator)

calculate('test')

## ======================
googleform_embed_link <- "https://docs.google.com/forms/u/0/d/e/1FAIpQLSdsI2YcVwgPIRrGxcKF4vmRlRo26Jso7Qqh0wejR5NBssIJ9w/viewform?usp=sf_link"
googleform_data_url <- "https://docs.google.com/spreadsheets/d/1_noc-xikccP62ZZFCt7FkHD3W8A1RQrSEDuG4EAZeyw/pubhtml?widget=true&amp;headers=false"
## ======================

shinyServer(function(input, output) {
      
      ss <- gs_url(googleform_data_url, lookup = FALSE, visibility = "public")
      output$googleForm <- renderUI({
        tags$iframe(id = "googleform",
                    src = googleform_embed_link,
                    width = 600,
                    height = 800,
                    frameborder = 0,
                    marginheight = 0)
      })
      
      output$text1 <- renderText({
        calculate(input$x)
      })
      
      output$text <- renderUI({
        calculate(input$x)
        HTML(paste(str1, str2, str3, str4, str5,
                   str6, str7, sep = '<br/>'))
      })
      
      
      output$downloadReport <- downloadHandler(
        filename = function() {
          paste('my-report', sep = '.', switch(
            input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
          ))
        },
        
        content = function(file) {
          src <- normalizePath('report.Rmd')
          
          # temporarily switch to the temp dir, in case you do not have write
          # permission to the current working directory
          owd <- setwd(tempdir())
          on.exit(setwd(owd))
          file.copy(src, 'report.Rmd', overwrite = TRUE)
          
          library(rmarkdown)
          out <- render('report.Rmd', switch(
            input$format,
            PDF = pdf_document(), HTML = html_document(), Word = word_document()
          ))
          file.rename(out, file)
        }
      )
      
  }
  
)




