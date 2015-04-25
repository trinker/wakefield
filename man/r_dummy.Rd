% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/r_dummy.R
\name{r_dummy}
\alias{r_dummy}
\title{Title}
\usage{
r_dummy(fun, n, ..., rep.sep = "_")
}
\arguments{
\item{fun}{A \pkg{waefield} variable function.}

\item{n}{The number of rows to produce.}

\item{rep.sep}{A separator to use for the variable and category part of names.
For example if the \code{\link[wakefield]{age}} is used
(\code{r_dummy(sex)}), this resuts in column names \code{c("Sex_Male", "Sex_Female")}.}

\item{\ldots}{Additional arguments passed to \code{fun}.}
}
\value{
Returns a \code{\link[dplyr]{tbl_df}}.
}
\description{
Description
}
\examples{
r_dummy(sex, 10)
r_dummy(race, 1000)
r_dummy(race, 1000, name = "Ethnicity")
}
\seealso{
\code{\link[wakefield]{r_list}},
\code{\link[wakefield]{r_data_frame}},
\code{\link[wakefield]{r_series}}
}
\keyword{dummy}
