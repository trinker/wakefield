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
