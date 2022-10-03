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
#' \pkg{qdapDictionaries}'s  `DICTIONARY`, Mark Kantrowitz's names list,
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
#' @references Moby Thesaurus List by Grady Ward https://www.gutenberg.org \cr \cr
#' List of names from Mark Kantrowitz http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/.
#' A copy of the http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/readme.txt
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
#' @references http://www.census.gov
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
#' @references https://a-z-animals.com/animals
NULL


#' State Populations (2010)
#'
#' A dataset containing U.S. state populations.
#'
#' @details
#' \itemize{
#'   \item State. The 50 U.S. states.
#'   \item Population. Population of state.
#'   \item Proportion. Proportion of total U.S. population.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name state_populations
#' @usage data(state_populations)
#' @format A data frame with 50 rows and 3 variables
#' @references https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population
NULL



#' Languages of the World
#'
#' A dataset containing native language use statistics taken from:
#' https://en.wikipedia.org/wiki/List_of_languages_by_number_of_native_speakers.
#'
#' @details
#' \itemize{
#'   \item Language. The language spoken.
#'   \item N. The number of speakers world-wide.
#'   \item Proportion. The proportion of speakers.
#'   \item Percent. The percentage of speakers.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name languages
#' @usage data(languages)
#' @format A data frame with 99 rows and 4 variables
#' @references https://en.wikipedia.org/wiki/List_of_languages_by_number_of_native_speakers
NULL

