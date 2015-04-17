#' Generate Random Data Sets
#'
#' Generates random data sets including: data.frames, lists, and vectors.
#' @docType package
#' @name wakefield
#' @aliases wakefield package-wakefield
NULL

#' Augmented List of Grady Ward's English Words and Mark Kantrowitz's Names List
#'
#' A dataset containing a vector of Grady Ward's English words augmented with
#' \pkg{qdapDictionaries}'s  \code{DICTIONARY},
#' \href{http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names}{Mark Kantrowitz's names list},
#' other proper nouns, and contractions.
#'
#' @details A dataset containing a vector of Grady Ward's English words
#' augmented with proper nouns (U.S. States, Countries, Mark Kantrowitz's Names
#' List, and months) and contractions. That dataset is augmented to increase the
#' data set size.
#'
#' @docType data
#' @keywords datasets
#' @name grady_augmented
#' @usage data(grady_augmented)
#' @format A character vector with 122806 elements
#' @references Moby Thesaurus List by Grady Ward \url{http://www.gutenberg.org} \cr \cr
#' List of names from Mark Kantrowitz \url{http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/}.
#' A copy of the \href{http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/readme.txt}{README}
#' is available \href{http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/readme.txt}{here}
#' per the author's request.
NULL


#' Gender Neutral Names
#'
#' A dataset containing a character vector gender neutral names according to the
#' U.S. Census.
#'
#' @docType data
#' @keywords datasets
#' @name name_neutral
#' @usage data(name_neutral)
#' @format A character vector with 662 elements
#' @references \url{http://www.census.gov}
NULL


#' 2012 U.S. Presidential Debate Dialogue
#'
#' A dataset containing 2911 ordered sentences used by speakers during the three
#' 2012 presidential debates.
#'
#' @docType data
#' @keywords datasets
#' @name presidential_debates_2012
#' @usage data(presidential_debates_2012)
#' @format A character vector with 2911 elements
NULL


#' Animal List
#'
#' A dataset containing a character vector animals
#'
#' @docType data
#' @keywords datasets
#' @name animal_list
#' @usage data(animal_list)
#' @format A character vector with 591 elements
#' @references \url{http://a-z-animals.com/animals}
NULL

