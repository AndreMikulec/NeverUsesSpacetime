
This is a working example of the issue:

Also defined by ‘spacetime’ Found more than one class "xts" in cache; using the first, from namespace 'quantmod' #35

https://github.com/edzer/spacetime/issues/35

For *my work* . . .

1. I must have package xts directly on the search() path.  I call xts functions without "::"
2. I must use the package DMwR (that imports quantmod that requires xts). I call "DMwR::function."


The critical point is (2.)
If from DESCRIPTION, I *remove*
```
Imports:
    DMwR
```
then the message
```
Also defined by ‘spacetime’ Found more than one class "xts" in cache; using the first, from namespace 'quantmod'
```
is no longer there.

But,  for *my work* I still need (1.) and (2.).
Therefore, in the DESCRIPTION, I still need . . .
```
Depends:
    xts
Imports:
    DMwR
```

Working example . . .
```r
setwd("./NeverUsesSpacetime")
devtools::document(roclets=c('rd', 'collate', 'namespace'))
devtools::load_all(".")
Run()
```
Output
```
Found more than one class "xts" in cache; using the first, from namespace 'quantmod'
Also defined by 'spacetime'
Found more than one class "xts" in cache; using the first, from namespace 'quantmod'
Also defined by 'spacetime'
Formal class 'classRepresentation' [package "methods"] with 11 slots
  ..@ slots     :List of 1
  .. ..$ .S3Class: chr "character"
  .. .. ..- attr(*, "package")= chr "methods"
  ..@ contains  :List of 2
  .. ..$ oldClass:Formal class 'SClassExtension' [package "methods"] with 10 slots
  .. .. .. ..@ subClass  : chr "xts"
  .. .. .. ..@ superClass: chr "oldClass"
  .. .. .. ..@ package   : chr "quantmod"
  .. .. .. ..@ coerce    :function (from, strict = TRUE)
  .. .. .. ..@ test      :function (object)
  .. .. .. ..@ replace   :function (from, to, value)
  .. .. .. ..@ simple    : logi TRUE
  .. .. .. ..@ by        : chr(0)
  .. .. .. ..@ dataPart  : logi FALSE
  .. .. .. ..@ distance  : num 1
  .. ..$ xtsORzoo:Formal class 'SClassExtension' [package "methods"] with 10 slots
  .. .. .. ..@ subClass  : chr "xts"
  .. .. .. ..@ superClass: chr "xtsORzoo"
  .. .. .. ..@ package   : chr "quantmod"
  .. .. .. ..@ coerce    :function (from, strict = TRUE)
  .. .. .. ..@ test      :function (object)
  .. .. .. ..@ replace   :function (from, to, value)
  .. .. .. ..@ simple    : logi TRUE
  .. .. .. ..@ by        : chr(0)
  .. .. .. ..@ dataPart  : logi FALSE
  .. .. .. ..@ distance  : num 1
  ..@ virtual   : logi TRUE
  ..@ prototype :Error in object[seq_len(ile)] : object of type 'S4' is not subsettable
```
```r
options(width=100)
devtools::session_info()
```
Output
```
- Session info -----------------------------------------------------------------------------------
 setting  value
 version  R version 3.5.3 (2019-03-11)
 os       Windows 10 x64
 system   x86_64, mingw32
 ui       RTerm
 language (EN)
 collate  English_United States.1252
 ctype    English_United States.1252
 tz       America/Chicago
 date     2019-04-13

- Packages ---------------------------------------------------------------------------------------
 ! package              * version  date       lib source
   abind                  1.4-5    2016-07-21 [1] CRAN (R 3.5.2)
   assertthat             0.2.1    2019-03-21 [1] CRAN (R 3.5.3)
   backports              1.1.4    2019-04-10 [1] CRAN (R 3.5.3)
   bitops                 1.0-6    2013-08-17 [1] CRAN (R 3.5.0)
   callr                  3.2.0    2019-03-15 [1] CRAN (R 3.5.3)
   caTools                1.17.1.2 2019-03-06 [1] CRAN (R 3.5.2)
   class                  7.3-15   2019-01-01 [2] CRAN (R 3.5.3)
   cli                    1.1.0    2019-03-19 [1] CRAN (R 3.5.3)
   codetools              0.2-16   2018-12-24 [2] CRAN (R 3.5.3)
   commonmark             1.7      2018-12-01 [1] CRAN (R 3.5.1)
   crayon                 1.3.4    2017-09-16 [1] CRAN (R 3.5.0)
   curl                   3.3      2019-01-10 [1] CRAN (R 3.5.2)
   desc                   1.2.0    2018-05-01 [1] CRAN (R 3.5.1)
   devtools               2.0.2    2019-04-08 [1] CRAN (R 3.5.3)
   digest                 0.6.18   2018-10-10 [1] CRAN (R 3.5.1)
   DMwR                   0.4.1    2013-08-08 [1] CRAN (R 3.5.2)
   doParallel             1.0.14   2018-09-24 [1] CRAN (R 3.5.1)
   foreach                1.4.4    2017-12-12 [1] CRAN (R 3.5.0)
   fs                     1.2.7    2019-03-19 [1] CRAN (R 3.5.3)
   gdata                  2.18.0   2017-06-06 [1] CRAN (R 3.5.0)
   glue                   1.3.1    2019-03-12 [1] CRAN (R 3.5.3)
   gplots                 3.0.1.1  2019-01-27 [1] CRAN (R 3.5.2)
   gtools                 3.8.1    2018-06-26 [1] CRAN (R 3.5.0)
   intervals              0.15.1   2015-08-27 [1] CRAN (R 3.5.0)
   iterators              1.0.10   2018-07-13 [1] CRAN (R 3.5.1)
   KernSmooth             2.23-15  2015-06-29 [2] CRAN (R 3.5.3)
   lattice                0.20-38  2018-11-04 [2] CRAN (R 3.5.3)
   magrittr             * 1.5      2014-11-22 [1] CRAN (R 3.5.1)
   memoise                1.1.0    2017-04-21 [1] CRAN (R 3.5.0)
 R NeverUsesSpacetime   * 0.1.0    <NA>       [?] <NA>
   PerformanceAnalytics   1.5.2    2018-03-02 [1] CRAN (R 3.5.1)
   pkgbuild               1.0.3    2019-03-20 [1] CRAN (R 3.5.3)
   pkgload                1.0.2    2018-10-29 [1] CRAN (R 3.5.1)
   prettyunits            1.0.2    2015-07-13 [1] CRAN (R 3.5.0)
   processx               3.3.0    2019-03-10 [1] CRAN (R 3.5.3)
   ps                     1.3.0    2018-12-21 [1] CRAN (R 3.5.1)
   purrr                  0.3.2    2019-03-15 [1] CRAN (R 3.5.3)
   quadprog               1.5-5    2013-04-17 [1] CRAN (R 3.5.0)
   quantmod               0.4-14   2019-03-24 [1] CRAN (R 3.5.3)
   R6                     2.4.0    2019-02-14 [1] CRAN (R 3.5.2)
   Rcpp                   1.0.1    2019-03-17 [1] CRAN (R 3.5.3)
   remotes                2.0.4    2019-04-10 [1] CRAN (R 3.5.3)
   rlang                  0.3.4    2019-04-07 [1] CRAN (R 3.5.3)
   ROCR                   1.0-7    2015-03-26 [1] CRAN (R 3.5.0)
   roxygen2               6.1.1    2018-11-07 [1] CRAN (R 3.5.1)
   rpart                  4.1-13   2018-02-23 [1] CRAN (R 3.5.3)
   rprojroot              1.3-2    2018-01-03 [1] CRAN (R 3.5.0)
   rstudioapi             0.10     2019-03-19 [1] CRAN (R 3.5.3)
   sessioninfo            1.1.1    2018-11-05 [1] CRAN (R 3.5.1)
   sp                     1.3-1    2018-06-05 [1] CRAN (R 3.5.0)
   spacetime              1.2-2    2019-04-13 [1] Github (edzer/spacetime@a66e8a7)
   stringi                1.4.3    2019-03-12 [1] CRAN (R 3.5.3)
   stringr                1.4.0    2019-02-10 [1] CRAN (R 3.5.2)
   testthat               2.0.1    2018-10-13 [1] CRAN (R 3.5.1)
   TTR                    0.23-4   2018-09-20 [1] CRAN (R 3.5.1)
   usethis                1.5.0    2019-04-07 [1] CRAN (R 3.5.3)
   withr                  2.1.2    2018-04-27 [1] Github (jimhester/withr@79d7b0d)
   xml2                   1.2.0    2018-01-24 [1] CRAN (R 3.5.0)
   xts                  * 0.11-2   2018-11-05 [1] CRAN (R 3.5.1)
   zoo                  * 1.8-5    2019-03-21 [1] CRAN (R 3.5.3)

 R -- Package was removed from disk.
```