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
##  [1] Hispanic White    White    Asian    White    White    Asian   
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
## 1  Hispanic
## 2     White
## 3     White
## 4     White
## 5     White
## 6  Hispanic
## 7     White
## 8  Hispanic
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
## 1  001    White  30   Male 00:00:00  98     65  TRUE
## 2  002    White  20   Male 00:00:00  95     68 FALSE
## 3  003 Hispanic  26   Male 00:00:00  75     71  TRUE
## 4  004    White  26 Female 00:00:00  99     76  TRUE
## 5  005    White  26   Male 00:00:00 111     74  TRUE
## 6  006    White  30   Male 00:00:00  97     72  TRUE
## 7  007    White  26 Female 00:00:00 118     66 FALSE
## 8  008    White  24 Female 00:00:00  96     76  TRUE
## 9  009    White  28   Male 00:00:00  90     64 FALSE
## 10 010 Hispanic  23 Female 00:00:00  96     64  TRUE
## .. ...      ... ...    ...      ... ...    ...   ...
```


There are a plethora of **wakefield** based variable functions to chose from, spanning **R**'s various data types.

<!-- html table generated in R 3.2.0 by xtable 1.7-4 package -->
<!-- Sun Apr 26 16:59:36 2015 -->
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
##     ID    Scoring Smoker  Race Age    Sex     Hour  IQ Height  Died
## 1  001  0.1891545  FALSE Asian  31 Female 00:00:00  97     70 FALSE
## 2  002  0.3851468  FALSE Black  33   Male 00:00:00  80     72  TRUE
## 3  003 -0.6534012  FALSE White  25   Male 00:00:00  99     72  TRUE
## 4  004 -0.4856798  FALSE White  27   Male 00:00:00 102     67 FALSE
## 5  005 -1.6418871   TRUE White  23 Female 00:00:00  91     72  TRUE
## 6  006  0.9612601  FALSE White  25   Male 00:00:00  91     66 FALSE
## 7  007  0.6603719  FALSE White  22   Male 00:00:00 102     67  TRUE
## 8  008 -0.6095321  FALSE Black  25   Male 00:00:00 101     63  TRUE
## 9  009  0.7733652  FALSE White  31 Female 00:00:00  92     72 FALSE
## 10 010 -1.2910246   TRUE White  30   Male 00:00:00 101     69  TRUE
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
## 1  001    23    22    28    82.7    81.8    88.0
## 2  002    33    35    22    93.9    80.9    92.7
## 3  003    30    35    31    90.0    88.1    83.2
## 4  004    24    28    35    87.5    85.4    87.7
## 5  005    25    21    28    91.5    89.5    86.7
## 6  006    33    21    32    84.5    87.6    87.5
## 7  007    27    26    22    89.8    90.9    91.2
## 8  008    31    25    23    89.2    83.5    89.5
## 9  009    27    26    20    87.9    82.9    88.3
## 10 010    34    30    26    97.2    82.6    89.9
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
##     ID    Scoring Smoker Reading(mins)     Race Age    Sex     Hour  IQ
## 1  001  0.5685846  FALSE            21    Black  10   Male 00:00:00  76
## 2  002  0.3586643  FALSE            12    White  14   Male 00:00:00  96
## 3  003 -0.5459710   TRUE            19    Black  10 Female 00:00:00 108
## 4  004  1.1077876  FALSE            17    White  12   Male 00:00:00 103
## 5  005  0.1276507  FALSE            16 Hispanic  11   Male 00:00:00  91
## 6  006 -0.8870031   TRUE            20    White  11 Female 00:00:00  95
## 7  007  1.5667903  FALSE            12 Hispanic   8 Female 00:30:00  98
## 8  008 -0.3795139  FALSE            17    White  14   Male 00:30:00  99
## 9  009 -0.6366337  FALSE            23 Hispanic  13 Female 00:30:00 108
## 10 010  0.3814091  FALSE            19    White  10   Male 00:30:00  90
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
##    ID     Race Age    Sex     Hour  IQ Height  Died    Scoring Smoker
## 1  01    White  23 Female 00:00:00  NA     72 FALSE  0.2718548  FALSE
## 2  02    Black  23 Female 00:30:00 116     66 FALSE  1.5218870     NA
## 3  03    White  NA     NA     <NA>  NA     NA FALSE -0.3200526     NA
## 4  04 Hispanic  NA Female 02:30:00 105     68    NA -1.0484394     NA
## 5  05       NA  32   Male     <NA> 108     69 FALSE  0.3112662   TRUE
## 6  06    White  35   Male 04:00:00  99     75    NA  0.2034210     NA
## 7  07    Black  NA     NA     <NA>  99     69 FALSE         NA   TRUE
## 8  08    White  NA     NA     <NA> 111     67  TRUE         NA     NA
## 9  09       NA  34   Male     <NA>  89     NA FALSE         NA  FALSE
## 10 10    White  23   Male 09:00:00  98     NA FALSE  0.3988629   TRUE
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
   plot(palette = "Set1", flip = TRUE)
```

![plot of chunk unnamed-chunk-16](inst/figure/unnamed-chunk-16-1.png) 







