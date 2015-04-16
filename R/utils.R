## seconds to H:M:S format
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


## Hijack a function
## see: http://stackoverflow.com/a/25366322/1000343
hijack <- function(FUN, ...){

    .FUN <- FUN

    args <- list(...)
    invisible(lapply(seq_along(args), function(i) {
        formals(.FUN)[[names(args)[i]]] <<- args[[i]]
    }))

    .FUN
}
