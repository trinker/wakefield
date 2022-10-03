#' Identification Numbers
#'
#' `id` - Generate a sequential [base::character()] vector of
#' zero-padded identification numbers (IDs).
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of `r_data_frame` or `r_list`.
#' @param random logical.  If `TRUE` the IDs are randomized, otherwise the
#' IDs are sequential.
#' @param name The name to assign to the output vector's `varname`
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of `r_data_frame` or `r_list`.
#' @rdname id
#' @keywords id identification
#' @section Warning: `id` uses [base::sprintf()] to generate the
#' padded ID.  Per [base::sprintf()]'s documentation: ``The format
#' string is passed down the OS's sprintf function...The behaviour on inputs not
#' documented here is 'undefined', which means it is allowed to differ by
#' platform.''  See [base::sprintf()] for details.
#' @note `id` is faster than `id_factor`, as the later coerces the
#' vector to a [base::factor()].
#' @return Returns a (optionally random) vector of
#' [base::character()]/[base::factor()] observations
#' ID numbers.
#' @export
#' @seealso [base::sprintf()]
#' @examples
#' id(1000)
#' r_data_frame(n=21, id)
id <- function(n, random = FALSE, name = "ID"){

    ids <- sprintf(paste0("%0", nchar(n), "d"), seq_len(n))

    if (random){
        out <- sample(x = ids)
    } else {
        out <- ids
    }

    varname(out, name)
}

#' Identification Numbers
#'
#' `id_factor` - Generate a sequential [base::factor()] vector
#' of zero-padded identification numbers (IDs).
#'
#' @rdname id
#' @export
id_factor <- function(n, random = FALSE, name = "ID"){

    ids <- sprintf(paste0("%0", nchar(n), "d"), seq_len(n))

    if (random){
        out <- sample(x = ids)
    } else {
        out <- ids
    }
    out <- factor(out, levels = out)
    varname(out, name)
}


