#
# ui.R
#
# This is the user interface portion of the Shiny app for the Monty Hall Problem
# This will create a sidebar panel from which the user can provide input to the
# simulation (a slider, a pull down and a numeric input). It will also create
# main panel which will display the associated bar charts and the results in tabular
# form. In addition, three tab panels are created: "MHP", which displays the bar
# charts and tabular results; "About", which provides details on the simulation 
# itself; and, "Help", which provides help on how to interact with the application
# (and thus, run the simulation).
#
# The following code is relatively self-explanatory
#
# Author: Tony Smaldone
# Date  : 21 October 2015
#
#
library(shiny)
shinyUI(fluidPage(
  titlePanel("Monty Hall Problem"),
  sidebarLayout(
     sidebarPanel(
        helpText("Explore the Monty Hall Problem Using Simulation"),

        helpText("The contestant is shown three doors behind which one contains a prize.",
                 "The contestant is then shown what is behind one of the other two doors",
                 "and then is presented with a choice, to switch",
                 "to another door or keep the one originally chosen",
                 "Should the contestant switch doors to improve chances of winning??"),

        br(),
                 
        helpText("See About and Help tabs for more information"),

        br(),
           
        helpText("Select the probability of the contestant switching doors"),

        sliderInput('pSwitch', 
                    'Select Contestant Probability of Switching Doors....',
                    value = 0.5, 
                    min = 0, 
                    max = 1, 
                    step = 0.05),
        
        br(),
        
        helpText("Select a series of four games to play in the simulation.",
                 "For example 10,20,50,100 specifies that the simulation",
                 "will be run 10 times, 20 times, 50 times and 100 times",
                 "and the results of each will be summarized and presented"),

        selectInput("gamesToPlay", "Games To Play In Simulation",
                    c("10, 20, 50, 100" = "c1",
                      "10, 50, 100, 200" = "c2",
                      "10, 100, 500, 1000" = "c3")),
        
        br(),
        
        helpText("To insure reproducability, select a seed value",
                 "that will be used to initialize the random generator process"),

        numericInput('seed','Enter seed (default = 1)',1,100,100000)
     ),
     mainPanel(
        tabsetPanel(type = "tabs", 
           tabPanel("MHP", plotOutput("newHist"),tableOutput('newTable')), 
           tabPanel("About",includeMarkdown("about.md")),
           tabPanel("Help", includeMarkdown("help.md"))
        )
     )
  )))