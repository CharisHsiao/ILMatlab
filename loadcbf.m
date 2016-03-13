function ret=loadcbf(path,name,head,tail,row,col)%优化代码，传入size、名称即可返回数据
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2012  by  Manhua Jiang
%-------------------------------------------------------------------------------------------

global  f    % f为数据的第一个，代表频率
         c = mat2cell(zeros((row),(col)*401),  ones((row),1), 401*ones((col),1) );      %将矩阵转换为元胞数组  cell=mat2Cell(data,column,row)
    for i=1:row
        a=num2str(i);
        for j=1:col
            b=num2str(j);
        file=[path '\' name '\' head  a tail b '.mat'];    %所得的.mat为struct结构，里面有7个1x401的向量
        if ~exist(file,'file')      %%判断路径是否存在文件
            msgbox(['找不到文件' , head a tail b , '或路径不存在'],'错误', 'error','non-modal');
            uiwait;
            continue;%set 0
        end
        temp=importdata(file);
        tempval=temp.a4+1i*temp.a5;    % 1i 表示虚数单位    只取其中的第五第六组数据
        c{i,j}=tempval;
%         display (file)  %test
        end
    end
    ret=cell2mat(c);    %将元胞数组转换为矩阵

 if ~exist('A','var')    %判断名为A的变量是否存在  暂时不知 A 作用  2016-03-12-19:21
     f=temp.a0;

   clear temp tempval c;

end

