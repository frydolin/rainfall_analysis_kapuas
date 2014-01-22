###### SPATIO-TEMPORAL RAINFALL PATTERNS IN KAPUAS BASIN ######
### Analysis and comparison of station data ###

## convenience_functions.R: functions for repeated tasks, that are very specific
## for this analysis so they are just for convenience and can't be recycled
## for other purposes

#### homogeneity.tests ####
# for n=30
# returns a vector of significance 
# (-, * and **) for non, at 5% at 1% error probability

homogeneity.tests=function(x){
    source("scripts/homogeneity_tests.R")
    #testing
    neumann<-lapply(x, neumann.ratio, na.rm=TRUE)
    buishand<-lapply(x, buishand.test, na.rm=TRUE)
    pettitt<-lapply(x, pettitt.test, na.rm=TRUE)
    snht<-lapply(x, snh.test, na.rm=TRUE)
    # extract and check for significance
    #sign vlues should be reckecked
    nm=sapply(neumann, function(x) x$N)
    nm_s=ifelse(nm<1.4, "*", "-")
    nm_s=ifelse(nm<1.2, "**", nm_s)
    bs=sapply(buishand, function(x) x$R.sign)
    bs_s=ifelse(bs>1.5, "*", "-")
    bs_s=ifelse(bs>1.7, "**", bs_s)
    pt=sapply(pettitt, function(x) x$X_e)
    pt_s=ifelse(pt>107, "*", "-")
    pt_s=ifelse(pt>133, "**", pt_s)
    sn=sapply(snht, function(x) x$T_0)
    sn_s=ifelse(sn>7.65, "*", "-")
    sn_s=ifelse(sn>10.45, "**", sn_s)
    
    #return list of significance
    return(list("nm"=nm_s, "bs"=bs_s, "pt"=pt_s, "sn"=sn_s ))
}
###

##### END convenience_functions #####