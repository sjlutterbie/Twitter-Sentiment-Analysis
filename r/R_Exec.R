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
  search.language <- "en"

#Load libraries
  library(XML)
  library(RCurl)
  library(sentiment)
  
#Generate search results
  #Create search URL
    #Format search string in URL syntax
      #For now, BEHAVE    
    #Paste together components
      search.string <- paste("http://search.twitter.com/search.atom?q=", search.string, "&rpp=100&lang=", search.language, sep="")
  #Run search, store results
      results.XML <- xmlParseDoc(search.string, encoding="UTF-8", asText = FALSE)
  #Extract key data
      results.XML.text <- getNodeSet(results.XML, "/feed")
