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
employment
sport






r_date <- function(name = "Date", sort = TRUE, start = Sys.Date(), k = 5, by = "-1 years", prob = NULL, n){

    dates <- seq(start, length = k, by = by)

    out <- sample(x = dates, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(out, name)
}



r_na.default
r_na.list
r_na.data.frame



r_dat <- function(n = 500, ...){
    r_data_frame(
        n = n,
        wakefield::id,
        race,
        age,
        sex,
        hour,
        iq,
        height,
        died,
        ...
    )
}

r_dat()




