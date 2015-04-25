# wakefield



[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/trinker/wakefield.svg?branch=master)](https://travis-ci.org/trinker/wakefield)
[![Coverage Status](https://coveralls.io/repos/trinker/wakefield/badge.svg?branch=master)](https://coveralls.io/r/trinker/wakefield?branch=master)
<a href="https://img.shields.io/badge/Version-0.1.0-orange.svg"><img src="https://img.shields.io/badge/Version-0.1.0-orange.svg" alt="Version"/></a></p>

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
##  [1] White    White    White    White    Black    Hispanic White   
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
## 2  Hispanic
## 3     White
## 4     Black
## 5     Black
## 6     White
## 7     White
## 8  Hispanic
## 9  Hispanic
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
## 1  001 Hispanic  25   Male 00:00:00  92     69  TRUE
## 2  002    White  30   Male 00:00:00 109     61 FALSE
## 3  003    Black  28   Male 00:00:00  99     69 FALSE
## 4  004    White  32   Male 00:00:00  89     76 FALSE
## 5  005    White  33   Male 00:00:00 101     69 FALSE
## 6  006    White  28 Female 00:00:00 105     70  TRUE
## 7  007    White  32 Female 00:00:00  82     61  TRUE
## 8  008    Black  34   Male 00:00:00  85     69 FALSE
## 9  009    Black  29 Female 00:00:00  94     68  TRUE
## 10 010 Hispanic  26   Male 00:30:00  91     73  TRUE
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
## 1  001 -0.21737144  FALSE    White  27 Female 00:00:00 115     76  TRUE
## 2  002 -0.07760526   TRUE    Black  22   Male 00:00:00  71     63  TRUE
## 3  003  0.03614279  FALSE    White  28   Male 00:00:00 109     73  TRUE
## 4  004 -1.27301298   TRUE    White  23 Female 00:00:00  98     64  TRUE
## 5  005  0.94778631   TRUE    White  22 Female 00:30:00  96     71 FALSE
## 6  006  0.22998102  FALSE    White  32   Male 00:30:00  81     77 FALSE
## 7  007 -1.92921008   TRUE Hispanic  30 Female 00:30:00  95     72  TRUE
## 8  008 -0.57163732  FALSE    White  31 Female 00:30:00 101     74  TRUE
## 9  009 -0.84526219  FALSE    White  23 Female 00:30:00  83     71 FALSE
## 10 010 -1.14494169   TRUE    White  23   Male 00:30:00  90     67 FALSE
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
##     ID    Scoring Smoker Reading(mins)     Race Age    Sex     Hour  IQ
## 1  001  1.1477649  FALSE            18    White  10 Female 00:00:00  97
## 2  002  0.2774271   TRUE            18    Black   9   Male 00:00:00 107
## 3  003 -0.4961085  FALSE            18    White  14   Male 00:00:00  92
## 4  004  1.3165367  FALSE            22    Black   8 Female 00:00:00 108
## 5  005 -0.4248320  FALSE            19 Hispanic   9 Female 00:00:00 101
## 6  006  1.0065336  FALSE            16 Hispanic  11 Female 00:00:00  79
## 7  007 -1.6467944  FALSE            12    White  10 Female 00:00:00 106
## 8  008  0.6127243   TRUE            24    White  14   Male 00:00:00  94
## 9  009  0.4735843   TRUE            18    White  11   Male 00:00:00 121
## 10 010 -0.4385389   TRUE            21 Hispanic  13 Female 00:00:00 124
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
##    ID     Race Age    Sex     Hour  IQ Height  Died     Scoring Smoker
## 1  01    White  29 Female 00:30:00  NA     NA    NA          NA  FALSE
## 2  02 Hispanic  NA Female 02:00:00  92     66  TRUE  1.52309022     NA
## 3  03    White  32     NA     <NA>  89     71 FALSE -1.42852019  FALSE
## 4  04       NA  NA Female 03:00:00 100     NA    NA          NA   TRUE
## 5  05       NA  29     NA 05:00:00 101     68  TRUE          NA  FALSE
## 6  06    Black  NA     NA     <NA>  NA     NA FALSE -0.76667836     NA
## 7  07    White  NA   Male     <NA> 102     NA    NA -1.58309599   TRUE
## 8  08    White  34 Female     <NA> 103     NA    NA -1.37872358  FALSE
## 9  09       NA  23   Male     <NA>  94     NA FALSE -0.15601500  FALSE
## 10 10       NA  20     NA 08:00:00  NA     66  TRUE  0.03229769   TRUE
## .. ..      ... ...    ...      ... ...    ...   ...         ...    ...
```

## Repeated Measures & Time Series

The `r_series` function allows the user to pass a single **wakefield** function and dictate how many columns (`j`) to produce.  


```r
set.seed(10)

r_series(likert, j = 3, n=10)
```

```
## Source: local data frame [10 x 3]
## 
##           Likert_1          Likert_2          Likert_3
## 1          Neutral          Disagree Strongly Disagree
## 2            Agree           Neutral          Disagree
## 3          Neutral   Strongly Agree           Disagree
## 4         Disagree           Neutral             Agree
## 5  Strongly Agree              Agree           Neutral
## 6            Agree           Neutral          Disagree
## 7            Agree   Strongly Agree  Strongly Disagree
## 8            Agree             Agree             Agree
## 9         Disagree             Agree          Disagree
## 10         Neutral Strongly Disagree             Agree
```

Often the user wants a numeric score for Likert type columns and similar variables.  For series with multiple factors the `as_integer` converts all columns to integer values.  Additionally, we may want to specify column name prefixes. This can be accomplished via the variable function's `name` argument.  Both of these features are demonstrated here.


```r
set.seed(10)

as_integer(r_series(likert, j = 5, n=10, name = "Item"))
```

```
## Source: local data frame [10 x 5]
## 
##    Item_1 Item_2 Item_3 Item_4 Item_5
## 1       3      2      1      3      4
## 2       4      3      2      5      4
## 3       3      5      2      5      5
## 4       2      3      4      1      2
## 5       5      4      3      3      4
## 6       4      3      2      2      5
## 7       4      5      1      1      5
## 8       4      4      4      1      3
## 9       2      4      2      2      5
## 10      3      1      4      3      1
```

`r_series` can be used within a `r_data_frame` as well.  


```r
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    sex,
    r_series(likert, 3, name = "Question")
)
```

```
## Source: local data frame [100 x 6]
## 
##     ID Age    Sex        Question_1        Question_2        Question_3
## 1  001  28   Male             Agree             Agree Strongly Disagree
## 2  002  24   Male           Neutral   Strongly Agree           Disagree
## 3  003  26   Male          Disagree           Neutral          Disagree
## 4  004  31   Male Strongly Disagree           Neutral          Disagree
## 5  005  21 Female   Strongly Agree  Strongly Disagree Strongly Disagree
## 6  006  23 Female          Disagree          Disagree             Agree
## 7  007  24 Female          Disagree   Strongly Agree  Strongly Disagree
## 8  008  24   Male Strongly Disagree             Agree             Agree
## 9  009  29 Female             Agree   Strongly Agree    Strongly Agree 
## 10 010  26   Male Strongly Disagree Strongly Disagree             Agree
## .. ... ...    ...               ...               ...               ...
```



```r
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    sex,
    as_integer(r_series(likert, j = 5, n = 100, name = "Item"))
)
```

```
## Source: local data frame [100 x 8]
## 
##     ID Age    Sex Item_1 Item_2 Item_3 Item_4 Item_5
## 1  001  28   Male      5      5      3      5      5
## 2  002  24   Male      3      4      4      1      3
## 3  003  26   Male      3      2      4      2      2
## 4  004  31   Male      3      2      2      5      3
## 5  005  21 Female      5      4      2      1      3
## 6  006  23 Female      2      5      5      5      3
## 7  007  24 Female      2      1      2      5      5
## 8  008  24   Male      5      3      4      1      4
## 9  009  29 Female      1      1      5      4      2
## 10 010  26   Male      2      4      4      4      5
## .. ... ...    ...    ...    ...    ...    ...    ...
```

## Expanded Dummy Coding

The user may wish to expand a `factor` into `j` dummy coded columns.  The `r_dummy` function expands a factor into `j` columns and works similar to the `r_series` function.  The user may wish to use the original factor name as the prefix to the `j` columns.  Setting `prefix = TRUE` within `r_dummy` accomplishes this.



```r
set.seed(10)
r_data_frame(n=100,
    id,
    age,
    r_dummy(sex, prefix = TRUE),
    r_dummy(political)
)
```

```
## Source: local data frame [100 x 9]
## 
##     ID Age Sex_Male Sex_Female Constitution Democrat Green Libertarian
## 1  001  28        1          0            1        0     0           0
## 2  002  24        1          0            1        0     0           0
## 3  003  26        1          0            0        1     0           0
## 4  004  31        1          0            0        1     0           0
## 5  005  21        0          1            1        0     0           0
## 6  006  23        0          1            0        1     0           0
## 7  007  24        0          1            0        1     0           0
## 8  008  24        1          0            0        0     0           0
## 9  009  29        0          1            1        0     0           0
## 10 010  26        1          0            0        1     0           0
## .. ... ...      ...        ...          ...      ...   ...         ...
## Variables not shown: Republican (int)
```

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>









