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
##  [1] White    Hispanic White    White    White    White    White   
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
## 3  Hispanic
## 4     Black
## 5     White
## 6     White
## 7     Black
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
##     ID  Race Age    Sex     Hour  IQ Height  Died
## 1  001 White  33   Male 00:00:00 100     73  TRUE
## 2  002 White  22 Female 00:00:00  85     67 FALSE
## 3  003 White  20 Female 00:00:00  98     73 FALSE
## 4  004 White  31   Male 00:00:00  97     64 FALSE
## 5  005 White  34   Male 00:00:00 107     71 FALSE
## 6  006 Asian  23   Male 00:00:00  96     72 FALSE
## 7  007 White  27 Female 00:00:00 102     73  TRUE
## 8  008 White  28 Female 00:00:00  88     73 FALSE
## 9  009 Black  20   Male 00:00:00 106     64  TRUE
## 10 010 White  35 Female 00:00:00  95     68  TRUE
## .. ...   ... ...    ...      ... ...    ...   ...
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
## 1  001 -0.5937424   TRUE Hispanic  25   Male 00:00:00 116     62  TRUE
## 2  002  0.5084348  FALSE    White  27 Female 00:00:00  95     65 FALSE
## 3  003 -1.5168483  FALSE    White  24 Female 00:00:00 100     69 FALSE
## 4  004 -0.1540292   TRUE    White  32   Male 00:00:00 103     70 FALSE
## 5  005 -1.1245353  FALSE    Black  34 Female 00:00:00  99     64  TRUE
## 6  006  0.3146586  FALSE    White  31   Male 00:00:00 100     67  TRUE
## 7  007  2.0715902  FALSE Hispanic  31   Male 00:00:00  93     66 FALSE
## 8  008 -0.8077976   TRUE    Asian  33   Male 00:00:00  86     68  TRUE
## 9  009  0.2750645  FALSE    White  35   Male 00:00:00 104     65  TRUE
## 10 010  1.4477078   TRUE    Black  30 Female 00:00:00  95     76 FALSE
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
##     ID      Scoring Smoker Reading(mins)  Race Age    Sex     Hour  IQ
## 1  001 -0.376946764  FALSE            18 White  10 Female 00:00:00  85
## 2  002  0.492418773  FALSE            17 Black   8   Male 00:00:00  95
## 3  003 -0.378151772  FALSE            24 White  13   Male 00:00:00  96
## 4  004 -0.008399106   TRUE            19 White  14   Male 00:00:00 100
## 5  005 -0.325599770   TRUE            16 White  13 Female 00:00:00 104
## 6  006  1.717218270   TRUE            20 Black   8   Male 00:00:00 101
## 7  007 -0.672705234   TRUE            23 White  10   Male 00:00:00 108
## 8  008  0.331647134  FALSE            19 White  12 Female 00:00:00  97
## 9  009  0.829235363  FALSE            20 Black   9   Male 00:00:00  99
## 10 010  0.141612945  FALSE            24 Asian   9 Female 00:00:00  97
## .. ...          ...    ...           ...   ... ...    ...      ... ...
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
##    ID     Race Age    Sex     Hour  IQ Height  Died     Scoring Smoker
## 1  01       NA  NA     NA     <NA>  NA     64 FALSE  0.97296803     NA
## 2  02 Hispanic  34 Female 01:00:00  NA     68    NA          NA   TRUE
## 3  03    White  28     NA     <NA>  92     72    NA          NA   TRUE
## 4  04    White  21 Female 02:00:00  NA     69 FALSE  0.45246152  FALSE
## 5  05       NA  NA   Male     <NA>  NA     74    NA          NA   TRUE
## 6  06    White  NA   Male 02:30:00  93     67    NA -0.49846200   TRUE
## 7  07       NA  24     NA     <NA> 102     66  TRUE -0.04198266   TRUE
## 8  08       NA  NA     NA     <NA> 101     NA    NA          NA     NA
## 9  09    White  30 Female     <NA> 114     66 FALSE -2.24358468     NA
## 10 10    White  20     NA 07:30:00  NA     70    NA          NA     NA
## .. ..      ... ...    ...      ... ...    ...   ...         ...    ...
```

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









