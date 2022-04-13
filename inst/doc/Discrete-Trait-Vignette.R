## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  library(dowser)
#  
#  # load example AIRR tsv data
#  data(ExampleAirr)
#  
#  trait="biopsy"
#  
#  # Process example data using default settings
#  clones = formatClones(ExampleAirr,
#      traits=trait,num_fields="duplicate_count", minseq=3)
#  
#  # Column shows which biopsy the B cell was obtained from
#  print(table(ExampleAirr[[trait]]))
#  #Lung Nose
#  # 145  244
#  
#  # Calculate number of tissues sampled in tree
#  tissue_types = unlist(lapply(clones$data, function(x)
#    length(unique(x@data[[trait]]))))
#  
#  # Filter to multi-type trees
#  clones = clones[tissue_types > 1,]
#  
#  # Build trees using maximum likelihood (can use alternative builds if desired)
#  trees = getTrees(clones, build="pml")
#  

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  # the location of the igphyml executable
#  # this is location in Docker image, will likely be different if you've set it up yourself
#  igphyml_location = "/usr/local/share/igphyml/src/igphyml"
#  
#  # calculate switches along trees compared to 100 random permutations
#  # this may take a while, and can be parallelized using nproc
#  switches = findSwitches(trees, permutations=100, trait=trait,
#    igphyml=igphyml_location, fixtrees=TRUE)
#  
#  # Perform PS test on switches
#  ps = testPS(switches$switches)
#  print(ps$means)
#  # A tibble: 1 × 6
#  #  RECON PERMUTE   PLT DELTA STAT   REPS
#  #  <dbl>   <dbl> <dbl> <dbl> <chr> <int>
#  #1     8     8.6   0.4  -0.6 PS      100
#  
#  
#  sp = testSP(switches$switches, alternative="greater")
#  print(sp$means)
#  # A tibble: 2 × 8
#  # Groups:   FROM [2]
#  #  FROM  TO    RECON PERMUTE   PGT  DELTA STAT   REPS
#  #  <chr> <chr> <dbl>   <dbl> <dbl>  <dbl> <chr> <int>
#  #1 Lung  Nose  0.131   0.323     1 -0.192 SP      100
#  #2 Nose  Lung  0.869   0.677     0  0.192 SP      100
#  

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  # calculate switches along bootstrap distribution of trees
#  # build using the 'pml' maximum likelihood option
#  # in a real analysis it's important to use at least 100 permutations
#  switches = findSwitches(trees, permutations=10, trait=trait,
#    igphyml=igphyml_location, fixtrees=FALSE, build="pml")
#  
#  sp = testSP(switches$switches, alternative="greater")
#  print(sp$means)
#  # A tibble: 2 × 8
#  # Groups:   FROM [2]
#  #  FROM  TO    RECON PERMUTE   PGT  DELTA STAT   REPS
#  #  <chr> <chr> <dbl>   <dbl> <dbl>  <dbl> <chr> <int>
#  #1 Lung  Nose  0.168   0.358   1   -0.190 SP       10
#  #2 Nose  Lung  0.832   0.642   0.1  0.190 SP       10
#  

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  sp = testSP(switches$switches, alternative="greater", permuteAll=TRUE)
#  print(sp$means)
#  # A tibble: 2 × 8
#  # Groups:   FROM [2]
#  #  FROM  TO    RECON PERMUTE   PGT   DELTA STAT   REPS
#  #  <chr> <chr> <dbl>   <dbl> <dbl>   <dbl> <chr> <int>
#  #1 Lung  Nose  0.168   0.241   0.6 -0.0736 SP       10
#  #2 Nose  Lung  0.832   0.759   0.4  0.0736 SP       10

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  # Downsample each tree to a tip-to-switch ratio of 10 instead of 20
#  # this will reduce the false positive rate but also (likely) power
#  switches = findSwitches(trees, permutations=100, trait=trait,
#    igphyml=igphyml_location, fixtrees=TRUE, tip_switch=10)
#  
#  # didn't have much effect for this dataset
#  sp = testSP(switches$switches, alternative="greater")
#  print(sp$means)
#  # A tibble: 2 × 8
#  # Groups:   FROM [2]
#  #  FROM  TO    RECON PERMUTE   PGT  DELTA STAT   REPS
#  #  <chr> <chr> <dbl>   <dbl> <dbl>  <dbl> <chr> <int>
#  #1 Lung  Nose  0.168   0.358   1   -0.190 SP       10
#  #2 Nose  Lung  0.832   0.642   0.1  0.190 SP       10
#  

