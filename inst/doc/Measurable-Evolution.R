## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  library(dowser)
#  
#  # load example AIRR tsv data
#  data(ExampleAirr)
#  
#  # Process example data using default settings
#  clones = formatClones(ExampleAirr, traits="timepoint", minseq=3)
#  
#  # Column shows timepoints in dataset
#  print(table(ExampleAirr$timepoint))
#  #0   7  14
#  #62 102 225
#  
#  # Calculate number of tissues sampled in tree
#  timepoints = unlist(lapply(clones$data, function(x)
#    length(unique(x@data$timepoint))))
#  
#  # Filter to multi-type trees
#  clones = clones[timepoints > 1,]
#  
#  # Build trees using maximum likelihood (can use alternative builds if desired)
#  trees = getTrees(clones, build="pml")
#  

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  
#  # correlation test with 100 repetitions - in practice use at least 1000
#  test = correlationTest(trees, permutations=100, time="timepoint")
#  print(test)
#  
#  # A tibble: 6 × 12
#  #  clone_id data    locus  seqs trees    slope     p correlation random_correlat…
#  #     <dbl> <list>  <chr> <int> <lis>    <dbl> <dbl>       <dbl>            <dbl>
#  #1     3128 <airrC… N        40 <phy… -0.00205 0.871      -0.173         -0.00953
#  #2     3184 <airrC… N        12 <phy…  0.00111 0.554       0.649          0.0649
#  #3     3140 <airrC… N         9 <phy…  0.00156 0.347       0.630         -0.0278
#  #4     3192 <airrC… N         9 <phy…  0.00739 0.564       0.956          0.115
#  #5     3115 <airrC… N         6 <phy…  0.00159 0.238       0.565          0.0131
#  #6     3139 <airrC… N         6 <phy…  0.00308 0.535       0.821          0.0492
#  
#  
#  # use uniform correlaion test (more sensitive, but higher false positive rate)
#  utest = correlationTest(trees, permutations=100, time="timepoint", perm_type="uniform")
#  print(utest)
#  
#  # A tibble: 6 × 12
#  #  clone_id data   locus  seqs trees    slope      p correlation random_correlat…
#  #     <dbl> <list> <chr> <int> <lis>    <dbl>  <dbl>       <dbl>            <dbl>
#  #1     3128 <airr… N        40 <phy… -0.00205 0.832       -0.173         -0.0146
#  #2     3184 <airr… N        12 <phy…  0.00111 0.0990       0.649          0.0138
#  #3     3140 <airr… N         9 <phy…  0.00156 0.0792       0.630         -0.00741
#  #4     3192 <airr… N         9 <phy…  0.00739 0.129        0.956          0.00818
#  #5     3115 <airr… N         6 <phy…  0.00159 0.386        0.565          0.0719
#  #6     3139 <airr… N         6 <phy…  0.00308 0.158        0.821         -0.00600
#  
#  

