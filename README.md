# wakefield


```
## Warning in install.packages :
##   package 'dpyr' is not available (for R Under development)
```

```
## Warning: there is no package called 'dpyr'
## Warning: Failed to install/load:
## dpyr
```

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

The `r_data_frame` function (random data frame) takes `n` (the number of rows) and any number of variables (columns).  These columns are typicaly produced from a **wakefield** variable function.  Each of these variable functions has a preset behavior that produces a named vector of n length, allowing the user to lazily pass unnamed functions (optionally, without call parenthesis).  The column name is hidden as a `varname` attribute.  For example here we see the `race` variabe function:


```r
race(n=10)
```

```
##  [1] White     White     White     White     Hispanic  Hispanic  White    
##  [8] Hispanic  Hispanic  Bi-Racial
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
## 3     White
## 4     Asian
## 5     White
## 6  Hispanic
## 7  Hispanic
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
## 1  001 Hispanic  35 Female 00:00:00  95     69 FALSE
## 2  002    White  24   Male 00:00:00  96     70 FALSE
## 3  003    White  25   Male 00:00:00 108     70 FALSE
## 4  004    Asian  21 Female 00:00:00  96     68  TRUE
## 5  005    White  32   Male 00:00:00  75     68  TRUE
## 6  006    White  20   Male 00:00:00 101     66  TRUE
## 7  007    White  35 Female 00:00:00 109     67 FALSE
## 8  008 Hispanic  22 Female 00:00:00  93     66 FALSE
## 9  009    White  23   Male 00:30:00  98     69 FALSE
## 10 010 Hispanic  31   Male 00:30:00 112     70  TRUE
## .. ...      ... ...    ...      ... ...    ...   ...
```


There are a plethora of **wakefield** based variable functions to chose from, spanning R's various data types. However, the user may also pass their own vector producing functions or vectors to `r_data_frame`.  Those with an `n` argument can be set by `r_data_table`:


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
##     ID Scoring Smoker     Race Age    Sex     Hour  IQ Height  Died
## 1  001 -1.0703  FALSE    White  20 Female 00:00:00 101     69 FALSE
## 2  002 -1.4537  FALSE    White  21 Female 00:00:00 102     68  TRUE
## 3  003  0.3639   TRUE Hispanic  26 Female 00:00:00  87     68  TRUE
## 4  004  1.0561   TRUE    White  32   Male 00:00:00  93     76  TRUE
## 5  005 -1.1034   TRUE    White  20 Female 00:00:00  87     71  TRUE
## 6  006 -0.6779  FALSE    White  30   Male 00:00:00 103     66 FALSE
## 7  007 -0.7572  FALSE    White  34   Male 00:00:00  97     70  TRUE
## 8  008 -0.7829  FALSE    Black  31 Female 00:00:00 115     73  TRUE
## 9  009  1.4469   TRUE    Asian  30 Female 00:00:00 109     62  TRUE
## 10 010  1.4104  FALSE    White  33 Female 00:00:00  91     73  TRUE
## .. ...     ...    ...      ... ...    ...      ... ...    ...   ...
```

While, passing variable functions to `r_data_frame` without call parenthesis is handy the user may wish to set arguments.  This can be done through call parenthsis as we do with `data.frame` or `dplyr::data_frame`:


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
##     ID  Scoring Smoker Reading(mins)     Race Age    Sex     Hour  IQ
## 1  001 -1.13476  FALSE            26 Hispanic  13   Male 00:00:00  93
## 2  002 -0.81762   TRUE            22    White  10   Male 00:00:00  91
## 3  003  0.81288   TRUE            16    White  12   Male 00:00:00  88
## 4  004  1.51601  FALSE            17    Black  11 Female 00:00:00  92
## 5  005  0.07940   TRUE            17    White  12 Female 00:00:00 113
## 6  006 -0.63070   TRUE            24 Hispanic   8   Male 00:00:00  89
## 7  007  0.34506  FALSE            20 Hispanic  10 Female 00:00:00 103
## 8  008 -0.07583   TRUE            23    Black  14   Male 00:00:00 107
## 9  009 -0.13290  FALSE            18    White  14   Male 00:00:00 103
## 10 010  0.58853   TRUE            27    White  11   Male 00:00:00 106
## .. ...      ...    ...           ...      ... ...    ...      ... ...
##    Height  Died
## 1      64  TRUE
## 2      38 FALSE
## 3      61 FALSE
## 4      52  TRUE
## 5      64  TRUE
## 6      43 FALSE
## 7      52  TRUE
## 8      52 FALSE
## 9      55 FALSE
## 10     45  TRUE
## ..    ...   ...
```



## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









