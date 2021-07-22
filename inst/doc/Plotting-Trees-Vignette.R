## ---- eval=TRUE, warning=FALSE, message=FALSE---------------------------------

library(dowser)

data(ExampleClones)

ExampleClones = ExampleClones[1:2,]

plots = plotTrees(ExampleClones)

#Plot the largest tree
#To plot second largest tree, use plots[[2]], and so on
plots[[1]]


## ---- eval=TRUE, warning=FALSE, message=FALSE---------------------------------

# Re-scale branches to represent mutations between nodes
ExampleClones_m = scaleBranches(ExampleClones, edge_type="mutations")

# Plot, set scale bar to represent 10 mutations
plots = plotTrees(ExampleClones_m, scale=10)

#Plot the largest tree
plots[[1]]


## ---- eval=TRUE, warning=FALSE, message=FALSE---------------------------------
# Plot tree with sequence isotype at the tips.
plots = plotTrees(ExampleClones, tips="c_call")

#Plot the largest tree
plots[[1]]

## ---- eval=TRUE, warning=FALSE, message=FALSE---------------------------------
# Plot tree with sequence isotype at the tips, with sizes set to number of duplicates
plots = plotTrees(ExampleClones, tips="c_call", tipsize="duplicate_count")

#Plot the largest tree
plots[[1]]

## ---- eval=TRUE, warning=FALSE, message=FALSE---------------------------------
# These calls create the same plot:

# Plot tree with sequence isotype at the tips, with palette "Set1"
plots = plotTrees(ExampleClones, tips="c_call", tipsize=2,
    tip_palette="Set1")

# or, specify a named palette vector
custom_palette=c("IGHA"="#E41A1C", "IGHG"="#377EB8",
    "IGHD"="#4DAF4A", "Germline"="#984EA3")

plots = plotTrees(ExampleClones, tips="c_call", tipsize=2,
    tip_palette=custom_palette)

# or, use the getPalette function to create a named palette vector
custom_palette=getPalette(c("IGHA", "IGHG", "IGHD", "Germline"), "Set1")

plots = plotTrees(ExampleClones, tips="c_call", tipsize=2,
    tip_palette=custom_palette)

#Plot the largest tree
plots[[1]]

## ---- eval=TRUE, warning=FALSE, message=FALSE---------------------------------
library(ggtree)

plots = plotTrees(ExampleClones, tips="c_call", tipsize=2)

#Plot the largest tree
treeplot = plots[[1]] + geom_tiplab() + 
    geom_vline(xintercept=c(0.05,0.1,0.15,0.2,0.25),
        linetype="dashed",color="grey") + xlim(0,0.3) +
    ggtitle("Example B cell tree")

treeplot

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  plots = plotTrees(ExampleClones, tips="c_call", tipsize=2)
#  
#  # you can also pass arguments you would pass to grDevices::pdf, like width and height
#  # here, we plot 4 trees per page (2 rows, 2 columns)
#  treesToPDF(plots, file="trees.pdf", nrow=2, ncol=2)

