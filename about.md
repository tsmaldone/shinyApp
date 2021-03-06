# The Monty Hall Problem
Tony Smaldone  
October 21, 2015  

The Monty Hall Problem (MHP) is a classic statistical brain-teaser. The game, derived from the TV show *Let's
Make a Deal* and hosted by *Monty Hall*, goes like this:

* A prize exists behind one of three doors
* The contestant chooses one of the three doors
* The host (Monty Hall) shows the contestant what's behind one of the remaining two doors, then asks
the contestant whether they would like to switch their choice  
* Should the contestant switch?? **That is, does the contestant have a better chance of winning if they were to switch????**

To explore the answer, will use **computer simulation** to randomly play games and see what happens.

The intent is to not only answer the MHP problem, **but to demonstrate the value of using computer simulation**.


## Simulation Overview

The simulation will

* Randomly choose (from a uniform distribution) the door behind which the prize is placed
* Randomly choose (from a uniform distribution) the door initially picked by the contestant
* Randomly choose (from a uniform distribution) the door to show the contestant from the remaining possible doors
* Randomly choose (from a uniform distribution) the door the contestant will switch to (from the remaining possible doors) **IF** the contestant chooses to switch doors
* Use a fixed probability of contestant switching across all games (range between 0 - never switch - and 1 - always switch)
* Run 10, 100, 500 and 1000 games 
* Collect the results for each set of games and summarize the results
* Use [R](https://www.r-project.org/about.html) to drive the simulation
    + Using `R` and package `dplyr` versions:



```r
R.version.string
```

```
## [1] "R version 3.2.2 (2015-08-14)"
```


```r
packageVersion("dplyr")
```

```
## [1] '0.4.3'
```

The Monty Hall Problem simulation is composed of:

* `appMonte.R`: Runs the Monty Hall simulation
* `appSummary.R`: Generates the summary statistics (probability of win, etc.)
* `appTable.R`: Arranges the summary statistics in a nice tabular form for all four game sets run in the simulation

The actual simulation `R` code is on github

## Simulation Set-up

The simulation will used the uniform distribution to randomly choose the prize door, the door picked
by the contestant, the door to show the contestant and the door the contestant will switch to (as
described above). For this `Shiny` app, certain simulation parameters are being defined to be under the user's
control. These are:

* *Contestant Probability of Switching Doors*: Set the probability that the contestant will switch doors
* *Games to Play in Simulation*: Specify the number of games to play in the simulation
* *Seed Value*: Specify the value to initialize the random number generator(s)

See the `Help` tab for more detail on each of these parameters

## Simulation Output

Upon selecting an input parameter, the simulation will run and the results will
be determined over the specific number of games played. The results are presented
in two forms:

* A series of four bar charts, one for each number of games played. The charts will
show the resulting probability of winning if the contestant switched doors
(`P[Win|Switch]`) and if the contestant did not switch doors (`P[Win|No Switch]`).
* A tabular display of all the statistics computed in the simulation in addition
to specific input parameters, including
   + Num Games Played: The number of games in the simulation
   + `P[Switch]`: The specified probability that the user switched doors
   + Seed: The value used to initialize the random number generator

## Simulation Execution Results

As an example, the simulation was run for 10, 100, 500, and 1000 games. The following set of bar charts show the probabilities 
of winning if the contestant switched doors and if they did not. The probability that the contestant would switch
doors was given at `0.5`. The corresponding `shiny` application runs the simulation with a user adjustable
contestant switching probability  *(Note the `R` code to perform the simulation is not visible (run with 
`echo = FALSE`); the results are just displayed)*

![](about_files/figure-html/unnamed-chunk-3-1.png) 

## Conclusion

The MHP has stymied many a folk (statisticans included). The theorectical answer is that the 
contestant does indeed have a better chance of winning by switching **(two-thirds to one-third)**, but is not
so intuitive. 

This application used simulation to *actually* play the game on relatively large scales, something that would 
take perhaps an impractical amount of time to actually do (or if the data from past shows was unavailable). This
is but one benefit of simulation - **to explore some phenomena using statistics which would be impossible, or
impractical to do otherwise**.

Future work will 

* Provide more flexibility on control of random parameters
  * Use different distributions
  * Have more user defined control of selection
* Enhanced output
  * More descriptive and interactive visualizations
* Explore other variations on the game 
  * What if there were five doors? 
  * Different strategies on how the game is played
    * Phrase-ology of the question posed to the contestant

In summary: **Simulation was used to clearly prove out the not so intuitive theorectical answer**

