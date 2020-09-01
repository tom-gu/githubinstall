#' Update the List of Packages on GitHub.
#'
#' @importFrom data.table fread
#'
#' @export
gh_update_package_list <- function(owner_name = "bd-r") {
  
  repos_url <- 
    sprintf("https://api.github.com/orgs/%s/repos",
            owner_name)
  download_repos <- jsonlite::fromJSON(repos_url)
  
  package_list <- data.table::data.table(
                            username = download_repos$owner$login,
                            package_name = download_repos$name,
                            title = download_repos$description)
  assign("package_list", package_list, envir = .options)
}