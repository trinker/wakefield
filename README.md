# wakefield



[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/trinker/wakefield.svg?branch=master)](https://travis-ci.org/trinker/wakefield)
[![Coverage Status](https://coveralls.io/repos/trinker/wakefield/badge.svg?branch=master)](https://coveralls.io/r/trinker/wakefield?branch=master)
<a href="https://img.shields.io/badge/Version-0.0.1-orange.svg"><img src="https://img.shields.io/badge/Version-0.0.1-orange.svg" alt="Version"/></a></p>

**wakefield** is designed to quickly generate random data sets.  The user passes `n` (number of rows) and predefined vectors to the `r_data_frame` function to produce a `dplyr::tbl_df` object.

<img src="inst/wakefield_logo/r_wakefield.png" width="20%", alt="">  

## Installation

To download the development version of **wakefield**:

Download the [zip ball](https://github.com/trinker/wakefield/zipball/master) or [tar ball](https://github.com/trinker/wakefield/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **pacman** package to install the development version:

```r
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh("trinker/wakefield")
```

## Demonstration

The `r_data_frame` function (random data frame) takes `n` (the number of rows) and any number of variables (columns).  These columns are typically produced from a **wakefield** variable function.  Each of these variable functions has a pre-set behavior that produces a named vector of n length, allowing the user to lazily pass unnamed functions (optionally, without call parenthesis).  The column name is hidden as a `varname` attribute.  For example here we see the `race` variable function:


```r
race(n=10)
```

```
##  [1] Asian    Asian    Hispanic Hispanic White    White    Asian   
##  [8] White    White    White   
## Levels: White Hispanic Black Asian Bi-Racial Native Other Hawaiian
```

```r
attributes(race(n=10))
```

```
## $levels
## [1] "White"     "Hispanic"  "Black"     "Asian"     "Bi-Racial" "Native"   
## [7] "Other"     "Hawaiian" 
## 
## $class
## [1] "variable" "factor"  
## 
## $varname
## [1] "Race"
```

When this variable is used inside of `r_data_frame` the `varname` is used as a column name.  Additionally, the `n` argument is not set within variable functions but is set once in `r_data_frame`:


```r
r_data_frame(
    n = 500,
    race
)
```

```
## Source: local data frame [500 x 1]
## 
##        Race
## 1     White
## 2  Hispanic
## 3     Black
## 4     White
## 5     Black
## 6     White
## 7     White
## 8     White
## 9     White
## 10    White
## ..      ...
```

The power of `r_data_frame` is apparent when we use many modular variable functions:


```r
r_data_frame(
    n = 500,
    id,
    race,
    age,
    sex,
    hour,
    iq,
    height,
    died
)
```

```
## Source: local data frame [500 x 8]
## 
##     ID      Race Age    Sex     Hour  IQ Height  Died
## 1  001 Bi-Racial  28   Male 00:00:00  82     66 FALSE
## 2  002  Hispanic  33   Male 00:00:00  87     64  TRUE
## 3  003     Black  31   Male 00:00:00  98     68 FALSE
## 4  004     White  32 Female 00:00:00 118     71  TRUE
## 5  005     White  30   Male 00:00:00  91     66 FALSE
## 6  006     White  35   Male 00:00:00 108     60 FALSE
## 7  007     White  32 Female 00:00:00 102     69 FALSE
## 8  008     White  30 Female 00:00:00 114     63  TRUE
## 9  009  Hispanic  29   Male 00:00:00 105     70 FALSE
## 10 010     White  27   Male 00:00:00  98     70 FALSE
## .. ...       ... ...    ...      ... ...    ...   ...
```


There are a plethora of **wakefield** based variable functions to chose from, spanning **R**'s various data types. However, the user may also pass their own vector producing functions or vectors to `r_data_frame`.  Those with an `n` argument can be set by `r_data_table`:


```r
r_data_frame(
    n = 500,
    id,
    Scoring = rnorm,
    Smoker = valid,
    race,
    age,
    sex,
    hour,
    iq,
    height,
    died
)
```

```
## Source: local data frame [500 x 10]
## 
##     ID    Scoring Smoker     Race Age    Sex     Hour  IQ Height  Died
## 1  001  1.5177480   TRUE    Black  35 Female 00:00:00 101     70  TRUE
## 2  002  1.6289874   TRUE Hispanic  22 Female 00:00:00  95     72  TRUE
## 3  003 -0.5429134  FALSE    White  24   Male 00:00:00  92     66 FALSE
## 4  004 -0.3703318  FALSE    White  20   Male 00:00:00 101     70  TRUE
## 5  005  0.7339495  FALSE    White  25   Male 00:00:00  93     73 FALSE
## 6  006 -1.5600149   TRUE    White  34   Male 00:00:00 102     70 FALSE
## 7  007 -1.2310844  FALSE Hispanic  27 Female 00:00:00  92     62  TRUE
## 8  008  1.3301015  FALSE    White  31   Male 00:00:00  93     69 FALSE
## 9  009 -0.3490480  FALSE Hispanic  27   Male 00:00:00 103     67 FALSE
## 10 010  0.6884746   TRUE    White  27   Male 00:00:00 102     65 FALSE
## .. ...        ...    ...      ... ...    ...      ... ...    ...   ...
```

While, passing variable functions to `r_data_frame` without call parenthesis is handy the user may wish to set arguments.  This can be done through call parenthesis as we do with `data.frame` or `dplyr::data_frame`:


```r
r_data_frame(
    n = 500,
    id,
    Scoring = rnorm,
    Smoker = valid,
    `Reading(mins)` = rpois(lambda=20),  
    race,
    age(x = 8:14),
    sex,
    hour,
    iq,
    height(mean=50, sd = 10),
    died
)
```

```
## Source: local data frame [500 x 11]
## 
##     ID    Scoring Smoker Reading(mins)     Race Age    Sex     Hour  IQ
## 1  001  2.1282076  FALSE            21    White   8 Female 00:00:00 128
## 2  002 -1.6702316  FALSE            21    White   8   Male 00:00:00  89
## 3  003  0.8588876  FALSE            25    White  10 Female 00:00:00  82
## 4  004  0.6184614  FALSE            15    White  11 Female 00:00:00  92
## 5  005 -0.2655337  FALSE            37 Hispanic  10   Male 00:00:00  82
## 6  006  2.5336637   TRUE            20    Asian  12   Male 00:00:00  87
## 7  007 -1.6058909  FALSE            16    Black  13   Male 00:00:00 113
## 8  008  0.1950435  FALSE            23    White  12 Female 00:00:00  96
## 9  009 -1.6476078  FALSE            17    White   9 Female 00:00:00  99
## 10 010  0.8761756   TRUE            27    Black  12   Male 00:00:00 109
## .. ...        ...    ...           ...      ... ...    ...      ... ...
## Variables not shown: Height (dbl), Died (lgl)
```

## Random Missing Observations

Often data contains missing values.  **wakefield** allows the user to add a proportion of missing values per column/vector via the `r_na` (random `NA`).  This works nicely within a **dplyr**/**magrittr** `%>%` *then* pipeline:

```r
r_data_frame(
    n = 30,
    id,
    race,
    age,
    sex,
    hour,
    iq,
    height,
    died,
    Scoring = rnorm,
    Smoker = valid
) %>%
    r_na(prob=.4)
```

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









