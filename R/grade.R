#' Generate Random Vector of Grades
#'
#' \code{grade} - Generate a random normal vector of percent grades.
#'
#' @details The conversion between percent range, letter grade, and GPA is:
#'
#' \tabular{llr}{
#'   \bold{Percent} \tab \bold{Letter} \tab \bold{GPA}\cr
#'   97-100 \tab A+ \tab 4.00\cr
#'   93-96  \tab A  \tab 4.00\cr
#'   90-92  \tab A- \tab 3.67\cr
#'   87-89  \tab B+ \tab 3.33\cr
#'   83-86  \tab B  \tab 3.00\cr
#'   80-82  \tab B- \tab 2.67\cr
#'   77-79  \tab C+ \tab 2.33\cr
#'   73-76  \tab C  \tab 2.00\cr
#'   70-72  \tab C- \tab 1.67\cr
#'   67-69  \tab D+ \tab 1.33\cr
#'   63-66  \tab D  \tab 1.00\cr
#'   60-62  \tab D- \tab 0.67\cr
#'   < 60   \tab F  \tab 0.00
#' }
#'
#' @inheritParams normal_round
#' @return Returns a random normal vector of grade elements.
#' @keywords grade gpa
#' @export
#' @rdname grade
#' @family variable functions
#' @examples
#' grade(10)
#' hist(grade(10000))
#' interval(grade, 5, n = 1000)
#'
#' grade_letter(10)
#' barplot(table(grade_letter(10000)))
#'
#' gpa(10)
#' hist(gpa(10000))
grade <-
function (n, mean = 88, sd = 4, name = "Grade", digits = 1) {

    if (missing(n)) stop("`n` is missing")
    out <- stats::rnorm(n = n, mean = mean, sd = sd)
    out[out > 100] <- 100
    varname(round(out, digits = digits), name)

}

#' Generate Random Vector of Grades
#'
#' \code{grade} - Generate a random normal vector of letter grades.
#'
#' @export
#' @rdname grade
grade_letter <-
function (n, mean = 88, sd = 4, name = "Grade_Letter") {

    if (missing(n)) stop("`n` is missing")
    out <- stats::rnorm(n = n, mean = mean, sd = sd)
    out[out > 100] <- 100
    convert2letter(out, name)

}

#' Generate Random Vector of Grades
#'
#' \code{grade} - Generate a random normal vector of grade point averages (GPA;
#' 0.0 - 4.0 scale).
#'
#' @export
#' @rdname grade
gpa <-
function (n, mean = 88, sd = 4, name = "GPA") {

    if (missing(n)) stop("`n` is missing")
    out <- stats::rnorm(n = n, mean = mean, sd = sd)
    out[out > 100] <- 100
    convert2scale_4.0(out, name)

}



grds <- c(paste0(rep(LETTERS[1:4], each = 3), rep(c("+", "", "-"), 3)), "F")
grade_conversion <- data.frame(
    Letter = ordered(grds, levels = rev(grds)),
    Scale_4.0 = c(4, 4, 3.67, 3.33, 3, 2.67, 2.33, 2, 1.67, 1.33, 1, .67, 0),
    Breaks = rev(c(59, 62, 66, 69, 72, 76, 79, 82, 86, 89, 92, 96, 100)),
    Range = c("97-100", "93-96", "90-92", "87-89", "83-86", "80-82",
        "77-79", "73-76", "70-72", "67-69", "63-66", "60-62", "< 60")
)

convert2letter <- function(x, name) {

    lets <- structure(1:13, .Label = c("F", "D-", "D", "D+", "C-", "C", "C+",
        "B-", "B", "B+", "A-", "A", "A+"), class = c("ordered", "factor"
    ))
    brks <- c(0, 59, 62, 66, 69, 72, 76, 79, 82, 86, 89, 92, 96, 100)
    varname(lets[as.numeric(cut(x, breaks = brks))], name= name)
}



convert2scale_4.0 <- function(x, name) {

    scls <- c(0, 0.67, 1, 1.33, 1.67, 2, 2.33, 2.67, 3, 3.33, 3.67, 4, 4)
    brks <- c(0, 59, 62, 66, 69, 72, 76, 79, 82, 86, 89, 92, 96, 100)
    varname(scls[as.numeric(cut(x, breaks = brks))], name = name)
}


