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
##  [1] White    White    White    White    White    Hispanic White   
##  [8] Asian    Asian    White   
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
## 3     Black
## 4  Hispanic
## 5     White
## 6     White
## 7     White
## 8     Asian
## 9     White
## 10    Black
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
## 1  001    White  25   Male 00:00:00 101     70  TRUE
## 2  002 Hispanic  21   Male 00:00:00  91     66 FALSE
## 3  003    White  24 Female 00:00:00 112     73  TRUE
## 4  004 Hispanic  27   Male 00:00:00 102     67 FALSE
## 5  005   Native  27 Female 00:00:00  92     71  TRUE
## 6  006    White  21   Male 00:00:00 115     66 FALSE
## 7  007    White  25 Female 00:00:00  88     66 FALSE
## 8  008    White  23 Female 00:30:00  87     78  TRUE
## 9  009    White  21 Female 00:30:00  95     65  TRUE
## 10 010    White  22   Male 00:30:00  90     67  TRUE
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
##     ID     Scoring Smoker     Race Age    Sex     Hour  IQ Height  Died
## 1  001  0.07538366   TRUE    White  20   Male 00:00:00 104     67 FALSE
## 2  002 -0.11129912   TRUE    White  24   Male 00:00:00 114     67  TRUE
## 3  003  1.01898317  FALSE    White  20   Male 00:00:00 108     71 FALSE
## 4  004 -0.36466948  FALSE    White  28 Female 00:00:00  84     66  TRUE
## 5  005 -0.53830416  FALSE    White  34 Female 00:00:00  92     67 FALSE
## 6  006 -1.15043982   TRUE    Black  34 Female 00:00:00  95     70  TRUE
## 7  007 -2.35348865   TRUE    White  26 Female 00:00:00 110     70 FALSE
## 8  008  0.77679862   TRUE    White  28 Female 00:00:00 100     72 FALSE
## 9  009  0.85409641  FALSE    White  30   Male 00:00:00 109     70  TRUE
## 10 010 -0.77784216   TRUE Hispanic  31 Female 00:00:00 102     65  TRUE
## .. ...         ...    ...      ... ...    ...      ... ...    ...   ...
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
##     ID      Scoring Smoker Reading(mins)     Race Age    Sex     Hour  IQ
## 1  001 -0.789233704  FALSE            23 Hispanic  12   Male 00:00:00 105
## 2  002  1.631386829  FALSE            16    Asian  13   Male 00:00:00 106
## 3  003  2.720207418  FALSE            19    White  13 Female 00:00:00  99
## 4  004 -0.740938872   TRUE            39    White  13   Male 00:00:00 107
## 5  005 -0.924002937   TRUE            21    White  11   Male 00:30:00 100
## 6  006 -0.638329452   TRUE            21    White  12 Female 00:30:00 106
## 7  007  0.479057923  FALSE            22    White   8   Male 00:30:00 106
## 8  008 -0.003471447   TRUE            19    White  12 Female 00:30:00 110
## 9  009  0.027396682  FALSE            15    Black   9   Male 00:30:00  88
## 10 010 -1.601577744  FALSE            14    White  12 Female 00:30:00 109
## .. ...          ...    ...           ...      ... ...    ...      ... ...
## Variables not shown: Height (dbl), Died (lgl)
```

## Random Missing Observations

Often data contains missing values.  **wakefield** allows the user to add a proportion of missing values vie the `r_na` (random `NA`).  THis works nicely within a `dplyr`/`magrittr` pipeline:

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









