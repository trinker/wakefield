x <- "age ; animal , pet ; answer ; area ; car ; children ; coin ; date_stamp ;
death , died ; dice ; dna ; dummy ; education ; employment ; eye ; gpa , grade , grade_letter ; grade_level ;
group ; hair ; height , height_cm , height_in ; income ; iq ; language ; level ; likert , likert_5 ,
likert_7 ; lorem_ipsum , paragraph ; lower , lower_factor , upper , upper_factor ; marital ;
month ; name ; normal , normal_round ; political ; race ; sat ; sentence ; sex ; smokes ; speed ,
speed_kph , speed_mph ; state ; string ; valid ; year ; zip_code ; dob ; birth"

p_load(wakefield)

vect <- sort(strsplit(x, "\\s*[;,]\\s*")[[1]])

cat(paste("dat <- r_data_frame(100,\n",
    paste(vect, collapse=",\n   "),
"\n)"), file="clipboard")

dat <- r_data_frame(100,
 age,
   animal,
   answer,
   area,
   birth,
   car,
   children,
   coin,
   date_stamp,
   death,
   dice,
   died,
   dna,
   dob,
   dummy,
   education,
   employment,
   eye,
   gpa,
   grade,
   grade_letter,
   grade_level,
   group,
   hair,
   height,
   height_cm,
   height_in,
   income,
   iq,
   language,
   level,
   likert,
   likert_5,
   likert_7,
   lorem_ipsum,
   lower,
   lower_factor,
   marital,
   month,
   name,
   normal,
   normal_round,
   paragraph,
   pet,
   political,
   race,
   sat,
   sentence,
   sex,
   smokes,
   speed,
   speed_kph,
   speed_mph,
   state,
   string,
   upper,
   upper_factor,
   valid,
   year,
   zip_code 
)

(pp <- lapply(lapply(dat, class), paste, collapse=" ") %>%
    list2df("x", "y") %>%
    `[`(, 2:1) %>%
    data.frame(fun = vect, ., stringsAsFactors = FALSE))


table(pp[[2]])

lapply(with(pp, split(fun, x)), sort)
