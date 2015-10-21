appMonte <- function(N,pSwitch,seed) {
   set.seed(seed)
   # data frame initialization
   gameData = NULL
   #
   # create the games data frame `gameData` complete with the random numbers
   pDoor <- as.integer(runif(N,1,4))
   cDoor <- as.integer(runif(N,1,4))
   switched <- rbinom(N,1,pSwitch)
   shDoor <- rep(0,N)
   newCdoor <- rep(0,N)
   Win <- c(rep("Y",N/2),rep("N",N/2))
   gameData <-data.frame(pDoor,cDoor,switched,shDoor,newCdoor,Win)
   #
   # now create the data frame which will hold the summary data for each set of runs
   #
   #numGames <- N
   #numSwitches <- 0
   #totalWins <- 0
   #winsAfterSwitch <- 0
   #pWin <- 0
   #pWinSwitch <- 0
   #gamesSummary <- data.frame(numGames,pSwitch,numSwitches,totalWins,winsAfterSwitch,pWin,pWinSwitch,seed)
   #colnames(gamesSummary) <- c("Num Games Played","P[Switch]","Num Switches","Total Wins",
   #                            "Wins After Switch","P[win]",
   #                            "P[Win|Switch]","seed")


   # VERIFY THIS LOGIC BASED ON BELOW WITH newCdoor
   gameData <- gameData %>% mutate(shDoor=ifelse(pDoor==1 & cDoor == 1,2,
                                          ifelse(pDoor==1 & cDoor == 2,3,
                                          ifelse(pDoor==1 & cDoor ==3,2,shDoor))))
   gameData <- gameData %>% mutate(shDoor=ifelse(pDoor==2 & cDoor == 1,3,
                                          ifelse(pDoor==2 & cDoor == 2,1,
                                          ifelse(pDoor==2 & cDoor ==3,1,shDoor))))
   gameData <- gameData %>% mutate(shDoor=ifelse(pDoor==3 & cDoor == 1,2,
                                          ifelse(pDoor==3 & cDoor == 2,1,
                                          ifelse(pDoor==3 & cDoor ==3,1,shDoor))))
   #
   gameData <- gameData %>% mutate(newCdoor=ifelse(pDoor==1 & cDoor==1 & switched==1,3,
                                            ifelse(pDoor==1 & cDoor==2 & switched==1,1,
                                            ifelse(pDoor==1 & cDoor==3 & switched==1,1,
                                            ifelse(pDoor==2 & cDoor==1 & switched==1,2,
                                            ifelse(pDoor==2 & cDoor==2 & switched==1,3,
                                            ifelse(pDoor==2 & cDoor==3 & switched==1,2,
                                            ifelse(pDoor==3 & cDoor==1 & switched==1,3,
                                            ifelse(pDoor==3 & cDoor==2 & switched==1,3,
                                            ifelse(pDoor==3 & cDoor==3 & switched==1,2,cDoor))))))))))

   #
   # determine the Win status (change cDoor to newCdoor!!!)
   gameData <- gameData %>% mutate(Win=ifelse(newCdoor==pDoor,"Y","N"))
   #
   # at this point the games are complete, now want to generate the summary stats
   return(gameData)
}
