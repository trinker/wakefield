#' Generate Random Vector of Scholastic Aptitude Test (SATs)
#'
#' \code{grade} - Generate a random normal vector of scholastic aptitude test
#' (SATs).
#'
#' @inheritParams normal_round
#' @return Returns a random normal vector of SAT elements.
#' @keywords sat
#' @export
#' @family variable functions
#' @examples
#' sat(10)
#' hist(sat(10000))
#' interval(sat, 5, n = 1000)
sat <- hijack(normal_round,
    mean = 1500,
    sd = 100,
    name = "SAT",
    digits = 0,
    min = 0,
    max = 2400
)
