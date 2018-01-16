# R

fisher_posthoc <- function(data){
a <- data.frame("v1" = numeric(0) , "v2" = numeric(0))
for(i in 1:(nrow(data)-1)){
  for(l in 1:(nrow(data)-1)){
    if(i != l+1){
    a <- rbind(a , data.frame("v1" = i , "v2" = l+1))
  }
 }
}
a <- a[-which(a$v1 > a$v2),]

b <- data.frame("v1" = numeric(0) , "v2" = numeric(0))

    for(i in 1:(ncol(data)-1)){
      for(l in 1:(ncol(data)-1)){
        if(i != l+1){
          b <- rbind(b , data.frame("v1" = i , "v2" = l+1))
        }
      }
    }
    b <- b[-which(b$v1 > b$v2),]

    c <- data.frame("v1" = numeric(0) , "v2" = numeric(0) , "v3" = numeric(0) , "v4" = numeric(0))

    for(i in 1:nrow(a)){
      for(l in 1:nrow(b)){
        if(i != l+1){
          c <- rbind(c , data.frame("v1" = a[i,1] , "v2" = a[i,2]  , "v3" = b[l,1] , "v4" = b[l,2] ))
        }
      }

    }
    result <- data.frame("category_row1" = character(0),
                         "category_row2" = character(0),
                         "category_col1" = character(0),
                         "category_col2" = character(0),
                         "p_value" = numeric(0))
    for(i in 1:nrow(c)){
      p.value = fisher.test(data[c(c[i,1],c[i,2]),c(c[i,3],c[i,4])])$p.value
      result <- rbind(result , data.frame("category_row1" = row.names(data[c(c[i,1],c[i,2]),c(c[i,3],c[i,4])])[1],
                                          "category_row2" = row.names(data[c(c[i,1],c[i,2]),c(c[i,3],c[i,4])])[2],
                                          "category_col1" = colnames(data[c(c[i,1],c[i,2]),c(c[i,3],c[i,4])])[1],
                                          "category_col2" = colnames(data[c(c[i,1],c[i,2]),c(c[i,3],c[i,4])])[2],
                                          "p_value" = p.value))

    }
 return(result)

}
