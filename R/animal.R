#' Generate Random Vector of animals
#'
#' \code{animal} - Generate a random vector of animals.
#'
#' @inheritParams color
#' @return Returns a random factor vector of animal elements.
#' @keywords animal pet
#' @export
#' @rdname animal
#' @include utils.R r_sample_factor.R
#' @family variable functions
#' @examples
#' animal(10)
#' pie(table(animal(10000)))
#'
#' pet(10)
#' pie(table(pet(10000)))
animal <- function(n, k = 10, x = wakefield::animal_list, prob = NULL, name = "Animal"){

    stopifnot(k < length(x) || k > 0)
    stopifnot(length(prob) != k)

    out <- sample(x = lvls <- gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", sample(x, k),
        perl=TRUE), size = n, replace = TRUE, prob = prob)
    out <- factor(out, levels = lvls)
    varname(out, name)

}

#' Generate Random Vector of animals
#'
#' \code{pet} - Generate a random vector of pets.
#'
#' @details The household pets and probabilities:
#'
#' \tabular{ll}{
#'   Dog   \tab 36.5 \%\cr
#'   Cat   \tab 30.4 \%\cr
#'   None  \tab 25.8 \%\cr
#'   Bird  \tab 3.1 \% \cr
#'   Horse \tab 1.5 \% \cr
#' }
#'
#' @export
#' @rdname animal
pet <- hijack(r_sample_factor,
    name = "Pet",
    x = c("Dog", "Cat", "None", "Bird", "Horse"),
    prob = c(.365, .304, .258, .031, .015)
)



