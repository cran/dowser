## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# library(airr)
# library(dowser)
# 
# # Read in an AIRR-formatted TSV file of Ig/TCR rearrangements
# airr_data <- read_rearrangement("sequences.tsv")

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# library(airr)
# library(dowser)
# 
# # load example AIRR data, as if read in with read_rearrangement
# data(ExampleAirr)
# 
# # subset data for this example
# ExampleAirr <- ExampleAirr[ExampleAirr$clone_id %in% c("3170", "3184"),]

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# # Process example data into proper format, store isotype (optional)
# clones <- formatClones(ExampleAirr, traits="c_call")
# 
# # Build maximum parsimony trees for each clone
# trees <- getTrees(clones, nproc=1)
# 
# print(trees)

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# # Write tree object to a JSON file, checking it reads back identically
# writeTreesJSON(trees, "trees.json")
# 
# # Read it back in
# trees_json <- readTreesJSON("trees.json")
# 
# print(trees_json)

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# # Save tree object to an RDS file
# saveRDS(trees, "trees.rds")
# 
# # Read it back in
# trees_rds <- readRDS("trees.rds")
# 
# print(trees_rds)

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# # Export trees to a Newick file
# exportTrees(trees, "trees.newick")
# 
# # write a single tree
# ape::write.tree(trees$trees[[1]], "clone1.tree")

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# # Get sequences and sequence IDs for the first clone
# seqs <- clones$data[[1]]@data$sequence
# names(seqs) <- clones$data[[1]]@data$sequence_id
# 
# # Write them to a FASTA file
# writeFasta(seqs, "clone_3170.fasta")
# 
# # Read them back in
# seqs_read <- readFasta("clone_3170.fasta")
# 
# print(names(seqs_read))

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# # Get the data frame of sequences for the first clone
# df <- clones$data[[1]]@data
# 
# # Write to FASTA, tagging each header with its isotype
# dfToFasta(df, "clone_3170_df.fasta", columns="c_call")
# 
# cat(readLines("clone_3170_df.fasta")[1:2], sep="\n")

