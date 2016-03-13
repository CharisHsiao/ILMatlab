function ret=loadcbf(path,name,head,tail,row,col)%优化代码，传入size、名称即可返回数据
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2012  by  Manhua Jiang
%-------------------------------------------------------------------------------------------

global  f 

         c = mat2cell(zeros((row),(col)*401),  ones((row),1), 401*ones((col),1) );
    for i=1:row
        a=num2str(i);      
        for j=1:col
            b=num2str(j);          
        file=[path '\' name '\' head  a tail b '.mat'];
        if ~exist(file,'file')
           
            continue;%set 0
        end
        temp=importdata(file);
        tempval=temp.a4+1i*temp.a5;
        c{i,j}=tempval;
%         display (file)  %test
        end
    end
    ret=cell2mat(c);
    
 if ~exist('A','var')   
     f=temp.a0;
   
   clear temp tempval c;

end

