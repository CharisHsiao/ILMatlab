function  [bool] =  load_needed_data(path,measure,g)
 %����ѡ��ļ��㷽����·����������Ӧ�������������ԭʼ����

  if isequal(path,0)
     bool= 0; %�˳����ں�����ִ��
  elseif(measure == 0)%ֱ�����ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    g.Hscaca = loaddata(path,'Hscaca','Hsca','ca',g,g.caSize,g.caSize);      %���ú���loadcbf��������    function ret=loadcbf(path,name,head,tail,row,col)
    waitbar(1/6,hwait,'������Hscaca');
    g.Hscacb = loaddata(path,'Hscacb','Hsca','cb',g,g.caSize,g.caSize);
    waitbar(2/6,hwait,'������Hscacb');
    g.Hscbcb = loaddata(path,'Hscbcb','Hscb','cb',g,g.caSize,g.caSize);
    waitbar(3/6,hwait,'������Hscbcb');
    g.Hsoaca = loaddata(path,'Hsoaca','Hsoa','ca',g,g.oaSize,g.caSize);
    waitbar(4/6,hwait,'������Hsoaca');
    g.Hscaib = loaddata(path,'Hscaib','Hsca','ib',g,g.caSize,g.ibSize);
    waitbar(5/6,hwait,'������Hscaib');
    g.Hsoaib = loaddata(path,'Hsoaib','Hsoa','ib',g,g.oaSize,g.ibSize);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    close(hwait);
    bool= 1;


  elseif(measure == 1)%��һ�������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');    %function ret=myload2(path,name,head,tail,size)
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);       %Hcaca = myload2 (path,'Hcaca','Hca','ca',size);
    waitbar(1/5,hwait,'������Hcaca');
    g.Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',g,g.size);       %Hcbcb = myload2 (path,'Hcbcb','Hcb','cb',size);
    waitbar(2/5,hwait,'������Hcbcb');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
    waitbar(3/5,hwait,'������Hoaca');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(4/5,hwait,'������Hcbib');
    g.Hsoaib =loaddata(path,'Hsoaib','Hsoa','ib',g,g.size);        %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    close(hwait);
     bool= 1;

     elseif(measure == 2)%�ڶ��������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);
    waitbar(1/7,hwait,'������Hoaca');
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);
    waitbar(2/7,hwait,'������Hcaca');
    g.Hcbcb = loaddata (path,'Hcbcb','Hcb','cb',g,g.size);
    waitbar(3/7,hwait,'������Hcbcb');
    g.Hoaia= loaddata(path,'Hoaia','Hoa','ia',g,g.size);
    waitbar(4/7,hwait,'������Hoaia');
    g.Hsoaia= loaddata(path,'Hsoaia','Hsoa','ia',g,g.size);
    waitbar(5/7,hwait,'������Hsoaia');
    g.Hcaia= loaddata(path,'Hcaia','Hca','ia',g,g.size);
    waitbar(6/7,hwait,'������Hcaia');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(1,hwait,'������Hcbib');
    pause(0.1);
    close(hwait);
     bool= 1;

     elseif(measure == 3)%�����������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);       %Hcaca = myload2 (path,'Hcaca','HAca','ca',size);
    waitbar(1/5,hwait,'������Hcaca');
    g.Hcbcb = loaddata (path,'Hcbcb','Hcb','cb',g,g.size);       %Hcbcb = myload2 (path,'Hcbcb','HBcb','cb',size);
    waitbar(2/5,hwait,'������Hcbcb');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','HAoa','ca',size);
    waitbar(3/5,hwait,'������HAoaca');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(4/5,hwait,'������Hcbib');
    g.Hsoaca= loaddata(path,'Hsoaca','Hsoa','ca',g,g.size);       %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    close(hwait);
     bool= 1;

    elseif(measure == 4)%�����������ӽṹ��
    hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');    %function ret=myload2(path,name,head,tail,size)
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);       %Hcaca = myload2 (path,'Hcaca','Hca','ca',size);
    waitbar(1/5,hwait,'������Hcaca');
    g.Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',g,g.size);       %Hcbcb = myload2 (path,'Hcbcb','Hcb','cb',size);
    waitbar(2/5,hwait,'������Hcbcb');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(3/5,hwait,'������Hcbib');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
    waitbar(4/5,hwait,'������Hoaca');
    g.Hscaca =loaddata(path,'Hscaca','Hsca','ca',g,g.size);        %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'������Hscaca');
    pause(0.1);
    close(hwait);
     bool= 1;

     elseif(measure == 5)%�����������ӽṹ��
        hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
        g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);
        waitbar(1/6,hwait,'������Hcaca');
        g.Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',g,g.size);
        waitbar(2/6,hwait,'������Hcbcb');
        g.Hcaia = loaddata (path,'Hcaia','Hca','ia',g,g.size);
        waitbar(3/6,hwait,'������Hcaia');
        g.Hcbib =loaddata(path,'Hcbib','Hcb','ib',g,g.size);
        waitbar(4/6,hwait,'������Hcbib');
        g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
        waitbar(5/6,hwait,'������Hoaca');
        g.Hscaia =loaddata(path,'Hscaia','Hsca','ia',g,g.size);
        waitbar(1,hwait,'������Hscaia');

        pause(0.1);
        close(hwait);
     bool= 1;
     else

  end



 function ret = loaddata(path,name,head,tail,g,row,col)%load data for DirectMeasure
%������mat�����ļ�������ת����Ԫ�����鵼�����
%global  f   fΪ���ݵĵ�һ��������Ƶ��
matLength = 401;
%������������ĸ������ж�����ʹ��ֱ�ӷ����Ǽ�ӷ�
switch nargin
    %ʹ��ֱ�ӷ����˷�����Ҫ���������Ӧ����Ŀһ�£�
    case 7
         c = mat2cell(zeros((row),(col)*matLength),ones((row),1), matLength*ones((col),1));      %������ת��ΪԪ������  cell=mat2Cell(data,column,row)
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
     if ~exist('A','var')&&isequal(length(g.f),0)  
          g.f=temp.a0;
     end
 
     if ~exist('A','var')    %�ж���ΪA�ı����Ƿ����  ��ʱ��֪ A ����  2016-03-12-19:21
      clear temp tempval c;
     end

    case 6
        %ʹ�ü�ӷ������ҽ������������Ӧ��һ�����ʱ�򣬲���ʹ�ô˼�ӷ���
        ret = loaddata(path,name,head,tail,g,row,row);
    case 0
    otherwise
       return
end









