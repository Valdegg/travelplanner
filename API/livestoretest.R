url = "http://api.dohop.com/api/v1/livestore/";
path = "en/IS/per-country/KEF/2016-12-12/2016-12-16";
raw.result = GET(url=url, path=path)


names(raw.result)
raw.result$status_code
head(raw.result$content)

this.raw.content = rawToChar(raw.result$content)
nchar(this.raw.content)
substr(this.raw.content,1,100)
this.content = fromJSON(this.raw.content)