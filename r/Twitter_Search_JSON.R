###########################
#JSON-based Twitter Search#
###########################

search.string <- "iPhone"
search.language <- "en"

#Load libraries
  library(rjson)
  library(RCurl)
  library(sentiment)

#Create search string
  search.string <- 
    paste("http://search.twitter.com/search.json?q=",
      search.string, 
      "&rpp=100&lang=", 
      search.language, 
    sep="")
  
#Get JSON results
  results.json <- getURL(search.string)
  results.R <- fromJSON(results.json)

#Extract text
  tweets.text <- c()
  for(i in seq_len(length(results.R$results))){
    tweets.text <- append(tweets.text, results.R$results[[i]]$text)
  }
  
#Clean up tweets to extract natural language
  #Remove the following...
    #URLs
     tweets.text <- gsub(
       "http://t.co/[A-Za-z0-9]*", "", tweets.text)
    #Usernames
      tweets.text <- gsub(
        "@[A-Za-z0-9[:punct:]]*", "", tweets.text)
    #Special characters
      #TO BE SOLVED


