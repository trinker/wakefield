#' Generate Random Vector of Heights
#'
#' `height` and `height_in` - Generate a random normal vector of
#' heights in inches.
#'
#' @note `height` rounds to nearest whole number.  `height_in` &
#' `height_in` round to the nearest tenths.
#'
#' @inheritParams normal_round
#' @return Returns a random normal vector of height elements.
#' @keywords height
#' @export
#' @rdname height
#' @include utils.R normal.R
#' @family variable functions
#' @examples
#' height(10)
#' hist(height(10000))
#' interval(height, 5, n = 1000)
height <- hijack(normal_round,
    name = "Height",
    mean = 69,
    sd = 3.75,
    digits = 0,
    min = 1
)

#' @rdname height
#' @export
height_in <- hijack(normal_round,
    name = "Height(in)",
    mean = 69,
    sd = 3.75,
    digits = 1,
    min = 1
)



#' Generate Random Vector of Heights
#'
#' `height_cm` - Generate a random normal vector of heights in centimeters.
#'
#' @rdname height
#' @export
height_cm <- hijack(normal_round,
    name = "Height(cm)",
    mean = 175.26,
    sd = 9.525,
    digits = 1,
    min = 1
)


