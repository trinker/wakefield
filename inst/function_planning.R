

r_list(
    n = 13,
    id(),
    race(),
    sex(),
    height(mean=40)
)


r_data_frame(
    n = 1000,
    id,
    race,
    interval(age, c(0, 20, 25, 30, 35, 100), right=FALSE),
    sex,
    hour,
    iq,
    height(mean=60),
    variable("My Var", rpois, lambda=1)
)


variable <- function(name, fun, ..., n) {

    varname(fun(n, ...), name)

}
r_data_frame(
    n = 100,
    id,
    race,
    interval(age, c(0, 20, 25, 30, 35, 100), right=FALSE),
    sex,
    hour,
    iq,
    height(mean=60)
)




upper(n = 12)
lower(n = 12)

http://www.surveymonkey.com/s.asp?u=51185357313
http://www.uwex.edu/ces/tobaccoeval/resources/surveydemographics.html

answer (yes/NO)
grade_level
sat
death (true/false)
degree
marital
income
political
name (import data set and have correct caps)
color
animal
sentence (import words) [see random_sent)
month (month.name
state (state.name)
car
speed
distance
width
length
weight
eye (HairEyeColor)
hair
car  (rownames(mtcars))
pet
year
dna (c("Guanine", "Adenine", "Thymine", "Cytosine"))
level (1:4)
smokes
military
religion
family
children
zip
character
employment
language
area (c("Suburban", "Urban", "Rural"))
sport

lower <- function(name = "Lower", k = 5, prob = NULL, n){

    stopifnot(k < 27 || k > 0)
    stopifnot(length(prob) != k)

    out <- sample(x = letters[seq_len(k)], size = n, replace = TRUE, prob = prob)
    varname(out, name)
}

upper <- function(name = "Upper", k = 5, prob = NULL, n){

    stopifnot(k < 27 || k > 0)
    stopifnot(length(prob) != k)

    out <- sample(x = LETTERS[seq_len(k)], size = n, replace = TRUE, prob = prob)
    varname(out, name)
}



minute <- function(name = "Minute", by = 1, sort = TRUE, times = NULL, prob = NULL, n){

    times <- if (is.null(times)) times <- seq(0, 59, by = by)/60

    out <- sample(x = times, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(sec2hms(out), name)
}

second <- function(name = "Second", by = 1, sort = TRUE, times = NULL, prob = NULL, n){

    times <- if (is.null(times)) times <- seq(0, 59, by = by)/3600

    out <- sample(x = times, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(sec2hms(out), name)
}


r_time <- function(name = "Time", times = NULL, sort = TRUE, prob = NULL, n){

    times <- if (is.null(times)) times <- seq(0, 23.5, by = 1)

    out <- sample(x = times, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(sec2hms(out), name)
}


r_date <- function(name = "Date", sort = TRUE, start = Sys.Date(), k = 5, by = "-1 years", prob = NULL, n){

    dates <- seq(start, length = k, by = by)

    out <- sample(x = dates, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(out, name)
}


r_factor <- function(name = "Factor", levels = LETTERS[1:5], prob = NULL, n){

    out <- sample(x = levels, size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels=levels)
    varname(out, name)
}

r_ordered <- function(name = "Ordered", k = 5, prob = NULL, n){

    stopifnot(length(prob) != k)

    out <- sample(x = seq_len(k), size = n, replace = TRUE, prob = prob)
    out <- ordered(out, levels=seq_len(k))
    varname(out, name)
}

r_character <- function(name = "Character", k = 5, prob = NULL, n){

    stopifnot(k < 27 || k > 0)
    stopifnot(length(prob) != k)

    out <- sample(x = LETTERS[seq_len(k)], size = n, replace = TRUE, prob = prob)
    varname(out, name)
}

r_numeric <- function(name = "Numeric", mean = 0, sd = 1, n){

    varname(rnorm(n = n, mean = mean, sd = sd), name)
}

r_integer <- function(name = "Integer", integers = NULL, prob = NULL, n){

    if (is.null(integers)){
        integers <- 1:100
    }

    out <- sample(x = integers, size = n, replace = TRUE, prob = prob)
    varname(out, name)
}


r_logical

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




