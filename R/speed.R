#' Generate Random Vector of Speeds
#'
#' \code{speed} and \code{speed_in} - Generate a random normal vector of
#' speeds in inches.
#'
#' @note \code{speed} rounds to nearest whoe number.  \code{speed_in} &
#' \code{speed_in} round to the nearest tenths.
#'
#' @inheritParams normal_round
#' @return Returns a random normal vector of speed elements.
#' @keywords speed
#' @export
#' @rdname speed
#' @include utils.R normal.R
#' @family variable functions
#' @examples
#' speed(10)
#' hist(speed(10000))
#' interval(speed, 5, n = 1000)
speed <- hijack(normal_round,
    name = "Speed",
    mean = 55,
    sd = 10,
    digits = 0,
    min = 0
)

#' @rdname speed
#' @export
speed_mph <- hijack(normal_round,
    name = "Speed(mph)",
    mean = 55,
    sd = 10,
    digits = 1,
    min = 0
)



#' Generate Random Vector of Speeds
#'
#' \code{speed_cm} - Generate a random normal vector of speeds in centimeters.
#'
#' @rdname speed
#' @export
speed_kph <- hijack(normal_round,
    name = "Speed(kph)",
    mean = 88.5,
    sd = 16,
    digits = 1,
    min = 0
)

