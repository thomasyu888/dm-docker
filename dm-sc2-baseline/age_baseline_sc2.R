
## to be replaced by read.csv("/metadata/exams_metadata.tsv")
metadata <- read.table(file = "/metadata/exams_metadata.tsv", header = TRUE)
dim(metadata)

ids <- unique(metadata$subjectId)
nids <- length(ids)
nids

ages <- rep(NA, nids)
for (i in seq(nids)) {
  ages[i] <- max(metadata[metadata$subjectId %in% ids[i], "age"], na.rm = TRUE)
}

ages <- pmin(1, ages/89)

subjectId <- c(ids, ids)
laterality <- c(rep("L", nids), rep("R", nids))
confidence <- c(ages, ages)

predictions <- data.frame(subjectId, laterality, confidence)

write.table(predictions, file = "/output/predictions.tsv", sep = "\t")
