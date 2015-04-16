#' List Production (From Variable Functions)
#'
#' Produce a named \code{\link[base]{list}} that allows the user to lazily pass
#' unnamed \pkg{wakefield} variable functions (optionally, without call
#' parenthesis).
#'
#' @param n The length to pass to the randomly generated vectors.
#' @param \ldots A set of optionally named arguments.  Using \pkg{wakefield}
#' variable functions require no name or call parenthesis.
#' @return Returns a named list of equal length vectors.
#' @author Josh O'Brien and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/29617983/1000343}
#' @keywords list
#' @export
#' @seealso \code{\link[wakefield]{r_data_frame}}
#' @examples
#' r_list(
#'     n = 30,
#'     d = rnorm,
#'     race,
#'     e = rnorm,
#'     p = rep("D", 30),
#'     rnorm
#' )
r_list <- function(n, ...) {

    ## Capture the unevaluated calls and symbols passed via ...
    ll <- as.list(substitute(list(...)))[-1]

    ## Process each one in turn
    out <- lapply(ll, FUN = function(X) {
        ## Turn any symbols/names into calls
        if(is.name(X)) X <- as.call(list(X))
        ## See if ll will eval to a vector
        if (is.vector(try(eval(X), silent = TRUE))) return(eval(X))
        ## Add/replace an argument named n
        X$n <- n
        eval(X)
    })

    ## Capture names from vectors of class variable
    nms <- unlist(lapply(out, function(x) {
        nmsout <- attributes(x)[["varname"]]
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

    setNames(out, nms)
}

