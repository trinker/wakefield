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
##  [1] Black White White White White White Asian White White White
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
##         Race
## 1   Hispanic
## 2   Hispanic
## 3      White
## 4      White
## 5      Black
## 6  Bi-Racial
## 7      Black
## 8      White
## 9      Black
## 10     Black
## ..       ...
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
##     ID      Race Age    Sex     Hour  IQ Height  Died
## 1  001     Black  35   Male 00:00:00 103     67  TRUE
## 2  002     White  28   Male 00:00:00  95     68  TRUE
## 3  003     White  35 Female 00:00:00 114     69 FALSE
## 4  004     Asian  30   Male 00:00:00 110     73  TRUE
## 5  005  Hispanic  28 Female 00:00:00 102     66 FALSE
## 6  006     White  35   Male 00:00:00  94     71  TRUE
## 7  007  Hispanic  26 Female 00:00:00  99     73  TRUE
## 8  008     Asian  24 Female 00:00:00  84     69  TRUE
## 9  009 Bi-Racial  23   Male 00:00:00 103     64  TRUE
## 10 010  Hispanic  24 Female 00:00:00  96     64  TRUE
## .. ...       ... ...    ...      ... ...    ...   ...
```


There are a plethora of **wakefield** based variable functions to chose from, spanning **R**'s various data types.

<!-- html table generated in R 3.2.0 by xtable 1.7-4 package -->
<!-- Sun Apr 26 22:06:47 2015 -->
<table >
  <tr> <td> age </td> <td> education </td> <td> likert </td> <td> sat </td> </tr>
  <tr> <td> animal </td> <td> employment </td> <td> likert_5 </td> <td> sentence </td> </tr>
  <tr> <td> answer </td> <td> eye </td> <td> likert_7 </td> <td> sex </td> </tr>
  <tr> <td> area </td> <td> gender </td> <td> lorem_ipsum </td> <td> smokes </td> </tr>
  <tr> <td> birth </td> <td> gpa </td> <td> lower </td> <td> speed </td> </tr>
  <tr> <td> car </td> <td> grade </td> <td> lower_factor </td> <td> speed_kph </td> </tr>
  <tr> <td> children </td> <td> grade_letter </td> <td> marital </td> <td> speed_mph </td> </tr>
  <tr> <td> coin </td> <td> group </td> <td> month </td> <td> state </td> </tr>
  <tr> <td> color </td> <td> hair </td> <td> name </td> <td> string </td> </tr>
  <tr> <td> date_stamp </td> <td> height </td> <td> normal </td> <td> upper </td> </tr>
  <tr> <td> death </td> <td> height_cm </td> <td> normal_round </td> <td> upper_factor </td> </tr>
  <tr> <td> dice </td> <td> height_in </td> <td> paragraph </td> <td> valid </td> </tr>
  <tr> <td> died </td> <td> income </td> <td> pet </td> <td> year </td> </tr>
  <tr> <td> dna </td> <td> iq </td> <td> political </td> <td> zip_code </td> </tr>
  <tr> <td> dob </td> <td> language </td> <td> primary </td> <td>  </td> </tr>
  <tr> <td> dummy </td> <td> level </td> <td> race </td> <td>  </td> </tr>
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
##     ID    Scoring Smoker     Race Age    Sex     Hour  IQ Height  Died
## 1  001  0.1758390   TRUE Hispanic  24 Female 00:00:00 122     74 FALSE
## 2  002 -0.3447366  FALSE Hispanic  33 Female 00:00:00 108     66  TRUE
## 3  003  0.4112003   TRUE    White  30   Male 00:00:00 103     70 FALSE
## 4  004 -1.6952804  FALSE    Black  32   Male 00:00:00 108     64 FALSE
## 5  005  1.8517177  FALSE    White  28 Female 00:00:00  94     70  TRUE
## 6  006  1.1468241   TRUE Hispanic  23   Male 00:00:00 102     61 FALSE
## 7  007 -1.2593107  FALSE    White  35 Female 00:00:00 110     74 FALSE
## 8  008 -0.2707683   TRUE    White  32   Male 00:00:00 103     68  TRUE
## 9  009 -0.4741670   TRUE    White  27 Female 00:00:00  97     72  TRUE
## 10 010 -0.9481985   TRUE    White  30   Male 00:00:00 117     69 FALSE
## .. ...        ...    ...      ... ...    ...      ... ...    ...   ...
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
## 1  001    31    28    35    87.8    89.5    84.6
## 2  002    32    35    27    86.4    90.9    86.7
## 3  003    22    27    28    81.3    82.3    87.1
## 4  004    25    32    26    86.9    87.8    90.5
## 5  005    22    34    30    85.1    89.3    83.9
## 6  006    21    28    32    86.3    88.3    90.2
## 7  007    34    23    27    92.0    83.5    87.0
## 8  008    30    32    29    89.8    80.9    81.9
## 9  009    32    30    23    92.5    87.1    91.0
## 10 010    32    23    25    82.9    89.9    88.0
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
## 1  001  0.45206456   TRUE            20 Hispanic  11   Male 00:00:00 117
## 2  002 -1.28557279   TRUE            23 Hispanic  14   Male 00:00:00  95
## 3  003 -0.90950684   TRUE            13    White  12 Female 00:00:00 113
## 4  004 -0.87285846   TRUE            21    White  12   Male 00:00:00  92
## 5  005 -0.00778454   TRUE            19    White   9 Female 00:00:00 105
## 6  006  2.19148069   TRUE            18    White  11 Female 00:00:00  97
## 7  007  1.06000873   TRUE            23    White  11 Female 00:00:00  99
## 8  008 -0.33097938   TRUE            16    White  11   Male 00:00:00  97
## 9  009  1.28338121  FALSE            19    Black  14 Female 00:00:00  84
## 10 010 -0.08329176   TRUE            17 Hispanic  11   Male 00:00:00  86
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
##    ID     Race Age    Sex     Hour  IQ Height  Died    Scoring Smoker
## 1  01    White  25     NA 01:00:00  97     62 FALSE         NA   TRUE
## 2  02    White  NA   Male 03:30:00  NA     64  TRUE         NA     NA
## 3  03 Hispanic  20 Female 04:30:00  NA     68 FALSE  0.3623621  FALSE
## 4  04 Hispanic  34   Male     <NA>  91     65 FALSE         NA   TRUE
## 5  05       NA  32   Male 08:30:00  NA     70 FALSE -1.5708863  FALSE
## 6  06    White  NA   Male     <NA> 109     62 FALSE -1.0985048  FALSE
## 7  07       NA  35 Female 09:30:00 116     NA FALSE  1.4862311     NA
## 8  08       NA  NA Female 09:30:00  81     NA  TRUE         NA     NA
## 9  09    White  NA     NA     <NA>  NA     65  TRUE         NA   TRUE
## 10 10    White  26   Male 11:30:00  NA     NA  TRUE  0.7506856     NA
## .. ..      ... ...    ...      ... ...    ...   ...        ...    ...
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







