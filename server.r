# Define server logic to read selected file ----
server <- function(input, output) {
  
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    req(input$file1)
    
    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    tryCatch(
      {
        current.folder<-"D:/RWebProject/ShinyApp-ver1/"
        file.copy(input$file1$datapath,paste0(current.folder,"newData.csv"), overwrite = TRUE)  
        #df <- read.csv(input$file1$datapath
                       #header = input$header,
                       #sep = input$sep,
                       #quote = input$quote
         #              )
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
    
    #if(input$disp == "head") {
      #return(head(df))
      #print(nrow(df))
      print(input$text)
      
      
     
    #}
    #else {
      #return(nrow(df))
      
    #}
    
  })
  
}

