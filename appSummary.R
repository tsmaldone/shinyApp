appSummary <- function(gameData,N,pSwitch,seed) {
   #
   # at this point the games are complete, now want to generate the summary stats
   #
   gamesSummary <- NULL
   numGames = N
   totalWins = dim(subset(gameData,Win == "Y"))[1]
   numSwitches = sum(subset(gameData,switched == 1)$switched)
   winsAfterSwitch = dim(subset(gameData,Win == "Y" & switched == 1))[1]
   winsNoSwitch <- dim(subset(gameData,Win == "Y" & switched == 0))[1]
   pWin <- totalWins / numGames
   pWinSwitch <- winsAfterSwitch / numSwitches
   pWinNoSwitch <- winsNoSwitch / (numGames - numSwitches)
   #
   gamesSummary <- data.frame(numGames,pSwitch,numSwitches,totalWins,winsAfterSwitch,
                              pWin,pWinSwitch,seed,winsNoSwitch,pWinNoSwitch)
   colnames(gamesSummary) <- c("Num Games Played","P[Switch]","Num Switches","Total Wins",
                               "Wins After Switch","P[win]",
                               "P[Win|Switch]","seed","Wins No Switch","P[Win|No Switch]")
   return(gamesSummary)
}