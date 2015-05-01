# wakefield





[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/trinker/wakefield.svg?branch=master)](https://travis-ci.org/trinker/wakefield)
[![Coverage Status](https://coveralls.io/repos/trinker/wakefield/badge.svg?branch=master)](https://coveralls.io/r/trinker/wakefield?branch=master)
[![DOI](https://zenodo.org/badge/5398/trinker/wakefield.svg)](http://dx.doi.org/10.5281/zenodo.17172)
<a href="https://img.shields.io/badge/Version-0.2.0-orange.svg"><img src="https://img.shields.io/badge/Version-0.2.0-orange.svg" alt="Version"/></a></p>

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
##  [1] White    White    White    Hispanic White    White    Hispanic
##  [8] White    Hispanic Other   
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
## 3     Asian
## 4     Black
## 5  Hispanic
## 6     Black
## 7     White
## 8     Black
## 9  Hispanic
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
## 1  001    Black  35   Male 00:00:00 110     71 FALSE
## 2  002    White  34 Female 00:00:00 108     65  TRUE
## 3  003 Hispanic  31   Male 00:00:00  94     69 FALSE
## 4  004    White  34 Female 00:00:00 100     69 FALSE
## 5  005    White  20   Male 00:00:00  97     72 FALSE
## 6  006    White  26   Male 00:00:00 100     69 FALSE
## 7  007    White  29   Male 00:00:00 113     68 FALSE
## 8  008    White  33 Female 00:00:00 122     69  TRUE
## 9  009    Asian  20   Male 00:00:00  98     76  TRUE
## 10 010    White  28   Male 00:00:00 100     68 FALSE
## .. ...      ... ...    ...      ... ...    ...   ...
```


There are 68 **wakefield** based variable functions to chose from, spanning **R**'s various data types (see `?variables` for details).  

<!-- html table generated in R 3.2.0 by xtable 1.7-4 package -->
<!-- Fri May 01 18:05:45 2015 -->
<table >
  <tr> <td> age </td> <td> died </td> <td> grade_level </td> <td> likert_5 </td> <td> paragraph </td> <td> speed_mph </td> </tr>
  <tr> <td> animal </td> <td> dna </td> <td> group </td> <td> likert_7 </td> <td> pet </td> <td> state </td> </tr>
  <tr> <td> answer </td> <td> dob </td> <td> hair </td> <td> lorem_ipsum </td> <td> political </td> <td> string </td> </tr>
  <tr> <td> area </td> <td> dummy </td> <td> height </td> <td> lower </td> <td> primary </td> <td> upper </td> </tr>
  <tr> <td> birth </td> <td> education </td> <td> height_cm </td> <td> lower_factor </td> <td> race </td> <td> upper_factor </td> </tr>
  <tr> <td> car </td> <td> ela </td> <td> height_in </td> <td> marital </td> <td> religion </td> <td> valid </td> </tr>
  <tr> <td> children </td> <td> employment </td> <td> income </td> <td> math </td> <td> sat </td> <td> year </td> </tr>
  <tr> <td> coin </td> <td> eye </td> <td> internet_browser </td> <td> military </td> <td> sentence </td> <td> zip_code </td> </tr>
  <tr> <td> color </td> <td> gender </td> <td> iq </td> <td> month </td> <td> sex </td> <td>  </td> </tr>
  <tr> <td> date_stamp </td> <td> gpa </td> <td> language </td> <td> name </td> <td> smokes </td> <td>  </td> </tr>
  <tr> <td> death </td> <td> grade </td> <td> level </td> <td> normal </td> <td> speed </td> <td>  </td> </tr>
  <tr> <td> dice </td> <td> grade_letter </td> <td> likert </td> <td> normal_round </td> <td> speed_kph </td> <td>  </td> </tr>
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
## 1  001 -1.2101789  FALSE    White  23   Male 00:00:00 109     70  TRUE
## 2  002 -0.9148525  FALSE Hispanic  22   Male 00:00:00  98     70 FALSE
## 3  003  0.4856936  FALSE    Black  31   Male 00:00:00 117     67  TRUE
## 4  004  2.3173641   TRUE    White  32 Female 00:00:00  87     72 FALSE
## 5  005 -0.3111088  FALSE    White  21 Female 00:00:00 106     73 FALSE
## 6  006 -0.4006510   TRUE    White  34 Female 00:00:00 102     71 FALSE
## 7  007 -1.9334710  FALSE    White  34 Female 00:00:00 102     71 FALSE
## 8  008  0.3164068  FALSE Hispanic  23   Male 00:00:00  90     64 FALSE
## 9  009 -2.0513460   TRUE Hispanic  34 Female 00:30:00 122     64 FALSE
## 10 010  1.9511124  FALSE    White  34   Male 00:30:00 105     72 FALSE
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
## 1  001    21    29    23    90.9    95.3    86.2
## 2  002    30    29    26    85.7    85.5    93.5
## 3  003    26    22    22    80.7    91.0    85.2
## 4  004    24    35    20    92.3    91.5    92.2
## 5  005    34    34    33    81.0    92.0    86.6
## 6  006    26    24    27    83.9    88.6    92.2
## 7  007    27    26    23    91.3    87.7    85.3
## 8  008    27    33    27    81.3    98.3    89.7
## 9  009    31    31    30    84.6    86.3    85.5
## 10 010    30    24    34    86.2    85.4    87.6
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
##     ID    Scoring Smoker Reading(mins)  Race Age    Sex     Hour  IQ
## 1  001  0.8251842  FALSE            20 White  11   Male 00:00:00 103
## 2  002 -1.4153667   TRUE            28 White   9   Male 00:00:00 103
## 3  003 -0.5910930   TRUE            27 White  10   Male 00:00:00  96
## 4  004 -0.3810551  FALSE            18 White  13   Male 00:00:00  90
## 5  005  0.8399505  FALSE            27 White   9 Female 00:00:00 105
## 6  006 -0.8188366  FALSE            17 White  13   Male 00:00:00  87
## 7  007  0.1606837   TRUE            18 White  11   Male 00:00:00 105
## 8  008 -0.6688201   TRUE            21 White  10   Male 00:00:00 107
## 9  009  1.3217210  FALSE            20 White   9   Male 00:00:00  96
## 10 010  1.1887887  FALSE            16 Black  13   Male 00:30:00  95
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
##    ID      Race Age    Sex     Hour  IQ Height  Died    Scoring Smoker
## 1  01     Black  NA     NA 02:00:00 103     NA FALSE         NA     NA
## 2  02     Asian  27     NA 02:30:00  97     NA    NA         NA  FALSE
## 3  03     White  22     NA 03:00:00 104     72    NA  0.1560873     NA
## 4  04  Hispanic  23 Female     <NA>  97     64 FALSE         NA   TRUE
## 5  05        NA  22 Female     <NA>  NA     NA    NA -0.8891561     NA
## 6  06     Black  28   Male     <NA>  62     63  TRUE  0.3475930     NA
## 7  07     White  20 Female 08:30:00  99     70 FALSE  0.2440901     NA
## 8  08        NA  NA Female     <NA>  NA     68    NA         NA   TRUE
## 9  09     White  23     NA     <NA>  NA     67 FALSE -0.3954766     NA
## 10 10 Bi-Racial  31   Male 12:00:00 101     NA    NA -0.2745892     NA
## .. ..       ... ...    ...      ... ...    ...   ...        ...    ...
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







