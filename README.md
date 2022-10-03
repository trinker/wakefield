wakefield
================

<!-- badges: start -->

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/0.1.0/active.svg)](https://www.repostatus.org/#active)
[![R-CMD-check](https://github.com/trinker/wakefield/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/trinker/wakefield/actions/workflows/R-CMD-check.yaml)
[![Coverage
Status](https://s3.amazonaws.com/assets.coveralls.io/badges/coveralls_0.svg)](https://coveralls.io/github/trinker/wakefield)
[![DOI](https://zenodo.org/badge/5398/trinker/wakefield.svg)](https://dx.doi.org/10.5281/zenodo.17172)
[![](https://cranlogs.r-pkg.org/badges/wakefield)](https://cran.r-project.org/package=wakefield)

<!-- badges: end -->

**wakefield** is designed to quickly generate random data sets. The user
passes `n` (number of rows) and predefined vectors to the `r_data_frame`
function to produce a `dplyr::tbl_df` object.

![](tools/wakefield_logo/r_wakefield.png)

# Installation

To download the development version of **wakefield**:

Download the [zip
ball](https://github.com/trinker/wakefield/zipball/master) or [tar
ball](https://github.com/trinker/wakefield/tarball/master), decompress
and run `R CMD INSTALL` on it, or use the **pacman** package to install
the development version:

``` r
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh("trinker/wakefield")
pacman::p_load(dplyr, tidyr, ggplot2)
```

# Contact

You are welcome to:

- submit suggestions and bug-reports at:
  <https://github.com/trinker/wakefield/issues>
- send a pull request on: <https://github.com/trinker/wakefield/>
- compose a friendly e-mail to: <tyler.rinker@gmail.com>

# Demonstration

## Getting Started

The `r_data_frame` function (random data frame) takes `n` (the number of
rows) and any number of variables (columns). These columns are typically
produced from a **wakefield** variable function. Each of these variable
functions has a pre-set behavior that produces a named vector of n
length, allowing the user to lazily pass unnamed functions (optionally,
without call parenthesis). The column name is hidden as a `varname`
attribute. For example here we see the `race` variable function:

``` r
race(n=10)
```

    ##  [1] Black    White    Hispanic White    White    White    Hispanic White   
    ##  [9] Hispanic Hispanic
    ## Levels: White Hispanic Black Asian Bi-Racial Native Other Hawaiian

``` r
attributes(race(n=10))
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

When this variable is used inside of `r_data_frame` the `varname` is
used as a column name. Additionally, the `n` argument is not set within
variable functions but is set once in `r_data_frame`:

``` r
r_data_frame(
    n = 500,
    race
)
```

    ## Warning: `tbl_df()` was deprecated in dplyr 1.0.0.
    ## Please use `tibble::as_tibble()` instead.
    ## ℹ The deprecated feature was likely used in the wakefield package.
    ##   Please report the issue at <]8;;https://github.com/trinker/wakefield/issueshttps://github.com/trinker/wakefield/issues]8;;>.

    ## # A tibble: 500 × 1
    ##    Race     
    ##    <fct>    
    ##  1 White    
    ##  2 White    
    ##  3 White    
    ##  4 White    
    ##  5 Asian    
    ##  6 Bi-Racial
    ##  7 Black    
    ##  8 White    
    ##  9 White    
    ## 10 White    
    ## # … with 490 more rows

The power of `r_data_frame` is apparent when we use many modular
variable functions:

``` r
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

    ## # A tibble: 500 × 8
    ##    ID    Race       Age Sex    Hour        IQ Height Died 
    ##    <chr> <fct>    <int> <fct>  <times>  <dbl>  <dbl> <lgl>
    ##  1 001   Asian       27 Female 00:00:00    94     73 FALSE
    ##  2 002   White       45 Male   00:00:00    87     76 FALSE
    ##  3 003   White       24 Female 00:00:00   107     73 FALSE
    ##  4 004   Hispanic    48 Male   00:00:00   100     79 TRUE 
    ##  5 005   Black       49 Male   00:00:00    84     65 FALSE
    ##  6 006   Black       48 Male   00:00:00    90     66 TRUE 
    ##  7 007   White       35 Female 00:00:00   107     62 TRUE 
    ##  8 008   White       62 Female 00:00:00   104     61 FALSE
    ##  9 009   Hispanic    72 Female 00:00:00   117     71 FALSE
    ## 10 010   White       72 Male   00:30:00    89     73 TRUE 
    ## # … with 490 more rows

There are 49 **wakefield** based variable functions to chose from,
spanning **R**’s various data types (see `?variables` for details).

<!-- html table generated in R 4.2.1 by xtable 1.8-4 package -->
<!-- Mon Oct  3 11:29:29 2022 -->
<table>
<tr>
<td>
age
</td>
<td>
dice
</td>
<td>
hair
</td>
<td>
military
</td>
<td>
sex_inclusive
</td>
</tr>
<tr>
<td>
animal
</td>
<td>
dna
</td>
<td>
height
</td>
<td>
month
</td>
<td>
smokes
</td>
</tr>
<tr>
<td>
answer
</td>
<td>
dob
</td>
<td>
income
</td>
<td>
name
</td>
<td>
speed
</td>
</tr>
<tr>
<td>
area
</td>
<td>
dummy
</td>
<td>
internet_browser
</td>
<td>
normal
</td>
<td>
state
</td>
</tr>
<tr>
<td>
car
</td>
<td>
education
</td>
<td>
iq
</td>
<td>
political
</td>
<td>
string
</td>
</tr>
<tr>
<td>
children
</td>
<td>
employment
</td>
<td>
language
</td>
<td>
race
</td>
<td>
upper
</td>
</tr>
<tr>
<td>
coin
</td>
<td>
eye
</td>
<td>
level
</td>
<td>
religion
</td>
<td>
valid
</td>
</tr>
<tr>
<td>
color
</td>
<td>
grade
</td>
<td>
likert
</td>
<td>
sat
</td>
<td>
year
</td>
</tr>
<tr>
<td>
date_stamp
</td>
<td>
grade_level
</td>
<td>
lorem_ipsum
</td>
<td>
sentence
</td>
<td>
zip_code
</td>
</tr>
<tr>
<td>
death
</td>
<td>
group
</td>
<td>
marital
</td>
<td>
sex
</td>
<td>
</td>
</tr>
</table>
<p class="caption">
<b><em>Available Variable Functions</em></b>
</p>

However, the user may also pass their own vector producing functions or
vectors to `r_data_frame`. Those with an `n` argument can be set by
`r_data_frame`:

``` r
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

    ## # A tibble: 500 × 10
    ##    ID    Scoring Smoker Race       Age Sex    Hour        IQ Height Died 
    ##    <chr>   <dbl> <lgl>  <fct>    <int> <fct>  <times>  <dbl>  <dbl> <lgl>
    ##  1 001    1.97   FALSE  Hispanic    51 Male   00:00:00   104     63 FALSE
    ##  2 002    0.548  FALSE  White       57 Female 00:00:00   101     74 FALSE
    ##  3 003    0.0675 FALSE  Asian       67 Female 00:00:00   105     68 FALSE
    ##  4 004    0.470  TRUE   Black       64 Female 00:00:00   108     67 FALSE
    ##  5 005    1.23   FALSE  White       72 Male   00:00:00    84     61 TRUE 
    ##  6 006    0.622  TRUE   Hispanic    39 Male   00:00:00   105     67 FALSE
    ##  7 007   -2.06   FALSE  Hispanic    48 Male   00:00:00   103     69 TRUE 
    ##  8 008   -1.03   TRUE   White       53 Female 00:00:00   119     72 FALSE
    ##  9 009   -0.940  TRUE   White       88 Female 00:00:00    95     70 FALSE
    ## 10 010    0.499  FALSE  White       69 Male   00:00:00   104     70 TRUE 
    ## # … with 490 more rows

``` r
r_data_frame(
    n = 500,
    id,
    age, age, age,
    grade, grade, grade
)
```

    ## # A tibble: 500 × 7
    ##    ID    Age_1 Age_2 Age_3 Grade_1 Grade_2 Grade_3
    ##    <chr> <int> <int> <int>   <dbl>   <dbl>   <dbl>
    ##  1 001      35    87    89    91.1    84.5    92.1
    ##  2 002      85    80    20    86.6    91.7    81.2
    ##  3 003      35    69    47    87.5    90.3    83.9
    ##  4 004      38    24    89    84.1    89.5    89.3
    ##  5 005      82    84    64    85.6    90.7    85.4
    ##  6 006      59    78    86    87      90.2    93.2
    ##  7 007      66    85    36    89      84.1    88.1
    ##  8 008      32    34    70    89.4    95.1    89.4
    ##  9 009      63    56    54    84.8    89.8    89.9
    ## 10 010      33    86    69    86.4    84.8    85.5
    ## # … with 490 more rows

While passing variable functions to `r_data_frame` without call
parenthesis is handy, the user may wish to set arguments. This can be
done through call parenthesis as we do with `data.frame` or
`dplyr::data_frame`:

``` r
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

    ## # A tibble: 500 × 11
    ##    ID    Scoring Smoker Reading(min…¹ Race    Age Sex   Hour     IQ Height Died 
    ##    <chr>   <dbl> <lgl>          <int> <fct> <int> <fct> <tim> <dbl>  <dbl> <lgl>
    ##  1 001   -1.85   TRUE              22 White     8 Male  00:0…   104     41 FALSE
    ##  2 002    1.13   TRUE              21 White    14 Male  00:0…   109     42 TRUE 
    ##  3 003   -0.554  FALSE             30 White    13 Fema… 00:0…   116     49 TRUE 
    ##  4 004    1.47   TRUE              24 Black    14 Fema… 00:0…   109     44 TRUE 
    ##  5 005    0.407  TRUE              18 White    13 Fema… 00:0…   105     47 FALSE
    ##  6 006   -0.0635 TRUE              20 Hisp…     8 Fema… 00:0…   102     59 FALSE
    ##  7 007    0.740  TRUE              22 Asian    13 Fema… 00:0…    96     57 FALSE
    ##  8 008    1.59   TRUE              10 White     9 Fema… 00:3…   108     43 FALSE
    ##  9 009    1.95   FALSE             13 White     9 Fema… 00:3…    75     50 TRUE 
    ## 10 010   -0.206  FALSE             17 White    10 Male  00:3…   104     48 FALSE
    ## # … with 490 more rows, and abbreviated variable name ¹​`Reading(mins)`

## Random Missing Observations

Often data contains missing values. **wakefield** allows the user to add
a proportion of missing values per column/vector via the `r_na` (random
`NA`). This works nicely within a **dplyr**/**magrittr** `%>%` *then*
pipeline:

``` r
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

    ## # A tibble: 30 × 10
    ##    ID    Race    Age Sex    Hour        IQ Height Died  Scoring Smoker
    ##    <chr> <fct> <int> <fct>  <times>  <dbl>  <dbl> <lgl>   <dbl> <lgl> 
    ##  1 01    Black    75 <NA>   02:30:00   106     70 TRUE   NA     NA    
    ##  2 02    White    NA <NA>   <NA>        NA     71 FALSE  -0.236 FALSE 
    ##  3 03    White    29 <NA>   <NA>       123     65 NA     NA     FALSE 
    ##  4 04    Black    56 Female 07:00:00   105     65 FALSE  -0.210 TRUE  
    ##  5 05    <NA>     NA Male   <NA>        99     68 FALSE  NA     FALSE 
    ##  6 06    White    88 <NA>   08:00:00    NA     NA FALSE   0.509 FALSE 
    ##  7 07    White    19 Female 08:00:00    NA     69 TRUE    0.124 FALSE 
    ##  8 08    White    NA <NA>   08:00:00   107     63 FALSE  -1.51  FALSE 
    ##  9 09    <NA>     25 Female 09:00:00   102     NA TRUE   NA     TRUE  
    ## 10 10    <NA>     58 Male   <NA>        96     75 TRUE   -0.465 NA    
    ## # … with 20 more rows

## Repeated Measures & Time Series

The `r_series` function allows the user to pass a single **wakefield**
function and dictate how many columns (`j`) to produce.

``` r
set.seed(10)

r_series(likert, j = 3, n=10)
```

    ## # A tibble: 10 × 3
    ##    Likert_1          Likert_2          Likert_3         
    ##  * <ord>             <ord>             <ord>            
    ##  1 Neutral           Agree             Agree            
    ##  2 Strongly Agree    Strongly Disagree Strongly Agree   
    ##  3 Agree             Strongly Disagree Agree            
    ##  4 Disagree          Strongly Disagree Agree            
    ##  5 Neutral           Strongly Agree    Strongly Agree   
    ##  6 Agree             Disagree          Disagree         
    ##  7 Agree             Agree             Strongly Disagree
    ##  8 Agree             Strongly Disagree Agree            
    ##  9 Strongly Disagree Agree             Neutral          
    ## 10 Neutral           Strongly Disagree Neutral

Often the user wants a numeric score for Likert type columns and similar
variables. For series with multiple factors the `as_integer` converts
all columns to integer values. Additionally, we may want to specify
column name prefixes. This can be accomplished via the variable
function’s `name` argument. Both of these features are demonstrated
here.

``` r
set.seed(10)

as_integer(r_series(likert, j = 5, n=10, name = "Item"))
```

    ## # A tibble: 10 × 5
    ##    Item_1 Item_2 Item_3 Item_4 Item_5
    ##     <int>  <int>  <int>  <int>  <int>
    ##  1      3      4      4      4      5
    ##  2      5      1      5      3      1
    ##  3      4      1      4      5      4
    ##  4      2      1      4      4      5
    ##  5      3      5      5      2      5
    ##  6      4      2      2      3      4
    ##  7      4      4      1      4      1
    ##  8      4      1      4      1      2
    ##  9      1      4      3      5      3
    ## 10      3      1      3      5      5

`r_series` can be used within a `r_data_frame` as well.

``` r
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    sex,
    r_series(likert, 3, name = "Question")
)
```

    ## # A tibble: 100 × 6
    ##    ID      Age Sex    Question_1        Question_2        Question_3       
    ##    <chr> <int> <fct>  <ord>             <ord>             <ord>            
    ##  1 001      26 Male   Strongly Agree    Disagree          Disagree         
    ##  2 002      72 Male   Disagree          Agree             Strongly Disagree
    ##  3 003      89 Male   Strongly Disagree Strongly Disagree Strongly Agree   
    ##  4 004      71 Female Agree             Strongly Agree    Disagree         
    ##  5 005      56 Female Strongly Disagree Disagree          Neutral          
    ##  6 006      32 Female Strongly Disagree Strongly Agree    Disagree         
    ##  7 007      32 Female Strongly Disagree Strongly Agree    Strongly Disagree
    ##  8 008      59 Female Neutral           Strongly Agree    Strongly Disagree
    ##  9 009      88 Male   Agree             Agree             Agree            
    ## 10 010      51 Male   Agree             Disagree          Neutral          
    ## # … with 90 more rows

``` r
set.seed(10)

r_data_frame(n=100,
    id,
    age,
    sex,
    r_series(likert, 5, name = "Item", integer = TRUE)
)
```

    ## # A tibble: 100 × 8
    ##    ID      Age Sex    Item_1 Item_2 Item_3 Item_4 Item_5
    ##    <chr> <int> <fct>   <int>  <int>  <int>  <int>  <int>
    ##  1 001      26 Male        5      2      2      4      5
    ##  2 002      72 Male        2      4      1      4      3
    ##  3 003      89 Male        1      1      5      4      4
    ##  4 004      71 Female      4      5      2      1      2
    ##  5 005      56 Female      1      2      3      3      2
    ##  6 006      32 Female      1      5      2      5      1
    ##  7 007      32 Female      1      5      1      1      5
    ##  8 008      59 Female      3      5      1      4      1
    ##  9 009      88 Male        4      4      4      3      2
    ## 10 010      51 Male        4      2      3      1      3
    ## # … with 90 more rows

### Related Series

The user can also create related series via the `relate` argument in
`r_series`. It allows the user to specify the relationship between
columns. `relate` may be a named list of or a short hand string of the
form of `"fM_sd"` where:

- `f` is one of (+, -, \*, /)
- `M` is a mean value
- `sd` is a standard deviation of the mean value

For example you may use `relate = "*4_1"`. If `relate = NULL` no
relationship is generated between columns. I will use the short hand
string form here.

#### Some Examples With Variation

``` r
r_series(grade, j = 5, n = 100, relate = "+1_6")
```

    ## # A tibble: 100 × 5
    ##    Grade_1    Grade_2    Grade_3    Grade_4    Grade_5   
    ##  * <variable> <variable> <variable> <variable> <variable>
    ##  1 90.0       98.7        98.6      104.6      114.1     
    ##  2 96.3       97.9        98.4      102.7      103.9     
    ##  3 96.6       92.6        94.9       92.7       98.8     
    ##  4 84.5       89.5        81.9       87.4       83.4     
    ##  5 86.8       84.1        82.2       82.8       94.0     
    ##  6 82.1       77.9        74.3       76.4       73.0     
    ##  7 90.9       96.1       107.5      120.2      126.8     
    ##  8 86.7       88.6        90.3       89.0       83.8     
    ##  9 86.1       84.1        88.9       90.1       72.6     
    ## 10 86.4       92.3        88.5       94.6       99.0     
    ## # … with 90 more rows

``` r
r_series(age, 5, 100, relate = "+5_0")
```

    ## # A tibble: 100 × 5
    ##    Age_1      Age_2      Age_3      Age_4      Age_5     
    ##  * <variable> <variable> <variable> <variable> <variable>
    ##  1 83         88         93         98         103       
    ##  2 48         53         58         63          68       
    ##  3 80         85         90         95         100       
    ##  4 46         51         56         61          66       
    ##  5 33         38         43         48          53       
    ##  6 53         58         63         68          73       
    ##  7 34         39         44         49          54       
    ##  8 31         36         41         46          51       
    ##  9 81         86         91         96         101       
    ## 10 50         55         60         65          70       
    ## # … with 90 more rows

``` r
r_series(likert, 5,  100, name ="Item", relate = "-.5_.1")
```

    ## # A tibble: 100 × 5
    ##    Item_1 Item_2 Item_3 Item_4 Item_5
    ##  *  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
    ##  1      1      0     -1     -1     -2
    ##  2      3      3      2      2      2
    ##  3      4      3      3      3      3
    ##  4      3      2      1      0      0
    ##  5      3      3      3      3      3
    ##  6      5      4      3      2      1
    ##  7      4      3      2      1      1
    ##  8      1      0     -1     -2     -2
    ##  9      3      2      1      1      1
    ## 10      1      0      0     -1     -2
    ## # … with 90 more rows

``` r
r_series(grade, j = 5, n = 100, relate = "*1.05_.1")
```

    ## # A tibble: 100 × 5
    ##    Grade_1    Grade_2    Grade_3    Grade_4    Grade_5   
    ##  * <variable> <variable> <variable> <variable> <variable>
    ##  1 90.8       90.80       99.880    109.8680   109.8680  
    ##  2 89.8       80.82       80.820     64.6560    58.1904  
    ##  3 90.3       99.33      109.263    109.2630    98.3367  
    ##  4 95.2       76.16       91.392     91.3920   100.5312  
    ##  5 89.1       98.01      117.612    105.8508   105.8508  
    ##  6 86.8       95.48       95.480    114.5760   160.4064  
    ##  7 93.4       93.40       93.400    102.7400   123.2880  
    ##  8 92.7       83.43       91.773    110.1276   121.1404  
    ##  9 84.9       93.39       93.390    102.7290   113.0019  
    ## 10 84.7       84.70       93.170     93.1700   111.8040  
    ## # … with 90 more rows

#### Adjust Correlations

Use the `sd` command to adjust correlations.

``` r
round(cor(r_series(grade, 8, 10, relate = "+1_2")), 2)
```

    ##         Grade_1 Grade_2 Grade_3 Grade_4 Grade_5 Grade_6 Grade_7 Grade_8
    ## Grade_1    1.00    0.84    0.57    0.41    0.31    0.30    0.16    0.15
    ## Grade_2    0.84    1.00    0.86    0.73    0.71    0.70    0.52    0.50
    ## Grade_3    0.57    0.86    1.00    0.93    0.92    0.90    0.77    0.71
    ## Grade_4    0.41    0.73    0.93    1.00    0.93    0.89    0.76    0.66
    ## Grade_5    0.31    0.71    0.92    0.93    1.00    0.93    0.83    0.79
    ## Grade_6    0.30    0.70    0.90    0.89    0.93    1.00    0.93    0.92
    ## Grade_7    0.16    0.52    0.77    0.76    0.83    0.93    1.00    0.95
    ## Grade_8    0.15    0.50    0.71    0.66    0.79    0.92    0.95    1.00

``` r
round(cor(r_series(grade, 8, 10, relate = "+1_0")), 2)
```

    ##         Grade_1 Grade_2 Grade_3 Grade_4 Grade_5 Grade_6 Grade_7 Grade_8
    ## Grade_1       1       1       1       1       1       1       1       1
    ## Grade_2       1       1       1       1       1       1       1       1
    ## Grade_3       1       1       1       1       1       1       1       1
    ## Grade_4       1       1       1       1       1       1       1       1
    ## Grade_5       1       1       1       1       1       1       1       1
    ## Grade_6       1       1       1       1       1       1       1       1
    ## Grade_7       1       1       1       1       1       1       1       1
    ## Grade_8       1       1       1       1       1       1       1       1

``` r
round(cor(r_series(grade, 8, 10, relate = "+1_20")), 2)
```

    ##         Grade_1 Grade_2 Grade_3 Grade_4 Grade_5 Grade_6 Grade_7 Grade_8
    ## Grade_1    1.00   -0.11    0.14   -0.21   -0.42   -0.29   -0.30   -0.27
    ## Grade_2   -0.11    1.00    0.49    0.44    0.18    0.24    0.23    0.51
    ## Grade_3    0.14    0.49    1.00    0.86    0.48    0.59    0.70    0.81
    ## Grade_4   -0.21    0.44    0.86    1.00    0.63    0.76    0.76    0.87
    ## Grade_5   -0.42    0.18    0.48    0.63    1.00    0.92    0.85    0.79
    ## Grade_6   -0.29    0.24    0.59    0.76    0.92    1.00    0.91    0.89
    ## Grade_7   -0.30    0.23    0.70    0.76    0.85    0.91    1.00    0.93
    ## Grade_8   -0.27    0.51    0.81    0.87    0.79    0.89    0.93    1.00

``` r
round(cor(r_series(grade, 8, 10, relate = "+15_20")), 2)
```

    ##         Grade_1 Grade_2 Grade_3 Grade_4 Grade_5 Grade_6 Grade_7 Grade_8
    ## Grade_1    1.00    0.48    0.47    0.63    0.58    0.66    0.35    0.18
    ## Grade_2    0.48    1.00    0.90    0.87    0.54    0.43    0.67    0.23
    ## Grade_3    0.47    0.90    1.00    0.81    0.63    0.53    0.74    0.30
    ## Grade_4    0.63    0.87    0.81    1.00    0.75    0.72    0.71    0.47
    ## Grade_5    0.58    0.54    0.63    0.75    1.00    0.88    0.57    0.42
    ## Grade_6    0.66    0.43    0.53    0.72    0.88    1.00    0.68    0.54
    ## Grade_7    0.35    0.67    0.74    0.71    0.57    0.68    1.00    0.77
    ## Grade_8    0.18    0.23    0.30    0.47    0.42    0.54    0.77    1.00

#### Visualize the Relationship

``` r
dat <- r_data_frame(12,
    name,
    r_series(grade, 100, relate = "+1_6")
) 

dat %>%
    gather(Time, Grade, -c(Name)) %>%
    mutate(Time = as.numeric(gsub("\\D", "", Time))) %>%
    ggplot(aes(x = Time, y = Grade, color = Name, group = Name)) +
        geom_line(size=.8) + 
        theme_bw()
```

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## Please use `linewidth` instead.
    ## ℹ The deprecated feature was likely used in the ggplot2 package.
    ##   Please report the issue at <]8;;https://github.com/tidyverse/ggplot2/issueshttps://github.com/tidyverse/ggplot2/issues]8;;>.

    ## Warning in panel_params$guide: partial match of 'guide' to 'guides'

![](tools/figure/unnamed-chunk-17-1.png)<!-- -->

## Expanded Dummy Coding

The user may wish to expand a `factor` into `j` dummy coded columns. The
`r_dummy` function expands a factor into `j` columns and works similar
to the `r_series` function. The user may wish to use the original factor
name as the prefix to the `j` columns. Setting `prefix = TRUE` within
`r_dummy` accomplishes this.

``` r
set.seed(10)
r_data_frame(n=100,
    id,
    age,
    r_dummy(sex, prefix = TRUE),
    r_dummy(political)
)
```

    ## # A tibble: 100 × 8
    ##    ID      Age Sex_Male Sex_Female Democrat Republican Libertarian Green
    ##    <chr> <int>    <int>      <int>    <int>      <int>       <int> <int>
    ##  1 001      26        1          0        0          0           1     0
    ##  2 002      72        1          0        1          0           0     0
    ##  3 003      89        1          0        0          1           0     0
    ##  4 004      71        0          1        1          0           0     0
    ##  5 005      56        0          1        0          1           0     0
    ##  6 006      32        0          1        0          1           0     0
    ##  7 007      32        0          1        1          0           0     0
    ##  8 008      59        0          1        0          1           0     0
    ##  9 009      88        1          0        0          1           0     0
    ## 10 010      51        1          0        0          1           0     0
    ## # … with 90 more rows

## Visualizing Column Types

It is helpful to see the column types and `NA`s as a visualization. The
`table_heat` (also the `plot` method assigned to `tbl_df` as well) can
provide visual glimpse of data types and missing cells.

``` r
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

    ## Warning in seq.Date(start, length = k, by = by): partial argument match of
    ## 'length' to 'length.out'
