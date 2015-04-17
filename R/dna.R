#' Generate Random Vector of DNA Nucleobases
#'
#' Generate a random vector of DNA nucleobases ("Guanine", "Adenine", "Thymine", "Cytosine").
#'
#' @inheritParams r_sample_factor
#' @return Returns a random vector of DNA nucleobase elements.
#' @keywords dna
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' dna(10)
#' barplot(table(dna(10000)))
dna <- hijack(r_sample,
    name = "DNA",
    x = c("Guanine", "Adenine", "Thymine", "Cytosine")
)
