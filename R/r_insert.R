#' Insert Data Frames Into \code{r_data_frame}
#'
#' Safely insert \code{\link[base]{data.frame}} objects into a
#' \code{\link[wakefield]{r_data_frame}} or \code{\link[wakefield]{r_list}}.
#'
#' @inheritParams seriesname
#' @return Returns a \code{\link[base]{data.frame}} with a
#' \code{attributes(x)[["seriesname"]]} assigned.
#' @keywords insert
#' @export
#' @include utils.R seriesname.R
#' @seealso \code{\link[wakefield]{seriesname}}
#' @examples
#' dat <- dplyr::data_frame(
#'     Age = age(100), Age = age(100), Age = age(100),
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


