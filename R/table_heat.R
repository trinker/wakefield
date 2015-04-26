#' View Data Table Column Types as Heat Map
#'
#' Generate a heat map of column types from a \code{\link[base]{data.frame}}.
#'
#' @param x A \code{\link[base]{data.frame}}.
#' @param flip logical.  If \code{TRUE} the \code{\link[base]{data.frame}} is
#' flipped so that the columns are on the y axis and observations on the x axis.
#' This is useful when there are many columns or the column names are longer.
#' @param palette A palette to chose from.  See
#' \code{\link[ggplot2]{scale_fill_brewer}} for more.  These choices should
#' exceed the number of unique column types. Use \code{NULL} to use
#' \pkg{ggplot2}'s default color scheme.
#' @param print logical.  If \code{TRUE} the pot is printed.  Option for use in
#' document construction such as \pkg{knitr} or \pkg{rmarkdown}.
#' @param sep A separator to use between column types.  Column types are
#' determined via \code{sapply(x, class)}.  When multiple types are present
#' these are collapsed.  By default the \code{\\n} is used.
#' @return Returns a \pkg{ggplot2} object.
#' @details By default coumn names retain their order.  Column types are ordered
#' alphabetically in the legend, with \code{NA} appearing last.
#' @keywords class, type
#' @export
#' @examples
#' table_heat(mtcars) #boring
#' table_heat(CO2)
#' table_heat(iris)
#' table_heat(state_populations)
#'
#' dat <- r_data_frame(100,
#'     lorem_ipsum,
#'     birth,
#'     animal,
#'     age,
#'     grade, grade,
#'     death,
#'     dummy,
#'     grade_letter
#' )
#'
#' table_heat(dat)
#' table_heat(dat, flip=TRUE)
#'
#' ## NA values
#' table_heat(r_na(dat, NULL))
#'
#' ## Colors
#' table_heat(r_na(dat, NULL), palette = NULL)
#' table_heat(r_na(dat, NULL), palette = "Set1")
#' table_heat(r_na(dat, NULL), palette = "Set2")
#' table_heat(r_na(dat, NULL), palette = "Set1")
#' table_heat(r_na(dat, NULL), palette = "Dark2")
#' table_heat(r_na(dat, NULL), palette = "Spectral")
#' table_heat(r_na(dat, NULL), palette = "Reds")
table_heat <- function(x, flip = FALSE, palette = "Set3", print = interactive(), sep = "\n"){

    types <- sapply(x, function(y) paste(tolower(class(y)), collapse = sep))
    types_mat <- do.call(cbind, lapply(types, rep, each = nrow(x)))
    types_mat[is.na(x)] <- "NA"
    dat <- data.frame(types_mat)

    lvls <- unique(c(unlist(types_mat)))
    if ("NA" %in% lvls) {
        lvls <- c(sort(lvls[!lvls %in% "NA"]), "NA")
    } else {
        lvls <- sort(lvls)
    }

    if (!isTRUE(flip)) {
        col_lvls <- colnames(types_mat)
    } else {
        col_lvls <- rev(colnames(types_mat))
    }

    ldat <- data.frame(
        Columns = factor(rep(colnames(types_mat), each=nrow(types_mat)), levels = col_lvls),
        Types = factor(c(unlist(types_mat)), levels = lvls),
        Observations = rep(1:nrow(types_mat), ncol(types_mat))
    )

    if (!flip) {
        x1 <- "Columns"
        y1 <- "Observations"
    } else {
        y1 <- "Columns"
        x1 <- "Observations"
    }

    theplot <- ggplot2::ggplot(ldat, ggplot2::aes_string(y = y1, x = x1)) +
        ggplot2::geom_tile(ggplot2::aes_string(fill = "Types"), colour = NA) +
        ggplot2::theme_bw() +
        ggplot2::theme(
            panel.border = ggplot2::element_rect(color = NA),
            panel.grid.minor = ggplot2::element_blank(),
            panel.grid.major = ggplot2::element_blank(),
            axis.ticks = ggplot2::element_blank(),
            axis.title = ggplot2::element_text(color = "grey75"),
            axis.text.x = ggplot2::element_text(color = "grey75")
        )

    if (!flip) {
        theplot <- theplot +
            ggplot2::theme(
                axis.text.x = ggplot2::element_text(color = "black"),
                axis.text.y = ggplot2::element_text(color = "grey75")
            ) + ggplot2::scale_y_continuous(expand = c(0,0))
    } else {
        theplot <- theplot +
            ggplot2::scale_x_continuous(expand = c(0,0))
    }

    if (!is.null(palette)){
        theplot <- theplot +
            ggplot2::scale_fill_brewer(palette=palette)
    }
    if (print) print(theplot)
    invisible(theplot)
}

#' Plots a tbl_df Object
#'
#' Plots a tbl_df object.
#'
#' @param x The tbl_df object.
#' @param \ldots Arguments passed to \code{\link[wakefield]{table_heat}}.
#' @method plot tbl_df
#' @export
plot.tbl_df <- function(x, ...){
    table_heat(x, ...)
}
