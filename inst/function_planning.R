binary <- function(name = "Binary", outcomes = NULL, prob = NULL, n){

    if (is.null(outcomes)){
        outcomes  <-  1:2
    }

    if (is.null(prob)){
        prob <- c(.5, .5)
    }

    out <- sample(x = outcomes, size = n, replace = TRUE, prob = prob)
    attributes(out)[["varname"]] <- list(name)
    out <- factor(out, levels=1:2)
    varname(out, name)
}

sex <- function(name = "Sex", sexes = NULL, prob = NULL, n){

    if (is.null(sexes)){
        sexes  <-  c("Male", "Female")
    }

    if (is.null(prob)){
        prob <- c(.5, .5)
    }

    out <- sample(x = sexes, size = n, replace = TRUE, prob = prob)
    attributes(out)[["varname"]] <- list(name)
    out <- factor(out, levels=c("Male", "Female"))
    varname(out, name)
}


age <- function(name = "Age", ages = NULL, prob = NULL, n){

    if (is.null(ages)){
        ages <- 20:35
    }

    out <- sample(x = ages, size = n, replace = TRUE, prob = prob)
    varname(out, name)
}

height <- function(name = "Height", mean = 70, sd = 7, n){

    out <- round(rnorm(n, mean=mean, sd=sd), 1)
    varname(out, name)
}

score <- function(name = "Score", mean = 80, sd = 10, n){

    out <- round(rnorm(n, mean=mean, sd=sd), 1)
    out[out > 100] <- 100
    varname(out, name)
}

group <- function(name = "Group", groups = NULL, prob = NULL, n){

    if (is.null(groups)){
        groups <- c("Control", "Treatment")
    }

    out <- sample(x = groups, size = n, replace = TRUE, prob = prob)
    varname(out, name)
}


id <- function(name = "ID", ids = NULL, random = FALSE, n){

    if (is.null(ids)){
        ids <- seq_len(n)
        ids <- sprintf(paste0("%0", nchar(n), "d"), ids)
    }

    if (random){
        out <- sample(x = ids)
    } else {
        out <- ids
    }
    out <- factor(out, levels = out)
    varname(out, name)
}

r_list <- function(n, ...) {
    ll <- as.list(substitute(list(...)))[-1]
    out <- lapply(ll, FUN = function(X) {
        if(is.name(X)) X <- as.call(list(X))
        X$n <- n
        eval(X)
    })

    nms <- lapply(out, function(x) unlist(attributes(x)[["varname"]]))
    nms[sapply(nms, is.null)] <- make.names(seq_len(length(nms[sapply(nms, is.null)])))
    out <- lapply(out, function(x){
        attributes(x)[["varname"]] <- NULL
        x
    })
    setNames(out, unlist(nms))
}

r_data_frame <- function(n, ...) {
    out <- r_list(n=n, ...)
    out <- setNames(data.frame(out), names(out))
    dplyr::tbl_df(out)
}


print.r_data_frame <- function (x, n = 10, width = NULL) {
    cat(sprintf("Source: r_data_frame [%s x %s]", nrow(x), ncol), "\n", sep = "")
    cat("\n")
    print(trunc_mat(x, n = n, width = width))
    invisible(x)
}


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
    group,
    interval(age, 10),
    sex,
    upper,
    height(mean=60)
)

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

interval <-  function(fun, breaks, ..., right = TRUE, n){
    out <- fun(n = n, ...)
    out2 <- cut(out, breaks, right = right)
    if (!is.null(attributes(out)$varname[[1]])) {
        out2 <- varname(out2, attributes(out)$varname[[1]])
    }
    out2
}


race(n = 12)
binary(n = 12)
sex(n = 12)
age(n = 12)
height(n = 12)
rnorm(n = 12)
score(n = 12)
group(n = 12)
id(n = 12)
upper(n = 12)
lower(n = 12)

http://www.surveymonkey.com/s.asp?u=51185357313
http://www.uwex.edu/ces/tobaccoeval/resources/surveydemographics.html

answer (yes/NO)
likert (1:7)
state


coin <- function(name = "Coin", prob = NULL, n) {
    r_factor(name = name, levels = c("Heads", "Tails"), prob = NULL, n)
}

iq <- function(name = "IQ", mean = 100, sd = 10, n){

    out <- round(rnorm(n, mean=mean, sd=sd), 0)
    varname(out, name)
}

die
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
death
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



hour <- function(name = "Hour", by = .5, sort = TRUE, times = NULL, prob = NULL, n){

    times <- if (is.null(times)) times <- seq(0, 23.5, by = by)

    out <- sample(x = times, size = n, replace = TRUE, prob = prob)
    if (sort) out <- sort(out)
    varname(sec2hms(out), name)
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

sec2hms <- function (...) {
    x <- c(...)
    if (any(x > 3600)) stop("`...` must be <= 3600")
    hs <- x%%3600
    h <- floor(hs)
    ms <- (hs - h) * 60
    m <- floor(ms)
    s <- floor((ms - m) * 60)

    hms <- lapply(list(h, m, s), function(x) sprintf("%02d", x))
    chron::times(paste(hms[[1]], hms[[2]], hms[[3]], sep=":"))
}


r_dat <- function(n = 100, ...){
    r_data_frame(
        n = n,
        id,
        race,
        age,
        sex,
        hour,
        iq,
        height,
        ...
    )
}

r_dat()




