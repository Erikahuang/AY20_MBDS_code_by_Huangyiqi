## 7.1 2-DIMENSION CONVERTION

# data input
input_coordinates<-read.table(file='C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.1/input_coordinates_7_1.txt',
                              header = T) # input coordinates
input_index<-read.table(file='C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.1/input_index_7_1.txt',
                        header = T) # input index

# convert coordinates to index
output_index<-input_index

output_index<-(input_coordinates$x2)*50+input_coordinates$x1 # index = x2*50+x1
write.table(output_index,file="C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.1/output_index_7.1.txt",
            row.names=F,col.names=T,quote=F,sep="\t")

# convert index to coordinates
n<-nrow(input_index)
output_coordinates<-as.data.frame(matrix(0,n,2))
colnames(output_coordinates)<-c("x1","x2")
output_coordinates$x2<-input_index[,1]%/%50
output_coordinates$x1<-input_index[,1]%%50

write.table(output_coordinates,file="C:/Users/Administrator/Desktop/AY20_MBDS_questions/Question 7/Question 7.1/output_coordinates_7.1.txt",
            row.names=F,col.names=T,quote=F,sep="\t")


