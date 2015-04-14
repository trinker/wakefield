grady_augmented <- GradyAugmented

name_neutral <- NAMES %>%
    dplyr::filter(gender2=="B") %>%
    dplyr::select(name) %>%
    unlist %>%
    TC %>%
    unlist


presidential_debates_2012 <- pres_debates2012[-1602, "dialogue"]

pacman::p_load(pax)

new_data(grady_augmented)
new_data(name_neutral)
new_data(presidential_debates_2012)
