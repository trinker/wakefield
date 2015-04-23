variable <- function(name, fun, ..., n) {

    varname(fun(n, ...), name)

}

http://www.surveymonkey.com/s.asp?u=51185357313
http://www.uwex.edu/ces/tobaccoeval/resources/surveydemographics.html

## Add a variables function function

distance
width
length
weight
military
religion
family ##stats function
sport


r_date <- function(name = "Date", sort = TRUE, start = Sys.Date(), k = 5, by = "-1 years", prob = NULL, n){

    dates <- seq(start, length = k, by = by)

    out <- sample(x = dates, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(out, name)
}








