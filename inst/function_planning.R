distance
width
length
weight
military
religion
family ##stats function
sport
==============================
r_insert <-

dat <- dplyr::data_frame(
    ID = wakefield::id(n=100),
    Smokes = smokes(n=100),
    Sick = ifelse(Smokes, sample(5:10, 100, TRUE), sample(0:4, 100, TRUE)),
    Death = ifelse(Smokes, sample(0:1, 100, TRUE, prob = c(.2, .8)), sample(0:1, 100, TRUE, prob = c(.7, .3)))
)

r_data_frame(100,
   id,
   seriesname(dat, "temp")
)



