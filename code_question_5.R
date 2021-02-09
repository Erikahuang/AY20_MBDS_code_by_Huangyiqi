### 5 COLORING

## 1(5*5 matrix)

m=1
L=5

## create adjacency matrix
graph<-matrix(0,25,25)
# four vertices 
graph[1,c(1,2,6)]=1
graph[5,c(5,4,10)]=1
graph[21,c(21,22,16)]=1
graph[25,c(25,24,20)]=1

# 4-connectivity
for (j in 1:3) {
  x1<-j*L+2
  x2<-j*L+4
  for (i in x1:x2) {
  graph[i,i]=1
  graph[i,i-1]=1
  graph[i,i+1]=1
  graph[i,i+5]=1
  graph[i,i-5]=1
}

}
for (i in 1:5) {
  for (j in 1:4) {
      graph[j+(i-1)*5,j+(i-1)*5+1]<-1
  }
  
}

for (i in 1:25) {
  for (j in 1:25) {
    if(graph[i,j]!=0)
      graph[j,i]<-graph[i,j]
  }
  
}

diag(graph)<-1


## coloring
color<-rep(0,25) # store the color of every points
backtrack<-function(n){
  color[1]=1 # color the first point
  for(t in 2:n) # coloring from the second point
  {
    f=0    # assume that point t connect with the colored point
    for(j in 1:t)   # points before point t have been colored, search whether there is connection between them
    {
      if(graph[t,j]!=1)  # exist a point does not connect with point t
      { 
        f=1    # assumption is false
        color[t]=color[j]    # if there is no connection, they can have a same color
        break
      }
    }
    if(f==0)  # assumption is true
    {
      color[t]=m+1  # marked with new color
      m=m+1
    }
  }
  # output the color of every points 
    color<-as.matrix(color,5,5)
    color
}

backtrack(25)
