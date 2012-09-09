############################
#Twitter Sentiment Analysis#
#    Dr. Simon Lutterbie   #
#     Ranga Nathan, NS     #
############################

#Collects results from a Twitter search (via API) COMPLETE
#Cleans results
#Conducts sentiment analysis
#Visualizes results

################################################################################

#User-defined variables
  search.string <- "iPhone"
  search.max.results <- "500"

#Load libraries
  library(twitteR)
  library(XML)
  library(RCurl)
  
#Get search data
  search.results <- searchTwitter(search.string, n = search.max.results, lang="en")
  
#Function for extracting text from status-class object
  getTweetText <- function(status){
    text <- status$text
    return (text)
  }

#Extract text for all statuses
  status.texts <- lapply(search.results, getTweetText)