#' Generate Random Vector of Ages
#'
#' Generate a random vector of ages within the provided range.  The default age range is set between 18 and 89, to match the age ranges whch appear (see e.g.,  https://gssdataexplorer.norc.org/variables/53/vshow)
#'
#' @inheritParams r_sample_factor
#' @return Returns a random integer vector of ages within the provided range (defaults to 18:89) 
#' @keywords age
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' age(10) # draw 10 ages with default values
#' hist(age(n=10000))  
#' interval(age, 3, n = 1000)
age <- hijack(r_sample,
    name = "Age",
    x = 18:89
)

