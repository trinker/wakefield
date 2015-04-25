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
##  [1] White    Hispanic Black    White    Hispanic White    Asian   
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
## 1     White
## 2     Black
## 3     White
## 4     White
## 5     Asian
## 6  Hispanic
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
##     ID     Race Age    Sex     Hour  IQ Height  Died
## 1  001    White  32   Male 00:00:00 103     77 FALSE
## 2  002    White  30   Male 00:00:00  96     70 FALSE
## 3  003    White  34 Female 00:00:00 114     70  TRUE
## 4  004    White  25   Male 00:00:00 106     67  TRUE
## 5  005    White  27 Female 00:00:00 103     67  TRUE
## 6  006    White  21 Female 00:00:00  98     67  TRUE
## 7  007 Hispanic  34   Male 00:00:00  92     71 FALSE
## 8  008 Hispanic  27   Male 00:30:00 106     62  TRUE
## 9  009    White  22 Female 00:30:00  94     62 FALSE
## 10 010    Black  25 Female 00:30:00 108     71 FALSE
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
##     ID    Scoring Smoker     Race Age    Sex     Hour  IQ Height  Died
## 1  001 -0.2034816  FALSE    White  26 Female 00:00:00 106     74 FALSE
## 2  002 -0.1442279  FALSE Hispanic  20   Male 00:00:00  93     70  TRUE
## 3  003  1.5907056  FALSE    White  30   Male 00:00:00 105     70  TRUE
## 4  004  0.4270862  FALSE    White  28   Male 00:00:00  87     65  TRUE
## 5  005 -0.1599932   TRUE    White  30 Female 00:00:00 124     77 FALSE
## 6  006 -0.2641669   TRUE    White  27   Male 00:00:00 106     70  TRUE
## 7  007  0.3999410  FALSE    White  29 Female 00:00:00 122     68  TRUE
## 8  008  1.7437113   TRUE    White  35   Male 00:00:00 101     71  TRUE
## 9  009 -0.7204378   TRUE Hispanic  25 Female 00:30:00 121     75  TRUE
## 10 010  1.6416635  FALSE    White  26   Male 00:30:00 107     65 FALSE
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
##     ID    Scoring Smoker Reading(mins)  Race Age    Sex     Hour  IQ
## 1  001 -0.7159927   TRUE            23 Asian  12   Male 00:00:00 108
## 2  002 -0.4987348  FALSE            23 White  11 Female 00:00:00  81
## 3  003 -1.0256886   TRUE            23 White  10 Female 00:00:00  90
## 4  004 -0.5624134  FALSE            30 White   9   Male 00:00:00 102
## 5  005  0.4272436   TRUE            12 White  14 Female 00:00:00  79
## 6  006  0.0853898  FALSE            20 White  10   Male 00:00:00 100
## 7  007  0.2990398   TRUE            14 White   9   Male 00:00:00 104
## 8  008 -1.6902027  FALSE            23 Black   9   Male 00:00:00  95
## 9  009  0.9856923  FALSE            17 White   9   Male 00:00:00 100
## 10 010  1.3158711  FALSE            17 White   8   Male 00:30:00 105
## .. ...        ...    ...           ...   ... ...    ...      ... ...
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
##    ID     Race Age    Sex     Hour  IQ Height  Died      Scoring Smoker
## 1  01    White  NA     NA 01:00:00 118     72  TRUE  1.842498628  FALSE
## 2  02    White  NA   Male 01:00:00 102     72  TRUE -0.200240440  FALSE
## 3  03 Hispanic  NA   Male     <NA>  NA     NA FALSE -0.004860979   TRUE
## 4  04       NA  NA   Male 02:30:00  NA     65  TRUE -0.356429903   TRUE
## 5  05    White  NA Female 03:00:00 104     73 FALSE -0.621576875     NA
## 6  06       NA  20     NA 03:30:00  NA     67 FALSE  0.041356420     NA
## 7  07 Hispanic  23     NA 03:30:00  87     62    NA  2.753377276   TRUE
## 8  08    White  21     NA     <NA>  98     NA    NA           NA   TRUE
## 9  09    White  20     NA     <NA> 106     65  TRUE  1.549071141  FALSE
## 10 10       NA  33   Male 08:30:00  NA     NA FALSE           NA   TRUE
## .. ..      ... ...    ...      ... ...    ...   ...          ...    ...
```

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









