#' Generate Random Vector of Intelligence Quotients (IQs)
#'
#' Generate a random normal vector of intelligence quotients (IQs).
#'
#' @inheritParams normal_round
#' @return Returns a random normal vector of IQ elements.
#' @keywords iq intelligence
#' @export
#' @family variable functions
#' @examples
#' iq(10)
#' hist(iq(10000))
#' interval(iq, 5, n = 1000)
iq <- hijack(normal_round,
    mean = 100,
    sd = 10,
    name = "IQ",
    digits = 0
)


