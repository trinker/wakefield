#' Identification Numbers
#'
#' \code{id} - Generate a sequential \code{\link[base]{character}} vector of
#' zero-padded identification numbers (IDs).
#'
#' @param n The number elements to generate.  This can be globally set within
#' the environment of \code{r_data_frame} or \code{r_list}.
#' @param random logical.  If \code{TRUE} the IDs are randomized, otherwise the
#' IDs are sequential.
#' @param name The name to assign to the output vector's \code{varname}
#' attribute.  This is used to auto assign names to the column/vector name when
#' used inside of \code{r_data_frame} or \code{r_list}.
#' @rdname id
#' @keywords id identification
#' @section Warning: \code{id} uses \code{\link[base]{sprintf}} to generate the
#' padded ID.  Per \code{\link[base]{sprintf}}'s documentation: ``The format
#' string is passed down the OS's sprintf function...The behaviour on inputs not
#' documented here is 'undefined', which means it is allowed to differ by
#' platform.''  See \code{\link[base]{sprintf}} for details.
#' @note \code{id} is faster than \code{id_factor}, as the later coerces the
#' vector to a \code{\link[base]{factor}}.
#' @return Returns a (optionally random) vector of
#' \code{\link[base]{character}}/\code{\link[base]{factor}} observations
#' ID numbers.
#' @export
#' @seealso \code{\link[base]{sprintf}}
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
#' \code{id_factor} - Generate a sequential \code{\link[base]{factor}} vector
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


