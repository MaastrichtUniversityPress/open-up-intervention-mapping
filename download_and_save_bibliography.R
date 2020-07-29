zoteroGroupNumber <- "2460769";

tryCatch({
  bibCon <- url(paste0("https://api.zotero.org/groups/", zoteroGroupNumber, "/items?format=bibtex"));
  bibliography<-readLines(bibCon, warn=FALSE);
  close(bibCon);
}, error=function(e) {
  cat("Error downloading the references from Zotero's API:\n\n", e$message);
});

writeLines(bibliography, here::here("im-wb.bib"));

cat(bibliography,
    sep="\n");

print(gsub("^@[a-zA-Z0-9]+\\{(.*),",
           "\\1",
           bibliography)[grep("^@[a-zA-Z0-9]+\\{(.*),", bibliography)]);


