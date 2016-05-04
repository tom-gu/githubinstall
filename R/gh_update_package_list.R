#' Update the List of Packages on GitHub.
#'
#' @importFrom data.table fread
#'
#' @export
gh_update_package_list <- function() {
  download_url <- "http://raw.githubusercontent.com/hoxo-m/gepuro-task-views-copy/master/package_list.txt"
  package_list <- fread(download_url, sep="\t", header = FALSE, stringsAsFactors = FALSE,
                        colClasses = c("character", "character", "character"), 
                        col.names = c("author", "package_name", "title"),
                        showProgress = FALSE)
  assign("package_list", package_list, envir = .options)
}