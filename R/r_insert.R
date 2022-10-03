#' Insert Data Frames Into `r_data_frame`
#'
#' Safely insert [base::data.frame()] objects into a
#' [wakefield::r_data_frame()] or [wakefield::r_list()].
#'
#' @inheritParams seriesname
#' @return Returns a [base::data.frame()] with a
#' `attributes(x)[["seriesname"]]` assigned.
#' @keywords insert
#' @export
#' @include utils.R seriesname.R
#' @seealso [wakefield::seriesname()]
#' @examples
#' dat <- dplyr::data_frame(
#'     Age_1 = age(100), Age_2 = age(100), Age_3 = age(100),
#'     Smokes = smokes(n=100),
#'     Sick = ifelse(Smokes, sample(5:10, 100, TRUE), sample(0:4, 100, TRUE)),
#'     Death = ifelse(Smokes, sample(0:1, 100, TRUE, prob = c(.2, .8)),
#'         sample(0:1, 100, TRUE, prob = c(.7, .3)))
#' )
#'
#' r_data_frame(100,
#'    id,
#'    r_insert(dat)
#' )
#'
#' r_list(10,
#'    id,
#'    r_insert(dat)
#' )
r_insert <- hijack(seriesname,
    name = "Inserted"
)


