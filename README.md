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
##  [1] Hispanic White    White    Black    Hispanic Hispanic White   
##  [8] Asian    Black    Black   
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
## 1  Hispanic
## 2     White
## 3     White
## 4     White
## 5     White
## 6     Black
## 7     White
## 8     White
## 9     White
## 10    Asian
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
## 1  001 White  30 Female 00:00:00  93     67 FALSE
## 2  002 Black  22   Male 00:00:00  96     63 FALSE
## 3  003 White  31   Male 00:00:00 127     70  TRUE
## 4  004 White  33 Female 00:00:00  75     70 FALSE
## 5  005 White  33 Female 00:00:00 106     64  TRUE
## 6  006 White  30 Female 00:00:00  97     60  TRUE
## 7  007 Asian  20 Female 00:00:00 101     74  TRUE
## 8  008 White  20   Male 00:00:00 108     70  TRUE
## 9  009 White  34 Female 00:00:00  76     74 FALSE
## 10 010 Black  27 Female 00:00:00  96     64 FALSE
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
##     ID  Scoring Smoker      Race Age    Sex     Hour  IQ Height  Died
## 1  001  0.57611  FALSE     White  35 Female 00:00:00  95     69  TRUE
## 2  002  0.02246  FALSE     White  22   Male 00:00:00 106     73 FALSE
## 3  003 -1.37453   TRUE     White  33 Female 00:00:00 107     71 FALSE
## 4  004  1.20713   TRUE     White  25 Female 00:00:00 112     65 FALSE
## 5  005  0.39792  FALSE     Black  25 Female 00:00:00 103     75 FALSE
## 6  006 -0.07882   TRUE     White  20 Female 00:00:00 104     69  TRUE
## 7  007  0.59936   TRUE     Asian  29   Male 00:30:00  94     67  TRUE
## 8  008  1.63051   TRUE     Black  31   Male 00:30:00 101     70  TRUE
## 9  009 -0.57019   TRUE     Black  24   Male 00:30:00  92     69 FALSE
## 10 010  0.83340   TRUE Bi-Racial  35   Male 00:30:00  97     68  TRUE
## .. ...      ...    ...       ... ...    ...      ... ...    ...   ...
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
##     ID Scoring Smoker Reading(mins)  Race Age    Sex     Hour  IQ Height
## 1  001 -2.3005   TRUE            15 Black  12   Male 00:00:00 108     45
## 2  002  1.3336   TRUE            19 White  10 Female 00:00:00  83     42
## 3  003 -0.1393  FALSE            11 Asian   9   Male 00:00:00 106     49
## 4  004  0.6270   TRUE            21 White   8 Female 00:00:00  86     43
## 5  005 -0.1178   TRUE            24 White   8   Male 00:00:00 112     52
## 6  006 -0.1345   TRUE            20 White  12 Female 00:00:00  97     30
## 7  007  0.4823  FALSE            18 White  11   Male 00:00:00  79     47
## 8  008  0.9077   TRUE            25 Asian  10 Female 00:00:00 113     37
## 9  009 -0.6830  FALSE            22 White  13 Female 00:00:00 103     25
## 10 010  0.2161  FALSE            23 White   9   Male 00:00:00  81     66
## .. ...     ...    ...           ...   ... ...    ...      ... ...    ...
## Variables not shown: Died (lgl)
```



## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









