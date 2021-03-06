# Help For Monty Hall Problem App
Tony Smaldone  
October 21, 2015  

## Overview

The Monty Hall Problem (MHP) App is designed to be *reactive*. That is, it will
perform the simulation (as described in the `About` tab) each time a user
selectable parameter is adjusted. The app will *react* to those inputs. 

## User Selectable Inputs

The user selectable inputs are:

* *Contestant Probability of Switching Doors*:
    + Use the slider to select the probability that the contestant will switch
      doors when given the option. The probability selected will be in effect fo
      the entire simulation (i.e., **all** games played will use the same probability).
      The probability to switch can range from zero (will **never** switch doors) to
      one (will **always** switch doors). By adjusting the probability, one can do analysis
      on the effect it has in winning the MHP
* *Games to Play in Simulation*:
     + A series of four game *sets* will be run, each with a different number of
       games to play per set. This allows for analysis of and insight into the 
       effect of increasing `N` in a sample when performing statistical analysis.
       Currently the options to select from are (Note the simulation is not
       restricted to any fixed number of games to use in the simulation, these
       were reasonable ones to use for the purpose of this `shiny` app:
           + 10, 20, 50 and 100 games
           + 10, 50, 100 and 200 games
           + 10, 100, 500 and 1000 games
* *Seed Value*:
      + Given that this is a simulation, the use of randomized parameters is
        prevalent (see the `About` tab). To initialize the random number
        generators requires that an initial *seed* value is used. The user has
        ability to set this initial value. The value in doing so is that the
        results of the simulation can be identically reproduced at a subsequent
        point in time by using the same initial seed value. This is a key 
        component of *reproducible research*. Choose a value for the seed (the
        default value is 1) either by typing in the number of choice or by using
        the bars to increment the shown seed value by 100

## Output

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

Good luck and enjoy!
