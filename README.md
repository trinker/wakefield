# wakefield



[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/trinker/wakefield.svg?branch=master)](https://travis-ci.org/trinker/wakefield)
[![Coverage Status](https://coveralls.io/repos/trinker/wakefield/badge.svg?branch=master)](https://coveralls.io/r/trinker/wakefield?branch=master)
<a href="https://img.shields.io/badge/Version-0.0.1-orange.svg"><img src="https://img.shields.io/badge/Version-0.0.1-orange.svg" alt="Version"/></a></p>

**wakefield** is designed to quickly generate random data sets.  The user passes `n` (number of rows) and predefined vectors to the `r_data_frame` function to produce a `dplyr::tbl_df` object.

<img src="inst/wakefield_logo/r_wakefield.png" width="60%", alt="">  

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
##  [1] Bi-Racial Hispanic  White     White     White     Asian     White    
##  [8] White     White     White    
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
## 2     White
## 3  Hispanic
## 4     Black
## 5     White
## 6     White
## 7    Native
## 8     White
## 9     White
## 10 Hispanic
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
## 1  001    White  35 Female 00:00:00 108     74 FALSE
## 2  002    Black  20   Male 00:00:00  89     64 FALSE
## 3  003 Hispanic  29   Male 00:00:00 113     75  TRUE
## 4  004    White  31   Male 00:00:00  87     69 FALSE
## 5  005    White  27   Male 00:00:00 100     72 FALSE
## 6  006    White  26 Female 00:00:00  98     71  TRUE
## 7  007    Asian  20   Male 00:00:00  98     71 FALSE
## 8  008    White  21   Male 00:00:00 102     70 FALSE
## 9  009    White  35   Male 00:00:00  96     74  TRUE
## 10 010    White  27   Male 00:00:00 105     72  TRUE
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
##     ID     Scoring Smoker  Race Age    Sex     Hour  IQ Height  Died
## 1  001  1.24570408   TRUE White  29 Female 00:00:00  97     75  TRUE
## 2  002  0.33180310   TRUE White  28   Male 00:00:00 109     63 FALSE
## 3  003  0.42789060   TRUE White  33 Female 00:00:00 101     69  TRUE
## 4  004  0.97552833  FALSE White  33   Male 00:00:00  78     71 FALSE
## 5  005 -1.39895657   TRUE White  26 Female 00:00:00  76     69  TRUE
## 6  006  0.93806903   TRUE Asian  35   Male 00:00:00 114     68  TRUE
## 7  007  0.07001015   TRUE Black  33 Female 00:00:00 105     70  TRUE
## 8  008 -0.62530848   TRUE White  31 Female 00:00:00  93     76 FALSE
## 9  009  0.22691638   TRUE Asian  26 Female 00:00:00  96     65  TRUE
## 10 010 -1.38093532   TRUE White  35   Male 00:00:00 110     67  TRUE
## .. ...         ...    ...   ... ...    ...      ... ...    ...   ...
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
## 1  001 -1.0257939  FALSE            23 Hispanic  12 Female 00:00:00 105
## 2  002 -0.3048544   TRUE            20    White  12   Male 00:00:00 108
## 3  003  0.9917982  FALSE            22    White  14 Female 00:00:00 105
## 4  004 -1.4786655   TRUE            22 Hispanic  10 Female 00:00:00 111
## 5  005  1.2786795  FALSE            22    Black   9 Female 00:00:00 100
## 6  006 -0.8472265  FALSE            26 Hispanic  14   Male 00:00:00 108
## 7  007  0.8391221   TRUE            17    White  11 Female 00:00:00  97
## 8  008 -1.2797948  FALSE            14    White  10   Male 00:00:00  95
## 9  009  1.2664323   TRUE            21    White  10   Male 00:00:00  89
## 10 010 -0.8767045  FALSE            34    White  11 Female 00:30:00 102
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

```
## Source: local data frame [30 x 10]
## 
##    ID      Race Age    Sex     Hour  IQ Height  Died    Scoring Smoker
## 1  01        NA  26   Male     <NA>  99     NA  TRUE -0.1992774     NA
## 2  02        NA  27 Female 01:00:00 100     NA FALSE         NA   TRUE
## 3  03        NA  NA     NA 01:30:00  NA     NA  TRUE         NA     NA
## 4  04  Hispanic  26   Male 02:00:00  91     73 FALSE         NA     NA
## 5  05     White  NA     NA 02:30:00  92     71  TRUE -0.6734123  FALSE
## 6  06  Hispanic  26   Male 02:30:00  NA     NA FALSE  1.5138128   TRUE
## 7  07        NA  NA Female     <NA>  90     70  TRUE -0.2947129  FALSE
## 8  08  Hispanic  NA     NA     <NA> 124     82    NA -0.6392170  FALSE
## 9  09 Bi-Racial  23   Male 05:00:00  NA     75  TRUE         NA  FALSE
## 10 10        NA  33   Male     <NA>  NA     NA FALSE         NA   TRUE
## .. ..       ... ...    ...      ... ...    ...   ...        ...    ...
```

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









