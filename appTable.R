appTable <- function(gamesSummary,gamesTable) {
   gamesTable <- cbind(gamesTable,t(gamesSummary))
   return(gamesTable)
}