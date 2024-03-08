
shinyUI(fluidPage(
  titlePanel(
    title = "",
    tags$head(tags$link(rel = "icon", type = "image/png", href = "hexsticker.png"), tags$title(" Mondrian Shiny App"))
  ),
  theme = "bootstrap.css",
  br(),
  wellPanel(
    fluidRow(
      column(width = 3, 
             br(), 
             img(src = "hexsticker.png", width = 200, style = "float:center"),
             br(), br(), br(), br(),
             img(src = "logolbbe.png")
      ),
      
      column(width = 8, 
             h4(tags$b("Mondrian shiny app"),  "is an interactive way to use the functionalities of the ", em("R"), " package", em("Mondrian"), 
                "which represent in a single graph the relative occurrence and co-occurrence of events measured in a sample. 
                The graphical output recalls Mondrian’s paintings."),
             br(),
             h4("When you use this app, please cite the ", em("Mondrian R"), " package:", br(),
                "A. Siberchicot, D. Charif, G. Terraz and F. Vavre", 
                a("https://cran.r-project.org/web/packages/Mondrian/", href = "https://cran.r-project.org/web/packages/Mondrian/", TARGET="_blank", style="color:blue;")), 
             br(), 
             h4("This app uses the development version of the Mondrian package available at ", 
                a("https://github.com/lbbe-software/Mondrian", href = "https://github.com/lbbe-software/Mondrian", TARGET="_blank", style="color:blue;"), "."),
             br(), hr(), br(),
             radioButtons("whattodo", 
                          h4("You can choose either to look at the two available examples or plot your own data on a mondrian plot."), 
                          c("run the 1st example" = "runex1", "run the 2nd example" = "runex2", "make your own graph" = "runmyplot"),
                          selected = 0)
      )
    )
  ),
  
  
  conditionalPanel(
    condition = "input.whattodo == 'runex1'",
    "This first example computes the data named ", em("endosymbiont_1pop")," embeded in the ", em("Mondrian"), " package.", br(), br(), 
    
    h3(em(strong("Input"))),
    "The data set contains 10 observations (each individual, in rows) on the following 3 variables (each endosymbiont, in columns): ", 
    em("C"), ", ", em("H"), ", and ", em("W"), " are numeric vectors indicating if the endosymbiont is detected.", br(), 
    "The presence of a symbiont in an individual is indicated by ", em("1"), " and its absence by ", em("0"), ".", br(), br(),
    DT::dataTableOutput("ex1data"),
    br(), hr(), br(), 
    
    h3(em(strong("Output"))),
    "The mondrian function produces one plot and one table of results.", br(), br(),
    "The output table has two rows (the first containing the distinct profiles of multiple infection and the second the prevalence of each profiles) 
                    and as many columns as profiles of multiple infection.", br(), 
    "Here, there are 3 distincts profiles.
                    Individuals having the first infection profile (110) are infected by the symbionts 'C' (1) and 'H' (1), and not by the symbiont 'W' (0).
                    Individuals having the second infection profile (011) are infected by the symbionts 'H' (1) and 'W' (1), and not by the symbiont 'C' (0).
                    Finaly, individuals having the third infection profile (010) are infected by the symbiont 'H' (1) and not by the symbionts 'C' (0) and 'W' (0).", br(), br(),
    "The columns of the output table (containing profiles of multiple infection) match with the 'lines' in the output plot.", br(), br(),
    "Here, all individuals are infected by the 'H' symbiont (central red column in the plot) but only 0.2% of the sample are only infected
                    by this symbiont (column '010' in the table of results).", br(),
    "0.6% of the sample (i.e., 6 individuals among 10) are coinfected by the symbionts 'C' (blue column in the plot) and 'H' (red column) and 
                    only 0.2% (i.e., 2 individuals among 10) are coinfected by the symbionts 'W' (yellow column) and 'H' (red column).",
    br(), br(), br(), 
    verbatimTextOutput("ex1table"), br(), br(),
    plotOutput("ex1plot", height = "500px"),
    br()
  ),
  
  conditionalPanel(
    condition = "input.whattodo == 'runex2'",
    "This second example computes the data named ", em("endosymbiont_3pop")," (the data set is shown below) embeded in the ", em("Mondrian"), " package.", br(), br(), 
    
    h3(em(strong("Input"))),
    "The data set contains 30 observations (each individual, in rows) on the following 6 variables (including 5 endosymbionts, in columns): ", em("pop"), " is a factor 
                    (with 3 levels: ", em("AlxT"), ", ", em("MalD"), " and ", em("MslCh"), ") indicating which of the three populations each individuals belongs and ", em("A"), ", ",
    em("C"), ", ", em("H"), ", and ", em("W"), " are numeric vectors indicating if the endosymbiont is detected. ", br(),
    "The presence of a symbiont in an individual is indicated by ", em("1"), " and its absence by ", em("0"), ".", br(), br(),
    DT::dataTableOutput("ex2data"),
    br(), hr(), br(), 
    
    h3(em(strong("Output"))),
    "The mondrian function produces one plot and one list of results.", br(), br(),
    "The output is a list of tables (containing the distinct profiles of multiple infection) for the sub-populations and the whole sample.
                    ", br(), 
    "Here, there are 3 sub-populations ('$AlxT', '$MalD' and '$MslCh') in the sample ('$pop').", br(), 
    "- In the first sub-population ('$AlxT', first element in the output list, at the top-left of the plot), there are 10 individuals which are all (100%, there is only one column in the 
                    '$AlxT' element of the output list) coinfected by the symbionts 'C' (blue column) and 'H' (green column); their profile of multiple infection is '01100'.", br(), 
    "- In the second sub-population ('$MalD', second element in the output list, at the top-right of the plot), most individuals (0.7% of 10 individuals, see the last column of the 
                    '$MalD' element of the output list) are singly-infected by the 'H' symbiont (green column).", br(), 
    "- In the 'MslCh' sub-population (third element in the output list, at the bottom-left of the plot), most individuals (0.4% of 10 individuals, see the third column of the '$MslCh' 
                    element of the output list).", br(), 
    "- In the whole sample (last element in the output list, at the bottom-right of the plot), the 30 individuals are split into 9 distinct profiles of multiple infection. 
                    The prevalent profile of multiple infection (0.13% of 30 individuals, see the third column of the '$pop' element of the output list) is a coinfection 
                    by the symbiont 'C' and 'H'.", 
    br(), br(), br(), 
    verbatimTextOutput("ex2table"), br(), br(), 
    plotOutput("ex2plot", height = "700px"),
    br()
  ),
  
  conditionalPanel(
    condition = "input.whattodo == 'runmyplot'",
    fluidRow(
      column(width = 5,
             wellPanel(
               fileInput("file", label = "1 - File input"),
               fileinfo <- bsTooltip("file", "It must be a data frame where the first line contains the column names and where data are separated by a tabulation. Rows with missing data are removed.", placement = "bottom", trigger = "hover"),
               h5("See ", a("here", href = "exampleFile_onepop.txt", TARGET = "_blank", style="color:blue;"), " an example file in which all individuals belong to an unique population"),
               h5("See ", a("here", href = "exampleFile_multipop.txt", TARGET = "_blank", style="color:blue;"), " an example file in which individuals belong to three distinct populations"),
               hr(),
               
               radioButtons("pop", "2 - Number of population", c("only one population" = "onepop", "several populations" = "multipop")),
               fileinfo <- bsTooltip("pop", "How many populations are pooled in your dataset?", placement = "bottom", trigger = "hover"),
               conditionalPanel(
                 condition = "input.pop == 'onepop'",
                 textInput("labels", label = "3 - Change the labels columns name (*)"), 
                 fileinfo <- bsTooltip("labels", "Here, you can change the default labels (i.e., the first line of your dataset). The labels must be separated by a space and are recycled if necessary.", placement = "bottom", trigger = "hover")
               ),
               
               conditionalPanel(
                 condition = "input.pop == 'multipop'",
                 numericInput("numpop", "3 - Population index", value = 1),
                 fileinfo <- bsTooltip("numpop", "A number index indicating the number of the column containing the population's factor. If it is missing, individuals are an unique population.", placement = "bottom", trigger = "hover")
               ),
               
               textInput("colors", label = "4 - Change the columns colors (*)"), 
               fileinfo <- bsTooltip("colors", "Here, you can change the default colors (i.e., the palette Set1 defined by the function brewer.pal of the RColorBrewer package). The colors must be separated by a space and are recycled if necessary.", placement = "bottom", trigger = "hover"),
               
               checkboxInput("indiv", tags$b("5 - Add lines between each individual status"), value = FALSE, width = NULL),
               
               hr(),
               textInput("xlab", label = "6 - Change the x-axis label (*)"), 
               fileinfo <- bsTooltip("xlab", "Here, you can change the x-axis label (empty by default).", placement = "bottom", trigger = "hover"),
               textInput("ylab", label = "7 - Change the y-axis label (*)"), 
               fileinfo <- bsTooltip("ylab", "Here, you can change the y-axis label (empty by default).", placement = "bottom", trigger = "hover"),
               conditionalPanel(
                 condition = "input.pop == 'onepop'",
                 textInput("main", label = "8 - Change the main title (*)"),
                 fileinfo <- bsTooltip("main", "Here, you can change the main label (empty by default).", placement = "bottom", trigger = "hover")
               ),
               "(* not mandatory)"
             ),
             
             wellPanel(align = "center", actionButton("doplot", label = "Draw a Mondrian!" , icon("bar-chart"))),
             wellPanel(align = "center", downloadButton('save', 'Save the plot', icon("save")))
      ),
      
      column(width = 7, 
             verbatimTextOutput("mondriantable"), 
             plotOutput("mondrianplot", height = "700px"),
             br(), hr(), br(), 
             DT::dataTableOutput("mondriandata")
      )
    )
  )
)
)
