 function load_needed_data(path,measure)
 %����ѡ��ļ��㷽����·����������Ӧ�������������ԭʼ����
 global Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize size Hcaca Hcbcb Hoaca Hcbib        Hoaia Hsoaia Hscaia Hcaia

  if isequal(path,0)
    return    %�˳����ں�����ִ��
  elseif(measure == 0)%ֱ�����ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    Hscaca = loaddata(path,'Hscaca','Hsca','ca',caSize,caSize);      %���ú���loadcbf��������    function ret=loadcbf(path,name,head,tail,row,col)
    waitbar(1/6,hwait,'������Hscaca');
    Hscacb = loaddata(path,'Hscacb','Hsca','cb',caSize,caSize);
    waitbar(2/6,hwait,'������Hscacb');
    Hscbcb = loaddata(path,'Hscbcb','Hscb','cb',caSize,caSize);
    waitbar(1/2,hwait,'������Hscbcb');
    Hsoaca = loaddata(path,'Hsoaca','Hsoa','ca',oaSize,caSize);
    waitbar(4/6,hwait,'������Hsoaca');
    Hscaib = loaddata(path,'Hscaib','Hsca','ib',caSize,ibSize);
    waitbar(5/6,hwait,'������Hscaib');
    Hsoaib = loaddata(path,'Hsoaib','Hsoa','ib',oaSize,ibSize);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    close(hwait);


  elseif(measure == 1)%��һ�������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');    %function ret=myload2(path,name,head,tail,size)
    Hcaca = loaddata (path,'Hcaca','Hca','ca',size);       %Hcaca = myload2 (path,'Hcaca','Hca','ca',size);
    waitbar(1/5,hwait,'������Hcaca');
    Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',size);       %Hcbcb = myload2 (path,'Hcbcb','Hcb','cb',size);
    waitbar(2/5,hwait,'������Hcbcb');
    Hoaca = loaddata (path,'Hoaca','Hoa','ca',size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
    waitbar(3/5,hwait,'������Hoaca');
    Hcbib = loaddata (path,'Hcbib','Hcb','ib',size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(4/5,hwait,'������Hcbib');
    Hsoaib =loaddata(path,'Hsoaib','Hsoa','ib',size);        %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    close(hwait);


     elseif(measure == 2)%�ڶ��������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    Hoaca = loaddata (path,'Hoaca','Hoa','ca',size);
    waitbar(1/7,hwait,'������Hoaca');
    Hcaca = loaddata (path,'Hcaca','Hca','ca',size);
    waitbar(2/7,hwait,'������Hcaca');
    Hcbcb = loaddata (path,'Hcbcb','Hcb','cb',size);
    waitbar(3/7,hwait,'������Hcbcb');
    Hoaia= loaddata(path,'Hoaia','Hoa','ia',size);
    waitbar(4/7,hwait,'������Hoaia');
    Hsoaia= loaddata(path,'Hsoaia','Hsoa','ia',size);
    waitbar(5/7,hwait,'������Hsoaia');
    Hcaia= loaddata(path,'Hcaia','Hca','ia',size);
    waitbar(6/7,hwait,'������Hcaia');
    Hcbib = loaddata (path,'Hcbib','Hcb','ib',size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(1,hwait,'������Hcbib');
    pause(0.1);
    close(hwait);


     elseif(measure == 3)%�����������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    Hcaca = loaddata (path,'Hcaca','Hca','ca',size);       %Hcaca = myload2 (path,'Hcaca','HAca','ca',size);
    waitbar(1/5,hwait,'������Hcaca');
    Hcbcb = loaddata (path,'Hcbcb','Hcb','cb',size);       %Hcbcb = myload2 (path,'Hcbcb','HBcb','cb',size);
    waitbar(2/5,hwait,'������Hcbcb');
    Hoaca = loaddata (path,'Hoaca','Hoa','ca',size);       %Hoaca = myload2 (path,'Hoaca','HAoa','ca',size);
    waitbar(3/5,hwait,'������HAoaca');
    Hcbib = loaddata (path,'Hcbib','Hcb','ib',size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(4/5,hwait,'������Hcbib');
    Hsoaca= loaddata(path,'Hsoaca','Hsoa','ca',size);       %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    close(hwait);


    elseif(measure == 4)%�����������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');    %function ret=myload2(path,name,head,tail,size)
    Hcaca = loaddata (path,'Hcaca','Hca','ca',size);       %Hcaca = myload2 (path,'Hcaca','Hca','ca',size);
    waitbar(1/5,hwait,'������Hcaca');
    Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',size);       %Hcbcb = myload2 (path,'Hcbcb','Hcb','cb',size);
    waitbar(2/5,hwait,'������Hcbcb');
    Hcbib = loaddata (path,'Hcbib','Hcb','ib',size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(3/5,hwait,'������Hcbib');
    Hoaca = loaddata (path,'Hoaca','Hoa','ca',size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
    waitbar(4/5,hwait,'������Hoaca');
    Hscaca =loaddata(path,'Hscaca','Hsca','ca',size);        %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'������Hscaca');
    pause(0.1);
    close(hwait);


     elseif(measure == 5)%�����������ӽṹ��
        hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
        Hcaca = loaddata (path,'Hcaca','Hca','ca',size);
        waitbar(1/6,hwait,'������Hcaca');
        Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',size);
        waitbar(2/6,hwait,'������Hcbcb');
        Hcaia = loaddata (path,'Hcaia','Hca','ia',size);
        waitbar(3/6,hwait,'������Hcaia');
        Hcbib =loaddata(path,'Hcbib','Hcb','ib',size);
        waitbar(4/6,hwait,'������Hcbib');
        Hoaca = loaddata (path,'Hoaca','Hoa','ca',size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
        waitbar(5/6,hwait,'������Hoaca');
        Hscaia =loaddata(path,'Hscaia','Hsca','ia',size);
        waitbar(1,hwait,'������Hscaia');

        pause(0.1);
        close(hwait);

     else

  end



 function ret=loaddata(path,name,head,tail,row,col)%load data for DirectMeasure
%������mat�����ļ�������ת����Ԫ�����鵼�����
global  f    % fΪ���ݵĵ�һ��������Ƶ��
matLength = 401;
%������������ĸ������ж�����ʹ��ֱ�ӷ����Ǽ�ӷ�
switch nargin
    %ʹ��ֱ�ӷ����˷�����Ҫ���������Ӧ����Ŀһ�£�
    case 6
         c = mat2cell(zeros((row),(col)*matLength),  ones((row),1), matLength*ones((col),1) );      %������ת��ΪԪ������  cell=mat2Cell(data,column,row)

    for i=1:row
        a=num2str(i);
        for j=1:col
            b=num2str(j);
        file=[path '\' name '\' head  a tail b '.mat'];    %���õ�.matΪstruct�ṹ��������7��1xmatLength������
        if ~exist(file,'file')      %%�ж�·���Ƿ�����ļ�
            msgbox(['�Ҳ����ļ�' , head a tail b , '��·��������'],'����', 'error','non-modal');
            %uiwait;
            %continue;%set 0
            return;
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
    case 5
        %ʹ�ü�ӷ������ҽ������������Ӧ��һ�����ʱ�򣬲���ʹ�ô˼�ӷ���
        ret = loaddata(path,name,head,tail,row,row);

    case 0
    otherwise
       return
end









