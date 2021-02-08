### 1 OPERATION FOR THE RIGHT SUM

## 1.a
m<-9
n<-9
required_sum<-65
t<-matrix(rep(1:9,3),9,9)  # 9*9 matrix
r<-matrix(0,9,9)   #index matrix

#initial road
r[1,1]<-1
r[9,9]<-1
x<-rep(1,10)
for (i in 1:9) {
  if(x[i]<9) {
     x[i+1]<-sample(x[i]:9,1)
     for (j in x[i]:x[i+1]) {r[i,j]=1}
  }
 
  else {
    x[i+1]<-9
    r[i,9]<-1
  }
}

# check the sum
sum(t[r==1])

