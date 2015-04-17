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

The `r_data_frame` function (random data frame) takes `n` (the number of rows) and any number of variables (columns).  These columns are typically produced from a **wakefield** variable function.  Each of these variable functions has a pre-set behavior that produces a named vector of n length, allowing the user to lazily pass unnamed functions (optionally, without call parenthesis).  The column name is hidden as a `varname` attribute.  For example here we see the `race` variable function:


```r
race(n=10)
```

```
##  [1] Hispanic Asian    Asian    White    Black    Hispanic White   
##  [8] Hispanic Black    White   
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
## 4    Native
## 5     Asian
## 6     White
## 7     Asian
## 8     White
## 9  Hispanic
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
##     ID  Race Age    Sex     Hour  IQ Height  Died
## 1  001 Black  32 Female 00:00:00  97     68 FALSE
## 2  002 White  24   Male 00:00:00 101     68 FALSE
## 3  003 White  28 Female 00:00:00  84     71  TRUE
## 4  004 White  32   Male 00:00:00  95     69 FALSE
## 5  005 White  28 Female 00:00:00  97     73  TRUE
## 6  006 White  34   Male 00:00:00 122     71 FALSE
## 7  007 Black  20   Male 00:00:00 107     69 FALSE
## 8  008 White  20   Male 00:00:00  98     75 FALSE
## 9  009 White  33   Male 00:00:00  93     78  TRUE
## 10 010 White  22 Female 00:30:00 101     70  TRUE
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
##     ID Scoring Smoker      Race Age    Sex     Hour  IQ Height  Died
## 1  001  1.6415  FALSE     White  22   Male 00:00:00  94     70  TRUE
## 2  002 -0.2662   TRUE     White  23 Female 00:00:00  93     74 FALSE
## 3  003 -1.9064   TRUE     White  24   Male 00:00:00 100     67  TRUE
## 4  004  0.2503  FALSE     White  26 Female 00:00:00  93     67  TRUE
## 5  005  0.8405   TRUE     Black  26 Female 00:00:00 117     60 FALSE
## 6  006  0.2656   TRUE     White  24 Female 00:00:00  98     76 FALSE
## 7  007  0.1092  FALSE     White  34   Male 00:00:00  96     70 FALSE
## 8  008 -0.3398  FALSE     Asian  24 Female 00:00:00  92     73  TRUE
## 9  009 -0.3989   TRUE Bi-Racial  23 Female 00:00:00 113     72 FALSE
## 10 010 -0.6393  FALSE     White  23   Male 00:00:00 113     65  TRUE
## .. ...     ...    ...       ... ...    ...      ... ...    ...   ...
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
##     ID Scoring Smoker Reading(mins)      Race Age    Sex     Hour  IQ
## 1  001 -0.8729   TRUE            25     White  11   Male 00:00:00  92
## 2  002 -1.3274  FALSE            25     White  12 Female 00:00:00 109
## 3  003  1.0815   TRUE            23     White  14   Male 00:00:00  93
## 4  004  0.9911   TRUE            12     Black   9   Male 00:00:00  88
## 5  005 -1.8943   TRUE            20 Bi-Racial  11 Female 00:00:00 104
## 6  006  0.9661  FALSE            15  Hispanic  12 Female 00:00:00 114
## 7  007 -0.8023   TRUE            28     White  12   Male 00:00:00  91
## 8  008 -1.5360   TRUE            22  Hispanic  12 Female 00:00:00  81
## 9  009 -0.4913   TRUE            20     Asian  11 Female 00:00:00 108
## 10 010 -0.4321   TRUE            26     White  14   Male 00:30:00 104
## .. ...     ...    ...           ...       ... ...    ...      ... ...
## Variables not shown: Height (dbl), Died (lgl)
```



## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









