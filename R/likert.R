#' Generate Random Vector of Likert-Type Responses
#'
#' Generate a random vector of Likert-type responses.
#'
#' @inheritParams r_sample_factor
#' @note \code{likert} & \code{likert_5} are identical outputs, sampling from a
#' 5-point response scale.  \code{likert_7} samples from a 7-point response
#' scale.
#' @return Returns a random vector of Likert-type response elements.
#' @keywords likert responses
#' @export
#' @rdname likert
#' @include utils.R r_sample_ordered.R
#' @family variable functions
#' @examples
#' dice(10)
#' barplot(table(dice(10000)))
likert <- hijack(r_sample_ordered,
    name = "Likert",
    x = c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree")
)


#' @export
#' @rdname likert
likert_5 <- hijack(r_sample_ordered,
    name = "Likert",
    x = c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree")
)


#' @export
#' @rdname likert
likert_7 <- hijack(r_sample_ordered,
    name = "Likert",
    x = c("Strongly Agree", "Agree", "Somewhat Agree", "Neutral",
        "Somewhat Disagree", "Disagree", "Strongly Disagree")
)
