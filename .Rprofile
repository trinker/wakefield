if (!require("pacman")) install.packages("pacman")
pacman::p_load(qdap, reports, rmarkdown)

update_version <- function(ver = NULL){

    desc <- suppressWarnings(readLines("DESCRIPTION"))
    regex <- "(^Version:\\s+\\d+\\.\\d+\\.)(\\d+)"
    loc <- grep(regex, desc)
    ver <- ifelse(is.null(ver), as.numeric(gsub(regex, "\\2", desc[loc])) + 1, ver)
    desc[loc] <- sprintf(gsub(regex, "\\1%s", desc[loc]), ver)
    cat(paste(desc, collapse="\n"), file="DESCRIPTION")

    cit <- suppressWarnings(readLines("inst/CITATION"))
    regex2 <- '(version\\s+\\d+\\.\\d+\\.)(\\d+)([."])'
    cit <- paste(cit, collapse="\n")
    cat(gsub(regex2, paste0("\\1", ver, "\\3"), cit), file = "inst/CITATION")
    message(sprintf("Updated to version: %s", ver))
}

update_news <- function(repo = basename(getwd())) {

    News <- readLines("NEWS")

    News <- mgsub(
        c("<", ">", "&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;", "BUG FIXES",
            "NEW FEATURES", "MINOR FEATURES", "CHANGES", " TRUE ", " FALSE ",
            " NULL ", "TRUE.", "FALSE.", "NULL.", ":m:"),
        c("&lt;", "&gt;", "**&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;**",
            "**BUG FIXES**", "**NEW FEATURES**", "**MINOR FEATURES**",
            "**CHANGES**", " `TRUE` ", "`FALSE`.", "`NULL`.", "`TRUE`.",
            " `FALSE` ", " `NULL` ", " : m : "),
            News, trim = FALSE, fixed=TRUE)

    News <- sub(pattern="issue *# *([0-9]+)",
        replacement=sprintf("<a href=\"https://github.com/trinker/%s/issues/\\1\">issue #\\1</a>",
        repo),
        x=News)

    News <- sub(pattern="pull request *# *([0-9]+)",
        replacement=sprintf("<a href=\"https://github.com/trinker/%s/issues/\\1\">pull request #\\1</a>",
        repo),
        x=News)

    News <- gsub(sprintf(" %s", repo),
        sprintf(" <a href=\"https://github.com/trinker/%s\" target=\"_blank\">%s</a>",
        repo, repo), News)

    cat(paste(News, collapse = "\n"), file = "NEWS.md")
    message("news.md updated")
}

md_toc <- function(path = "README.md", repo = basename(getwd()),
    insert.loc = "Installation"){

    x <- suppressWarnings(readLines(path))
    inds <- 1:(which(!grepl("^\\s*-", x))[1] - 1)
    temp <- gsub("(^[ -]+)(.+)", "\\1", x[inds])
    content <- gsub("^[ -]+", "", x[inds])
    toc <- paste(c("\nTable of Contents\n============\n",
        sprintf("%s[%s](#%s)", temp, content, gsub("[;/?:@&=+$,]", "",
            gsub("\\s", "-", tolower(content)))),
        sprintf("\n%s\n============\n", insert.loc)),
        collapse = "\n"
    )

    x <- x[(max(inds) + 1):length(x)]

    inst_loc <- which(grepl(sprintf("^%s$", insert.loc), x))[1]
    x[inst_loc] <- toc
    x <- x[-c(1 + inst_loc)]

    beg <- grep("^You are welcome", x)
    y <- paste(x[beg:(beg +3)], collapse=" ")
    x[beg] <- paste0(gsub("(\\\\)[*]", "\n*", y), "\n")
    if((beg + 4) > length(x)){
        z <- beg
    } else {
        z <- (beg + 4):length(x)
    }
    x <- x[unique(c(1:beg, z))]

    cat(paste(c(sprintf("%s\n============\n", repo), x), collapse = "\n"), file = path)
    message("README.md updated")
}

