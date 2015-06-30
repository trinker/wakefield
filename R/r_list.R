#' List Production (From Variable Functions)
#'
#' Produce a named \code{\link[base]{list}} that allows the user to lazily pass
#' unnamed \pkg{wakefield} variable functions (optionally, without call
#' parenthesis).
#'
#' @param n The length to pass to the randomly generated vectors.
#' @param \ldots A set of optionally named arguments.  Using \pkg{wakefield}
#' variable functions require no name or call parenthesis.
#' @param rep.sep A separator to use for repeated variable names.  For example
#' if the \code{\link[wakefield]{age}} is used three times
#' (\code{r_list(age, age, age)}), the name "Age" will be assigned to all three
#' vectors in the list.  The resuts in column names
#' \code{c("Age_1", "Age_2", "Age_3")}.  To turn of this behavior use
#' \code{rep.sep = NULL}.  This resuts in \code{c("Age", "Age", "Age")} for
#' vector names, leading to \code{c("Age", "Age.1", "Age.2")} if coerced to a
#' \code{\link[base]{data.frame}}.
#' @return Returns a named list of equal length vectors.
#' @author Josh O'Brien and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/29617983/1000343}
#' @keywords list
#' @export
#' @seealso \code{\link[wakefield]{r_data_frame}},
#' \code{\link[wakefield]{r_series}}
#' \code{\link[wakefield]{r_dummy}}
#' @examples
#' r_list(
#'     n = 30,
#'     id,
#'     race,
#'     age,
#'     sex,
#'     hour,
#'     iq,
#'     height,
#'     died,
#'     Scoring = rnorm
#' )
#'
#' r_list(
#'     n = 30,
#'     id,
#'     race,
#'     age(x = 8:14),
#'     Gender = sex,
#'     Time = hour,
#'     iq,
#'     height(mean=50, sd = 10),
#'     died,
#'     Scoring = rnorm
#' )
r_list <- function(n, ..., rep.sep = "_") {

    ## Capture the unevaluated calls and symbols passed via ...
    ll <- as.list(substitute(list(...)))[-1]

    ## Process each one in turn
    out <- lapply(ll, FUN = function(X) {

        ## See if ll will eval to a vector
        if (is.vector(try(eval(X), silent = TRUE))) return(eval(X))

        ## See if ll will eval to a data.frame
        if (is.data.frame(try(eval(X), silent = TRUE))) return(eval(X))

        ## Turn any symbols/names into calls
        if(is.name(X)) X <- as.call(list(X))

        ## Add/replace an argument named n
        X$n <- n
        eval(X)
    })

    ## Capture names from vectors of class variable
    nms <- unlist(lapply(out, function(x) {
        nmsout <- attributes(x)[["seriesname"]]
        if (is.null(nmsout)) nmsout <- attributes(x)[["varname"]]
        if (is.null(nmsout)) return(NA)
        nmsout
    }))

    ## Supply any names given in the call to `r_list`
    nms[names(ll) != ""] <- names(ll)[names(ll) != ""]

    ## Supply generic names to any vectors that do not have names
    nms[sapply(nms, is.na)] <- make.names(seq_len(length(nms[sapply(nms, is.na)])))

    ## Strip the varname attribute and variable class from the vectors
    out <- lapply(out, function(x){
        attributes(x)[["varname"]] <- NULL
        class(x) <- class(x)[!class(x) %in% "variable"]
        x
    })

    ## If duplicate names exist fix their suffix
    if (!is.null(rep.sep)){
        nms <- stats::ave(nms, nms, FUN = function(x) {
            if (length(x) == 1) {x} else {paste(x, seq_along(x), sep = rep.sep)}
        })
    }

    stats::setNames(out, nms)
}
