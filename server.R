#
# server.R
#
# This is the server portion of the Shiny app for the Monty Hall Problem.
# It will "react" to the user input (see ui.R) and run the simulation. The
# simulation is composed of:
#    appMonte.R  : Runs the Monty Hall simulation
#    appSummary.R: Generates the summary statistics (probability of win, etc.)
#    appTable.R  : Arranges the summary statistics in a nice tabular form for
#                  all four game sets run in the simulation
#
# The code is organized into two sections:
#    static  : loading of the needed library(ies) and the sourcing of the above
#            referenced R functions
#    reactive: The code to execute upon changes in user input
#
# Author: Tony Smaldone
# Date  : 21 October 2015
#
#
library(dplyr)
source("appMonte.R")
source("appSummary.R")
source("appTable.R")
shinyServer(
  function(input, output) {

     output$newHist <- renderPlot({
        # code to execute upon changes in user input to generate the bar charts
        # 
        # get user inputs for pSwitch, runSelection and seed
        #
        pSwitch <- input$pSwitch
        runSelection <- input$gamesToPlay
        seed <- input$seed
        #
        # perform simulation and produce bar charts
        #
        if (runSelection == "c1") {numRuns <- c(10,20,50,100)}
        if (runSelection == "c2") {numRuns <- c(10,50,100,200)}
        if (runSelection == "c3") {numRuns <- c(10,100,500,1000)}
        par(mfrow=c(2,2))
        for (i in numRuns) {
           gameData <- appMonte(as.integer(i),pSwitch,seed)
           gamesSummary <- appSummary(gameData,i,pSwitch,seed)
           if (is.nan(gamesSummary$"P[Win|Switch]") | is.nan(gamesSummary$"P[Win|No Switch]")) {
              theTop <-.8
           }
           else {
              theTop<-max(gamesSummary$"P[Win|Switch]",gamesSummary$"P[Win|No Switch]") + .2
           }
           barplot(c(gamesSummary$"P[Win|Switch]",gamesSummary$"P[Win|No Switch]"),
              names.arg=c("Switch", "No Switch"),
              ylab="Probability",
              xlab=paste("Prob of Switch = ",pSwitch),
              ylim=c(0,theTop),
              col=c("red","blue"),
              main=paste("Monty Hall ",i," Games"))
        }
     })

     output$newTable <- renderTable({
        # code to execute upon changes in user input to generate the tabular
        # summary data
        # 
        # get user inputs for pSwitch, runSelection and seed
        #
        pSwitch <- input$pSwitch
        runSelection <- input$gamesToPlay
        seed <- input$seed
        #
        # perform simulation and produce tabular summary
        #
        if (runSelection == "c1") {numRuns <- c(10,20,50,100)}
        if (runSelection == "c2") {numRuns <- c(10,50,100,200)}
        if (runSelection == "c3") {numRuns <- c(10,100,500,1000)}
        gamesTable <- NULL
        for (i in numRuns) {
           gameData <- appMonte(as.integer(i),pSwitch,seed)
           gamesSummary <- appSummary(gameData,i,pSwitch,seed)
           gamesTable <- appTable(gamesSummary,gamesTable)
        }
        if (runSelection == "c1") {
           colnames(gamesTable) <- c("Games = 10","Games = 20","Games = 50","Games = 100")
        }
        if (runSelection == "c2") {
           colnames(gamesTable) <- c("Games = 10","Games = 50","Games = 100","Games = 200")
        }
        if (runSelection == "c3") {
           colnames(gamesTable) <- c("Games = 10","Games = 100","Games = 500","Games = 1000")
        }
        gamesTable
     })

     output$About <- renderText({
        # Display the "About" tab panel information
     })

     output$Help <- renderText({
        # Display the "Help" tab panel information
     })
  }
)