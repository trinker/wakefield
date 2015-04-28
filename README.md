# wakefield





[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/trinker/wakefield.svg?branch=master)](https://travis-ci.org/trinker/wakefield)
[![Coverage Status](https://coveralls.io/repos/trinker/wakefield/badge.svg?branch=master)](https://coveralls.io/r/trinker/wakefield?branch=master)
[![DOI](https://zenodo.org/badge/5398/trinker/wakefield.svg)](http://dx.doi.org/10.5281/zenodo.17172)
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

## Help
    
- [Package PDF Help Manual](https://dl.dropboxusercontent.com/u/61803503/wakefield.pdf)   


## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/wakefield/issues>
* send a pull request on: <https://github.com/trinker/wakefield/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>

## Demonstration

The `r_data_frame` function (random data frame) takes `n` (the number of rows) and any number of variables (columns).  These columns are typically produced from a **wakefield** variable function.  Each of these variable functions has a pre-set behavior that produces a named vector of n length, allowing the user to lazily pass unnamed functions (optionally, without call parenthesis).  The column name is hidden as a `varname` attribute.  For example here we see the `race` variable function:


```r
race(n=10)
```

```
##  [1] White    Hispanic Hispanic Hispanic White    White    Black   
##  [8] White    White    Hispanic
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
##     Race
## 1  White
## 2  White
## 3  White
## 4  White
## 5  Black
## 6  White
## 7  White
## 8  White
## 9  White
## 10 White
## ..   ...
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
## 1  001    White  22   Male 00:00:00  85     70 FALSE
## 2  002    White  29   Male 00:00:00 101     76 FALSE
## 3  003    White  27 Female 00:00:00  99     70  TRUE
## 4  004    White  32 Female 00:00:00  92     62 FALSE
## 5  005    Black  24   Male 00:00:00  95     68 FALSE
## 6  006 Hispanic  28 Female 00:00:00  91     69 FALSE
## 7  007    White  27 Female 00:00:00 100     68  TRUE
## 8  008    Asian  20 Female 00:00:00 113     67 FALSE
## 9  009    White  26   Male 00:30:00 100     65  TRUE
## 10 010    Asian  24 Female 00:30:00  98     68 FALSE
## .. ...      ... ...    ...      ... ...    ...   ...
```


There are 66 **wakefield** based variable functions to chose from, spanning **R**'s various data types (see `?variables` for details).  

<!-- html table generated in R 3.1.2 by xtable 1.7-4 package -->
<!-- Tue Apr 28 11:18:01 2015 -->
<table >
  <tr> <td> age </td> <td> dice </td> <td> grade_letter </td> <td> level </td> <td> normal </td> <td> smokes </td> </tr>
  <tr> <td> animal </td> <td> died </td> <td> grade_level </td> <td> likert </td> <td> normal_round </td> <td> speed </td> </tr>
  <tr> <td> answer </td> <td> dna </td> <td> group </td> <td> likert_5 </td> <td> paragraph </td> <td> speed_kph </td> </tr>
  <tr> <td> area </td> <td> dob </td> <td> hair </td> <td> likert_7 </td> <td> pet </td> <td> speed_mph </td> </tr>
  <tr> <td> birth </td> <td> dummy </td> <td> height </td> <td> lorem_ipsum </td> <td> political </td> <td> state </td> </tr>
  <tr> <td> car </td> <td> education </td> <td> height_cm </td> <td> lower </td> <td> primary </td> <td> string </td> </tr>
  <tr> <td> children </td> <td> employment </td> <td> height_in </td> <td> lower_factor </td> <td> race </td> <td> upper </td> </tr>
  <tr> <td> coin </td> <td> eye </td> <td> income </td> <td> marital </td> <td> religion </td> <td> upper_factor </td> </tr>
  <tr> <td> color </td> <td> gender </td> <td> internet_browser </td> <td> military </td> <td> sat </td> <td> valid </td> </tr>
  <tr> <td> date_stamp </td> <td> gpa </td> <td> iq </td> <td> month </td> <td> sentence </td> <td> year </td> </tr>
  <tr> <td> death </td> <td> grade </td> <td> language </td> <td> name </td> <td> sex </td> <td> zip_code </td> </tr>
   </table>
<p class="caption"><b><em>Available Variable Functions</em></b></p>

However, the user may also pass their own vector producing functions or vectors to `r_data_frame`.  Those with an `n` argument can be set by `r_data_table`:


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
##     ID    Scoring Smoker  Race Age    Sex     Hour  IQ Height  Died
## 1  001  0.3505344  FALSE Black  21 Female 00:00:00 117     74  TRUE
## 2  002 -0.5751597   TRUE Black  22 Female 00:00:00 101     71 FALSE
## 3  003  0.3014190   TRUE Black  32 Female 00:00:00  85     61 FALSE
## 4  004 -2.4781913  FALSE White  23   Male 00:00:00 104     63 FALSE
## 5  005 -0.9991238  FALSE White  32   Male 00:00:00  84     68  TRUE
## 6  006  0.4845612   TRUE White  30 Female 00:00:00 112     74  TRUE
## 7  007 -1.3089491  FALSE White  22 Female 00:00:00 129     70  TRUE
## 8  008  0.2459723   TRUE White  32 Female 00:00:00  84     69 FALSE
## 9  009  0.1982807   TRUE Black  34 Female 00:00:00  95     73 FALSE
## 10 010 -1.2367944  FALSE White  21   Male 00:00:00 119     71  TRUE
## .. ...        ...    ...   ... ...    ...      ... ...    ...   ...
```



```r
r_data_frame(
    n = 500,
    id,
    age, age, age,
    grade, grade, grade
)
```

```
## Source: local data frame [500 x 7]
## 
##     ID Age_1 Age_2 Age_3 Grade_1 Grade_2 Grade_3
## 1  001    29    35    34    88.9    89.5    82.9
## 2  002    26    28    20    85.2    85.3    87.4
## 3  003    29    32    26    89.5    85.7    91.1
## 4  004    29    25    28    92.3    85.5    85.8
## 5  005    28    29    22    93.8    83.4    81.3
## 6  006    32    34    24    92.2    91.5    86.5
## 7  007    28    32    29    89.9    89.3    92.3
## 8  008    27    24    33    90.9    88.0    90.7
## 9  009    29    29    32    84.1    84.2    89.1
## 10 010    23    32    23    89.0    88.4    88.5
## .. ...   ...   ...   ...     ...     ...     ...
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
## 1  001  1.59619204  FALSE            21 Hispanic   9 Female 00:00:00  93
## 2  002 -1.38601723  FALSE            19    White  10   Male 00:00:00 121
## 3  003  0.79336594   TRUE            19    White   8   Male 00:00:00  75
## 4  004 -1.91950871   TRUE            23    White  10 Female 00:00:00  96
## 5  005 -0.72268477   TRUE            25    Black   9 Female 00:00:00 112
## 6  006 -0.04871286   TRUE            21    Black  14   Male 00:00:00 100
## 7  007 -0.25818600  FALSE            22    White  11   Male 00:00:00 100
## 8  008 -1.98591196   TRUE            24    White   8 Female 00:00:00  90
## 9  009 -1.09670674   TRUE            13    White  12   Male 00:00:00  94
## 10 010 -0.64859653  FALSE            17    White  13 Female 00:00:00  91
## .. ...         ...    ...           ...      ... ...    ...      ... ...
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
##    ID  Race Age    Sex     Hour  IQ Height  Died    Scoring Smoker
## 1  01 White  NA     NA 00:30:00 101     NA FALSE         NA     NA
## 2  02 White  NA     NA     <NA>  98     NA FALSE  2.3805960  FALSE
## 3  03    NA  20   Male 03:30:00  NA     70 FALSE  1.4607125  FALSE
## 4  04    NA  NA Female 04:00:00  NA     NA    NA  0.5639103     NA
## 5  05 White  29     NA 05:30:00  NA     64    NA -0.5047427     NA
## 6  06 White  21   Male 06:30:00  98     NA    NA -0.2023203  FALSE
## 7  07    NA  24     NA 06:30:00  NA     69    NA         NA   TRUE
## 8  08 Black  26 Female     <NA> 107     70    NA  1.5896542     NA
## 9  09 Black  25     NA     <NA>  96     NA  TRUE  0.8489005  FALSE
## 10 10    NA  NA Female     <NA> 107     68 FALSE  0.5900424     NA
## .. ..   ... ...    ...      ... ...    ...   ...        ...    ...
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
    r_series(likert, 5, name = "Item", integer = TRUE)
)
```

```
## Source: local data frame [100 x 8]
## 
##     ID Age    Sex Item_1 Item_2 Item_3 Item_4 Item_5
## 1  001  28   Male      4      4      1      1      1
## 2  002  24   Male      3      5      2      1      2
## 3  003  26   Male      2      3      2      1      2
## 4  004  31   Male      1      3      2      4      3
## 5  005  21 Female      5      1      1      5      4
## 6  006  23 Female      2      2      4      3      4
## 7  007  24 Female      2      5      1      5      2
## 8  008  24   Male      1      4      4      5      5
## 9  009  29 Female      4      5      5      4      3
## 10 010  26   Male      1      1      4      1      2
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


## Visualizing Column Types

It is helpful to see the column types and `NA`s as a visualization.  The `table_heat` (the `plot` method assigned to `tbl_df` as well).


```r
set.seed(10)

r_data_frame(n=100,
    id,
    dob,
    animal,
    grade, grade,
    death,
    dummy,
    grade_letter,
    gender,
    paragraph,
    sentence
) %>%
   r_na() %>%
   plot(palette = "Set1")
```

![plot of chunk unnamed-chunk-16](inst/figure/unnamed-chunk-16-1.png) 







