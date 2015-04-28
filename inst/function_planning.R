distance
width
length
weight
religion
family ##stats function
sport
latitude
longitude
degrees, degrees_c, degrees_f
cancer
disease
drug_use 1:5
drug
std
humidity
gdp
stock (random stocks: maybe pull in names)


browser:

browser,marketShare
IE,17.5
Chrome,50.27
Firefox,16.89
Safari,9.94
Opera,1.7
Android,1.32

Directly insert objects (vectors or data.frames) from the global env.

library(curl);p_load(qdapRegex)

m <- read.csv(curl("https://raw.githubusercontent.com/ramnathv/data/gh-pages/all/pew_religion_religionByCountry.csv"))

m[, -1] <- lapply(m[, -1], function(x) {
    as_numeric(sapply(rm_number(x, extract= TRUE), paste, collapse=""))
})

p_load(dplyr)

c(apply(m[, -1], 2, sum)) %>%
    vect2df("Religion", "Total") %>%
    mutate(
        Proportion = Total/sum(Total),
        Percent = paste(round(100*Proportion, 2), "\\%"),
        Proportion = round(Proportion, 5),
        Total = format(Total,  big.mark = ",", scientific=FALSE),
        Religion = gsub("^U.+", "None", gsub("\\..+", "", Religion))
    ) %>%
    arrange(desc(Proportion)) %>%
    select(1, 3) %>% dput
    select(-3) %>%
    tabular() %>%
    cat(file="clipboard")

