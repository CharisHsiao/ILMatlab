function  [bool] =  load_needed_data(path,measure,g)
 %根据选择的计算方法和路径，导入相应方法所需的所有原始数据

  if isequal(path,0)
     bool= 0; %退出所在函数的执行
  elseif(measure == 0)%直接逆子结构法
    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
    g.Hscaca = loaddata(path,'Hscaca','Hsca','ca',g,g.caSize,g.caSize);      %调用函数loadcbf读入数据    function ret=loadcbf(path,name,head,tail,row,col)
    waitbar(1/6,hwait,'已载入Hscaca');
    g.Hscacb = loaddata(path,'Hscacb','Hsca','cb',g,g.caSize,g.caSize);
    waitbar(2/6,hwait,'已载入Hscacb');
    g.Hscbcb = loaddata(path,'Hscbcb','Hscb','cb',g,g.caSize,g.caSize);
    waitbar(3/6,hwait,'已载入Hscbcb');
    g.Hsoaca = loaddata(path,'Hsoaca','Hsoa','ca',g,g.oaSize,g.caSize);
    waitbar(4/6,hwait,'已载入Hsoaca');
    g.Hscaib = loaddata(path,'Hscaib','Hsca','ib',g,g.caSize,g.ibSize);
    waitbar(5/6,hwait,'已载入Hscaib');
    g.Hsoaib = loaddata(path,'Hsoaib','Hsoa','ib',g,g.oaSize,g.ibSize);
    waitbar(1,hwait,'已载入Hsoaib');
    pause(0.1);
    close(hwait);
    bool= 1;


  elseif(measure == 1)%第一类间接逆子结构法
    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');    %function ret=myload2(path,name,head,tail,size)
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);       %Hcaca = myload2 (path,'Hcaca','Hca','ca',size);
    waitbar(1/5,hwait,'已载入Hcaca');
    g.Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',g,g.size);       %Hcbcb = myload2 (path,'Hcbcb','Hcb','cb',size);
    waitbar(2/5,hwait,'已载入Hcbcb');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
    waitbar(3/5,hwait,'已载入Hoaca');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(4/5,hwait,'已载入Hcbib');
    g.Hsoaib =loaddata(path,'Hsoaib','Hsoa','ib',g,g.size);        %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'已载入Hsoaib');
    pause(0.1);
    close(hwait);
     bool= 1;

     elseif(measure == 2)%第二类间接逆子结构法
    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);
    waitbar(1/7,hwait,'已载入Hoaca');
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);
    waitbar(2/7,hwait,'已载入Hcaca');
    g.Hcbcb = loaddata (path,'Hcbcb','Hcb','cb',g,g.size);
    waitbar(3/7,hwait,'已载入Hcbcb');
    g.Hoaia= loaddata(path,'Hoaia','Hoa','ia',g,g.size);
    waitbar(4/7,hwait,'已载入Hoaia');
    g.Hsoaia= loaddata(path,'Hsoaia','Hsoa','ia',g,g.size);
    waitbar(5/7,hwait,'已载入Hsoaia');
    g.Hcaia= loaddata(path,'Hcaia','Hca','ia',g,g.size);
    waitbar(6/7,hwait,'已载入Hcaia');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(1,hwait,'已载入Hcbib');
    pause(0.1);
    close(hwait);
     bool= 1;

     elseif(measure == 3)%第三类间接逆子结构法
    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);       %Hcaca = myload2 (path,'Hcaca','HAca','ca',size);
    waitbar(1/5,hwait,'已载入Hcaca');
    g.Hcbcb = loaddata (path,'Hcbcb','Hcb','cb',g,g.size);       %Hcbcb = myload2 (path,'Hcbcb','HBcb','cb',size);
    waitbar(2/5,hwait,'已载入Hcbcb');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','HAoa','ca',size);
    waitbar(3/5,hwait,'已载入HAoaca');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(4/5,hwait,'已载入Hcbib');
    g.Hsoaca= loaddata(path,'Hsoaca','Hsoa','ca',g,g.size);       %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'已载入Hsoaib');
    pause(0.1);
    close(hwait);
     bool= 1;

    elseif(measure == 4)%第四类间接逆子结构法
    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');    %function ret=myload2(path,name,head,tail,size)
    g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);       %Hcaca = myload2 (path,'Hcaca','Hca','ca',size);
    waitbar(1/5,hwait,'已载入Hcaca');
    g.Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',g,g.size);       %Hcbcb = myload2 (path,'Hcbcb','Hcb','cb',size);
    waitbar(2/5,hwait,'已载入Hcbcb');
    g.Hcbib = loaddata (path,'Hcbib','Hcb','ib',g,g.size);       %Hcbib = myload2 (path,'Hcbib','Hcb','ib',size);
    waitbar(3/5,hwait,'已载入Hcbib');
    g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
    waitbar(4/5,hwait,'已载入Hoaca');
    g.Hscaca =loaddata(path,'Hscaca','Hsca','ca',g,g.size);        %Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'已载入Hscaca');
    pause(0.1);
    close(hwait);
     bool= 1;

     elseif(measure == 5)%第五类间接逆子结构法
        hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
        g.Hcaca = loaddata (path,'Hcaca','Hca','ca',g,g.size);
        waitbar(1/6,hwait,'已载入Hcaca');
        g.Hcbcb =loaddata (path,'Hcbcb','Hcb','cb',g,g.size);
        waitbar(2/6,hwait,'已载入Hcbcb');
        g.Hcaia = loaddata (path,'Hcaia','Hca','ia',g,g.size);
        waitbar(3/6,hwait,'已载入Hcaia');
        g.Hcbib =loaddata(path,'Hcbib','Hcb','ib',g,g.size);
        waitbar(4/6,hwait,'已载入Hcbib');
        g.Hoaca = loaddata (path,'Hoaca','Hoa','ca',g,g.size);       %Hoaca = myload2 (path,'Hoaca','Hoa','ca',size);
        waitbar(5/6,hwait,'已载入Hoaca');
        g.Hscaia =loaddata(path,'Hscaia','Hsca','ia',g,g.size);
        waitbar(1,hwait,'已载入Hscaia');

        pause(0.1);
        close(hwait);
     bool= 1;
     else

  end



 function ret = loaddata(path,name,head,tail,g,row,col)%load data for DirectMeasure
