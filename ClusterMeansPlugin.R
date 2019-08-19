library(rlist)

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]
  numclusters <- as.integer(parameters["numclusters", 2])
  list2 <<- list()
  pos <- 0;
  for (j in 1:numclusters) {
  tmplist <<- read.csv(paste(toString(parameters["clusters",2]),j,"csv",sep="."), header=F)
  singlelist <<- tmplist[,2]
  numclusters <- 0
  for (i in 1:length(singlelist)) {
     if (is.na(tmplist[,1][i])) {
        list2 <<- list.append(list2, c());
        pos <- pos + 1;
     }
     else {
        list2[[pos]] <<- append(list2[[pos]], as.character(singlelist[[i]]));
     }
  #      numclusters <- numclusters + 1;
  #   }
  }
  }
  network <<- read.csv(toString(parameters["network", 2]), header=T);
  #tmp <- network[,1]
  network <<- network[,-1]
  #rownames(network) <<- tmp
}

run <- function() {
  mean_values <<- matrix(data=NA, nrow=length(list2), ncol=length(list2));
  for (j in 1:length(list2)) {
     for (k in 1:length(list2)) {
        corr_info <- network[list2[[j]], list2[[k]]];
        if (j == k) {
           rel_data <- corr_info[lower.tri(corr_info, diag=FALSE)];
        }
        else {
           rel_data <- as.vector(as.matrix(corr_info));
        }
        mean_values[j, k] <<- mean(rel_data);
     } 
  }
}


output <- function(outputfile) {
   write.table(mean_values, outputfile, sep=",", append=FALSE, col.names=NA, na="");
}

