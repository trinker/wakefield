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
##  [1] White    White    Black    White    Black    White    White   
##  [8] White    Hispanic White   
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
## 1     Black
## 2     Black
## 3     White
## 4  Hispanic
## 5  Hispanic
## 6     Black
## 7     White
## 8  Hispanic
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
##     ID     Race Age    Sex     Hour  IQ Height  Died
## 1  001    Black  34 Female 00:00:00  94     68 FALSE
## 2  002    White  32 Female 00:00:00  79     76  TRUE
## 3  003    Asian  24 Female 00:00:00  93     77 FALSE
## 4  004    White  29 Female 00:00:00 111     66  TRUE
## 5  005    White  21 Female 00:00:00  99     65  TRUE
## 6  006 Hispanic  31   Male 00:00:00  81     68 FALSE
## 7  007    White  26 Female 00:00:00 118     74 FALSE
## 8  008 Hispanic  21   Male 00:00:00  94     69  TRUE
## 9  009 Hispanic  21 Female 00:00:00 113     70 FALSE
## 10 010    White  32   Male 00:00:00  98     63 FALSE
## .. ...      ... ...    ...      ... ...    ...   ...
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
##     ID     Scoring Smoker      Race Age    Sex     Hour  IQ Height  Died
## 1  001 -1.06951138  FALSE     White  21   Male 00:00:00  96     75  TRUE
## 2  002  0.57194497   TRUE     White  28 Female 00:00:00  97     70 FALSE
## 3  003  0.23877589  FALSE  Hispanic  34 Female 00:00:00  87     65 FALSE
## 4  004  2.23330494   TRUE     White  28 Female 00:00:00 109     64 FALSE
## 5  005 -0.48208029  FALSE     White  23 Female 00:00:00 104     66 FALSE
## 6  006  0.53888867   TRUE     White  25   Male 00:00:00  97     74 FALSE
## 7  007  0.35277127  FALSE     White  27 Female 00:00:00 107     65  TRUE
## 8  008 -0.20500546   TRUE     White  23 Female 00:00:00 129     65 FALSE
## 9  009  0.42643643   TRUE     White  22   Male 00:00:00  96     73  TRUE
## 10 010 -0.04356387   TRUE Bi-Racial  25   Male 00:00:00  86     67  TRUE
## .. ...         ...    ...       ... ...    ...      ... ...    ...   ...
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
##     ID     Scoring Smoker Reading(mins)     Race Age    Sex     Hour  IQ
## 1  001  1.22853229   TRUE            26    White  12 Female 00:00:00  93
## 2  002 -1.62794147   TRUE            24    White  14   Male 00:00:00  87
## 3  003  1.78933111   TRUE            21    White  12   Male 00:00:00  93
## 4  004  0.31892340  FALSE            22 Hispanic  11 Female 00:00:00  97
## 5  005 -0.23972390  FALSE            31    White  13 Female 00:00:00 115
## 6  006 -0.15252143  FALSE            21    White  12   Male 00:00:00  91
## 7  007  0.02035541   TRUE            14    White   9 Female 00:00:00 103
## 8  008 -1.56789445   TRUE            25    White   9 Female 00:00:00  91
## 9  009 -1.45630405  FALSE            19    White   9 Female 00:00:00 104
## 10 010 -1.29838797  FALSE            22 Hispanic   9 Female 00:00:00  86
## .. ...         ...    ...           ...      ... ...    ...      ... ...
## Variables not shown: Height (dbl), Died (lgl)
```

## Random Missing Observations

Often data contains missing values.  **wakefield** allows the user to add a proportion of missing values vie the `r_na` (random `NA`).  This works nicely within a **dplyr**/**magrittr** `%>%` *then* pipeline:

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









