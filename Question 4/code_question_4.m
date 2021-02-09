clear all;
close all;
clc;
% import matrix                   
s=load('input_question_4');
[m n]=size(s);
s=[zeros(1,n);s;zeros(1,n)];
s=[zeros(m+2,1) s zeros(m+2,1)];   % Fill the periphery of the matrix with 0, without missing pixels on the four sides
% initial marker matrix and storage queue
tmp=zeros(m+2,n+2);     % marker matrix
label=1;
queue_head=1;       % Head of queue
queue_tail=1;       % Tail of queue
neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  % 8 neighborhood coordinates with (0,0) as the center pixel

for i=2:m+1
    for j=2:n+1
        
        if s(i,j)==1 && tmp(i,j) ==0           
            tmp(i,j)=label;
            q{queue_tail}=[i j];        % Use tuples to simulate the queue, and enter the current coordinates
            queue_tail=queue_tail+1;
            
            while queue_head~=queue_tail
                pix=q{queue_head};                
                for k=1:8               % 8-connectivity search
                    pix1=pix+neighbour(k,:);
                    if pix1(1)>=2 && pix1(1)<=m+1 && pix1(2) >=2 &&pix1(2)<=n+1
                       if s(pix1(1),pix1(2)) == 1 && tmp(pix1(1),pix1(2)) ==0  
                          % If the current pixel neighborhood pixel is 1 
                          % and this neighborhood pixel is not marked, then mark
                            tmp(pix1(1),pix1(2))=label;
                            q{queue_tail}=[pix1(1) pix1(2)];
                            queue_tail=queue_tail+1;
                       end  
                    end              
                end
                queue_head=queue_head+1; % 8-connected pixels of the center pixel have been traversed
            end
            
            clear q;                % Clear the queue and prepare for the new mark
            label=label+1;
            queue_head=1;
            queue_tail=1;            
        end
    
    end
end
tmp([1,12],:)=[]
tmp(:,[1,22])=[]

% import marker matrix
[m, n] = size(tmp);
fid=fopen('output_question_4.txt', 'wt');
for i = 1 : m
	fprintf(fid, '%g\t', tmp(i, :));
	fprintf(fid, '\n');
end
fclose(fid);
