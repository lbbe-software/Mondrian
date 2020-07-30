shinyServer(function(input, output) {
  
  ##########################################
  ############### runex1 ###################
  ##########################################
  output$ex1plot <- renderPlot({
    data(endosymbiont_1pop)
    mondrian(endosymbiont_1pop, col = c("blue", "red", "yellow"))
  })
  
  output$ex1table <- renderPrint({
    data(endosymbiont_1pop)
    res <- mondrian(endosymbiont_1pop, col = c("blue", "red", "yellow"))
    return(res)
  })
  
  output$ex1data <- renderDataTable({
    data(endosymbiont_1pop)
    DT::datatable(endosymbiont_1pop, options = list(pageLength = 10, searching = FALSE))
  })
  
  
  
  ##########################################
  ############### runex2 ###################
  ##########################################
  
  output$ex2plot <- renderPlot({
    data(endosymbiont_3pop)
    mondrian(endosymbiont_3pop, pop = 1)
  })
  
  output$ex2table <- renderPrint({
    data(endosymbiont_3pop)
    res <- mondrian(endosymbiont_3pop, pop = 1)
    return(res)
  })
  
  output$ex2data <- renderDataTable({
    data(endosymbiont_3pop)
    DT::datatable(endosymbiont_3pop, options = list(pageLength = 10, searching = FALSE))
  })
  
  
  ##########################################
  ############## runmyplot #################
  ##########################################
  loaddata <- reactive({
    input$doplot
    isolate({
      
      inFile <- input$file
      if (! is.null(inFile)) {
        
        ## data import
        dd <- read.table(inFile$datapath, header = TRUE)
        # TODO message d'erreur s'il n'y a pas les bonnes colonnes dans le fichier d'entrée
        xx <- input$xlab
        yy <- input$ylab
        indiv <- input$indiv
        
        if (input$pop == "multipop") {
          mm <- ""
          pp <- input$numpop
          
          ## labels
          ll <- NULL
          ## colors
          if (input$colors == "")
            cc <- NULL
          else
            cc <- rep(strsplit(input$colors, " ")[[1]], length.out = NCOL(dd) - 1)
          
          
        } else {
          pp <- NULL
          mm <- input$main  
          
          ## labels
          if (input$labels == "")
            ll <- colnames(dd)
          else
            ll <- rep(strsplit(input$labels, " ")[[1]], length.out = NCOL(dd))
          
          ## colors
          if (input$colors == "")
            cc <- NULL
          else
            cc <- rep(strsplit(input$colors, " ")[[1]], length.out = NCOL(dd))
        }
        
        return(list(dd = dd, ll = ll, cc = cc, pp = pp, xx = xx, yy = yy, mm = mm, indiv = indiv))
      }
    })
  })
  
  
  plotdata <- reactive({
    res <- loaddata()
    isolate({
      if(is.null(res$pp) & ("pop" %in% names(res$dd))) {
        return("Your dataset contains a 'pop' column indicating that your dataset comes from several sub-populations. You must indicate in which column the sub-population factor is in your dataset.")
      } else if (!is.null(res$pp) & !("pop" %in% names(res$dd))) {
        return("Your dataset don't contain a 'pop' column indicating that your dataset comes from a unique sub-population. You must indicate that your dataset come from 'only one population'.")
      } else {
        mm <- mondrian(res$dd, labels = res$ll, xlab = res$xx, ylab = res$yy, main = res$mm, col = res$cc, pop = res$pp, indiv = res$indiv)
        return(mm)
      }
    })    
  })
  
  
  validateFile <- function(){
    inFile <- input$file
    extFile <- file_ext(inFile$name)
    validate(
      need(extFile == "txt" | extFile == "csv", "Only .txt or .csv files are allowed.")
    )
  }
  
  
  output$mondrianplot <- renderPlot({
    input$doplot
    isolate({
      inFile <- input$file
      if (! is.null(inFile)) {
        validateFile()
        plotdata()
      }
    })
  })
  
  
  output$mondriantable <- renderPrint({
    input$doplot
    isolate({
      inFile <- input$file
      if (! is.null(inFile)) {
        validateFile()
        res <- plotdata()
        if (! is.null(res))
          return(res)
      }
    })
  })
  
  output$mondriandata <- renderDataTable({
    input$doplot
    isolate({
      inFile <- input$file
      if (! is.null(inFile)) {
        validateFile()
        res <- as.data.frame(loaddata()$dd)
        res <- res[complete.cases(res), ]
        DT::datatable(res, options = list(pageLength = 10, searching = FALSE))
      }
    })
  })
  
  
  
  
  
  
  
  plotdata2 <- function() {
    res <- loaddata()
    mondrian(res$dd, labels = res$ll, xlab = res$xx, ylab = res$yy, main = res$mm, col = res$cc, pop = res$pp, indiv = res$indiv)
  }
  
  output$save <- downloadHandler(
    filename = function() {
      paste("mondrian_", Sys.Date(), ".png", sep = "")
    },
    
    content = function(file) {
      png(file)
      plotdata2()
      dev.off()
    },
    contentType = 'image/png'
  )
  
  #   outputOptions(output, "save", suspendWhenHidden = FALSE)
  
  
  
  
})
