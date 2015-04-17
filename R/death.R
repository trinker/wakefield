#' Generate Random Vector of Deaths Outcomes
#'
#' Generate a random logical vector of deaths (\code{TRUE}/\code{FALSE}).
#'
#' @inheritParams dummy
#' @return Returns a random logical vector of death outcome elements.
#' @keywords death died
#' @export
#' @rdname death
#' @include utils.R r_sample_logical.R
#' @family variable functions
#' @examples
#' death(10)
#' died(10)
#' 100*table(death(n <- 10000))/n
#' 100*table(death(n <- 10000, prob = c(.3, .7)))/n
#' r_data_frame(10, died)
death <- hijack(r_sample_logical,
    name = "Death"
)

#' @export
#' @rdname death
died <- hijack(r_sample_logical,
    name = "Died"
)