%将单个mat数据文件的数据转换成元胞数组导入程序
%global  f   f为数据的第一个，代表频率
matLength = 401;
%根据输入参数的个数，判断是在使用直接法还是间接法
switch nargin
    %使用直接法（此方法不要求激励点和响应点数目一致）
    case 7
         c = mat2cell(zeros((row),(col)*matLength),ones((row),1), matLength*ones((col),1));      %将矩阵转换为元胞数组  cell=mat2Cell(data,column,row)
    for i=1:row
        a=num2str(i);
        for j=1:col
            b=num2str(j);
        file=[path '\' name '\' head  a tail b '.mat'];    %所得的.mat为struct结构，里面有7个1xmatLength的向量
        if ~exist(file,'file')      %%判断路径是否存在文件
            msgbox(['找不到文件' , head a tail b , '或路径不存在'],'错误', 'error','non-modal');
            %uiwait;
            %continue;%set 0
            return;
        end
        temp=importdata(file);
        tempval=temp.a4+1i*temp.a5;    % 1i 表示虚数单位    只取其中的第五第六组数据
        c{i,j}=tempval;
%         display (file)  %test
        end
    end
    ret=cell2mat(c);    %将元胞数组转换为矩阵
     if ~exist('A','var')&&isequal(length(g.f),0)  
          g.f=temp.a0;
     end
 
     if ~exist('A','var')    %判断名为A的变量是否存在  暂时不知 A 作用  2016-03-12-19:21
      clear temp tempval c;
     end

    case 6
        %使用间接法（当且仅当激励点和响应点一样多的时候，才能使用此间接法）
        ret = loaddata(path,name,head,tail,g,row,row);
    case 0
    otherwise
       return
end









