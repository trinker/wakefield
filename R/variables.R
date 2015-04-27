#' Available Variable Functions
#' 
#' See a listing of all available variable functions for use in 
#' \code{\link[wakefield]{r_data_frame}} or \code{\link[wakefield]{r_list}}.
#' 
#' @param type The output type. Must must be either \code{NULL} (returns a 
#' character evctor), \code{"matrix"}, or \code{"list"}; or the user may extract 
#' a specific type from a list using:
#' \code{"character"}, \code{"date"}, \code{"factor"}, \code{"integer"}, 
#' \code{"logical"}, \code{"numeric"}, \code{"ordered factor"}.  Setting 
#' \code{type = TRUE} will also return a \code{\link[base]{list}}.
#' The \code{\link[base]{list}} version breaks the variable functions into 
#' classes.  Specifying a specific class (e.g., \code{type = "numeric"} will
#' list only variable functions that yield a numeric output.
#' @param ncols The number of columns to use if \code{type = "matrix"}.
#' @param \ldots Other arguments passed to \code{\link[base]{matrix}}.
#' @return Returns a \code{\link[base]{character}} vector, 
#' \code{\link[base]{matrix}} of all variable functions, or a
#' \code{\link[base]{list}} of variable functions by type.
#' @keywords type 
#' @export
#' @examples 
#' variables()
#' 
#' variables("list")
#' variables(TRUE)
#' names(variables("list"))
#' variables("ordered factor")
#' variables("numeric")
#' 
#' variables("matrix")
#' variables("matrix", ncols=3)
#' variables("matrix", 1)
#' variables("matrix", byrow = TRUE)
variables <- function(type = NULL, ncols = 5, ...) {

    out <- get_variable_functions()

    if (is.null(type)) return(out)

    if (type == "matrix") return(variables_as_matrix(out, ncols = ncols, ...))
    
    types <- variables_as_list(out)

    if (type == "list" | isTRUE(type)) return(types)

    if (!type %in% names(types)) {
        stop(paste0(
            "`type` must be either `NULL`, \"matrix\", or \"list\"...or supply:\n",
            paste(paste0("\"", names(types), "\""), collapse=", ")
        ))
    }

    types[type]
}




#' Prints an available Object.
#' 
#' Prints an available object.
#' 
#' @param x The available object
#' @param \ldots ignored
#' @method print available
#' @export
print.available <- function(x, ...){

    rms <- c("available", "available_matrix", "available_list")

    class(x) <- class(x)[!class(x) %in% rms]
    attributes(x)[["blanks"]] <- NULL
    print(x, na.print = "")

}

get_variable_functions <- function(){

    db <- tools::Rd_db("wakefield")
    zipfl <- as.character(db[["zip_code.Rd"]])

    seealso <- 1 + grep("Other variable.functions: ", zipfl, ignore.case=TRUE)
    exmpls <- -1 + grep("\\\\examples", zipfl, ignore.case=TRUE)

    funs <- paste(zipfl[seealso:exmpls], collapse="")
    funs <- regmatches(funs, gregexpr("(?<=link\\{)(.*?)(?=\\})", funs, perl=TRUE))[[1]]

    sort(unique(c(funs, "zip_code")))

}


variables_as_matrix <- function(variable_functions, ncols = 5, ...){

    needed_blanks <- round(ncols * (
        ceiling(length(variable_functions)/ncols) - length(variable_functions)/ncols
    ))
    blanks <- rep(NA, times=needed_blanks)
    output <- matrix(c(variable_functions, blanks), ncol=ncols, ...)
    class(output) <- c("available", "available_matrix", class(output))
    attributes(output)[["blanks"]] <- needed_blanks
    output

}



variables_as_list <- function(variable_functions){

    types <- unlist(lapply(variable_functions, function(x){
        cls <- class(match.fun(x)(n=1))
        tolower(paste(cls[!cls %in% "variable"], collapse = " "))
    }))

    output <- split(variable_functions, types)
    class(output) <- c("available", "available_list", class(output))
    output

}


