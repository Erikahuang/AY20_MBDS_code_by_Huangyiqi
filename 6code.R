### 6 POINTS INSIDE/OUTSIDE POLYGOM

## data input
input_points<-read.table(file='C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 6/input_question_6_points',
                              header = F) # input coordinates
input_polygon<-read.table(file='C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 6/input_question_6_polygon',
                        header = F) # input polygon
input_polygon<-rbind(input_polygon,c(4,3))
plot(input_polygon, type="b") # from the figure, the polygon is sorted clockwise according to the given vertex coordinates
input_points$V3<-0

# define the point tested is P(x,y)
# define the vertexes of the i th side of the ploygon are (x[i],y[i]) and (x[i+1],y[i+1]) 

## First case: the points are in the same positions of the given vertex
# (x,y)=(x[i],y[i])
for (i in 1:10) {
  for (j in 1:10) {
    if((input_points$V2[i]==input_polygon$V2[j]) & (input_points$V1[i]==input_polygon$V1[j]))
      input_points$V3[i]<-Inf
  }
}

## Second case: the ray from given point to the left parallel with the side and the point is on the side 
# y=y[i]=y[i+1] and min(x[i],x[i+1])<x<max(x[i],x[i+1])
for (i in 1:10) {
  for (j in 1:10) {
    minx<-min(input_polygon$V1[j],input_polygon$V1[j+1])
    maxx<-max(input_polygon$V1[j],input_polygon$V1[j+1])
    if((input_points$V2[i]==input_polygon$V2[j]) & (input_points$V2[i]==input_polygon$V2[j+1]) & (input_points$V1[i]>minx) & (input_points$V1[i]<maxx))
      input_points$V3[i]<-Inf
  }
}


## Third case: the given point is outside the side or on the side
# there are two cases
# 1. x>min(x[i],x[i+1]) and min(y[i],y[i+1])<y<max(y[i],y[i+1])
# 2. y=max(y[i],y[i+1]), if y[i]<y[i+1], then x>x[i+1], vice versa. 
for (i in 1:10) {
  for (j in 1:10) {
    
    maxy<-max(input_polygon$V2[j],input_polygon$V2[j+1])
    if(input_polygon$V2[j]==maxy) maxy_index<-j
    else maxy_index<-j+1
    miny<-min(input_polygon$V2[j],input_polygon$V2[j+1])
    minx<-min(input_polygon$V1[j],input_polygon$V1[j+1])
    # general case
    if(input_points$V2[i]>miny & input_points$V2[i]<maxy & input_points$V1[i]>minx)
      input_points$V3[i]<-input_points$V3[i]+1
    # the ray from given point to the left passes the vertex
    if(input_points$V2[i]==maxy & input_points$V1[i]>input_polygon$V1[maxy_index])
      input_points$V3[i]<-input_points$V3[i]+1
  }
}

## the test result
# inside points
output_inside<-input_points[input_points$V3%%2!=0 | input_points$V3==Inf,]
# outside points
output_outside<-input_points[input_points$V3%%2==0,]
