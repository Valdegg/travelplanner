install.packages(c("httr", "jsonlite", "lubridate"))

library(httr)
library(jsonlite)
library(lubridate)

options(stringsAsFactors = FALSE)



url  <- "http://api.epdb.eu"
path <- "eurlex/directory_code"

raw.result = GET(url=url, path=path)
names(raw.result)
raw.result$status_code
head(raw.result$content)
this.raw.content = rawToChar(raw.result$content)
nchar(this.raw.content)
substr(this.raw.content,1,100)
this.content = fromJSON(this.raw.content)

class(this.content); length(this.content); this.content[[1]]
this.content[1]

this.content.df = do.call(what="rbind", args = lapply(this.content,as.data.frame))

class(this.content.df); dim(this.content.df); head(this.content.df)

headClass = substr(x = this.content.df[,"directory_code"], start = 1, stop = 2);

length(headClass); head(headClass); 

isEnergy = headClass == "12"
table(isEnergy)

relevant.df = this.content.df[isEnergy,]
relevant.dc = relevant.df[,"directory_code"]