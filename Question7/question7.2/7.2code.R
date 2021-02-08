## 7.2 d-DIMENSION CONVERTION

# data input
input_coordinates<-read.table(file='C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.2/input_coordinates_7_2.txt',
                              header = T) # input coordinates
input_index<-read.table(file='C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.2/input_index_7_2.txt',
                        header = T) # input index

# convert coordinates to index
output_index<-input_index
output_index<-input_coordinates$x1*8*5*9*6*7+input_coordinates$x2*5*9*6*7+input_coordinates$x3*9*6*7+input_coordinates$x4*6*7+input_coordinates$x5*7+input_coordinates$x6
write.table(output_index,file="C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.2/output_index_7.2.txt",
            row.names=F,col.names=T,quote=F,sep="\t")

# convert index to coordinates
n<-nrow(input_index)
output_coordinates<-as.data.frame(matrix(0,n,6))
colnames(output_coordinates)<-c("x1","x2","x3","x4","x5","x6")
output_coordinates$x1<-input_index[,1]%/%(8*5*9*6*7)
output_coordinates$x2<-input_index[,1]%%(8*5*9*6*7)%/%(5*9*6*7)
output_coordinates$x3<-input_index[,1]%%(8*5*9*6*7)%%(5*9*6*7)%/%(9*6*7)
output_coordinates$x4<-input_index[,1]%%(8*5*9*6*7)%%(5*9*6*7)%%(9*6*7)%/%(6*7)
output_coordinates$x5<-input_index[,1]%%(8*5*9*6*7)%%(5*9*6*7)%%(9*6*7)%%(6*7)%/%7
output_coordinates$x6<-input_index[,1]%%(8*5*9*6*7)%%(5*9*6*7)%%(9*6*7)%%(6*7)%%7
write.table(output_coordinates,file="C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.2/output_coordinates_7.2.txt",
            row.names=F,col.names=T,quote=F,sep="\t")


