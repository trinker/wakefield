grady_augmented <- qdapDictionaries::GradyAugmented %>%
    unique


name_neutral <- qdapDictionaries::NAMES %>%
    dplyr::filter(gender2=="B") %>%
    dplyr::select(name) %>%
    unlist %>%
    TC %>%
    unlist %>%
    unname %>%
    c %>%
    unique


presidential_debates_2012 <- qdap::pres_debates2012[-1602, "dialogue"] %>%
    unlist %>%
    unname %>%
    c

pacman::p_load(pax)

new_data(grady_augmented)
new_data(name_neutral)
new_data(presidential_debates_2012)


if (!require("pacman")) install.packages("pacman")
pacman::p_load(XML, dplyr)

dat <- setNames(readHTMLTable(URL,
    colClasses = rep("character", 2),
    skip.rows=1,
    which=1)[, c(2, 4)], c("Language", "n")) %>%
    mutate(
        n = as.numeric(gsub("\\D", "", n)),
        prop = n/sum(n),
        Proportion = n/sum(n),
        N = 1000000 * n,
        `N (Millions)` = n,
        Percent = paste0(sprintf("%.2f", round(prop * 100, 2)), "%")
    ) %>%
    arrange(desc(prop))

