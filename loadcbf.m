function ret=loadcbf(path,name,head,tail,row,col)%�Ż����룬����size�����Ƽ��ɷ�������
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2012  by  Manhua Jiang
%-------------------------------------------------------------------------------------------

global  f    % fΪ���ݵĵ�һ��������Ƶ��
         c = mat2cell(zeros((row),(col)*401),  ones((row),1), 401*ones((col),1) );      %������ת��ΪԪ������  cell=mat2Cell(data,column,row)
    for i=1:row
        a=num2str(i);
        for j=1:col
            b=num2str(j);
        file=[path '\' name '\' head  a tail b '.mat'];    %���õ�.matΪstruct�ṹ��������7��1x401������
        if ~exist(file,'file')      %%�ж�·���Ƿ�����ļ�
            msgbox(['�Ҳ����ļ�' , head a tail b , '��·��������'],'����', 'error','non-modal');
            uiwait;
            continue;%set 0
        end
        temp=importdata(file);
        tempval=temp.a4+1i*temp.a5;    % 1i ��ʾ������λ    ֻȡ���еĵ������������
        c{i,j}=tempval;
%         display (file)  %test
        end
    end
    ret=cell2mat(c);    %��Ԫ������ת��Ϊ����

 if ~exist('A','var')    %�ж���ΪA�ı����Ƿ����  ��ʱ��֪ A ����  2016-03-12-19:21
     f=temp.a0;

   clear temp tempval c;

end

