function [KS C Hoaca Hcbib]=loadcbf2(path,size)
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
global f;

matLength=401;

    hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
    HAcaca = myload2 (path,'HAcaca','HAca','ca',size);
    waitbar(1/5,hwait,'已载入HAcaca');
    HBcbcb = myload2 (path,'HBcbcb','HBcb','cb',size);
    waitbar(2/5,hwait,'已载入HBcbcb');
    HAoaca = myload2 (path,'HAoaca','HAoa','ca',size);
    waitbar(3/5,hwait,'已载入HAoaca');
    HBcbib = myload2 (path,'HBcbib','HBcb','ib',size);
    waitbar(4/5,hwait,'已载入HBcbib');
    Hsoaib = myload2(path,'Hsoaib','Hsoa','ib',size);
    waitbar(1,hwait,'已载入Hsoaib');
    pause(0.1);
    close(hwait);

    msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');
    
%预留临时变量空间
    HAcacaTemp=zeros(size,size);
    HAoacaTemp=zeros(size,size);
    HBcbcbTemp=zeros(size,size);
    HBcbibTemp=zeros(size,size);
    HsoaibTemp=zeros(size,size);    
        %预留结果保存变量空间
Ks=zeros(size,size,matLength);
Hcaca=zeros(size,size,matLength);
Hcbcb=zeros(size,size,matLength);
Hoaca=zeros(size,size,matLength);
Hcbib=zeros(size,size,matLength);
C=zeros(size,size,matLength);
I=eye(size,size);
 % 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
    for i=1:size
        for j=1:size
            HAcacaTemp(i,j) = HAcaca(matLength*(i-1)+k,j);
            HAoacaTemp(i,j) = HAoaca(matLength*(i-1)+k,j);
            HBcbcbTemp(i,j) = HBcbcb(matLength*(i-1)+k,j);
            HBcbibTemp(i,j) = HBcbib(matLength*(i-1)+k,j);
            HsoaibTemp(i,j) = Hsoaib(matLength*(i-1)+k,j);            
        end
    end
    D=HAcacaTemp+HBcbcbTemp;
    Ks(:,:,k)=inv(  HBcbibTemp/(HsoaibTemp)*HAoacaTemp-D  );
    Hcaca(:,:,k)=HAcacaTemp;
    Hcbcb(:,:,k)=HBcbcbTemp;
    Hoaca(:,:,k)=HAoacaTemp;
    Hcbib(:,:,k)=HBcbibTemp;            
    C(:,:,k)=inv(Hcaca(:,:,k).*I+Hcbcb(:,:,k).*I+inv(Ks(:,:,k).*I));
end

KS=zeros(size,matLength);
for i=1:size
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=KS;
 KK=max(1./f(2:401));
 t=15;
 for i=1:size
    for n=(t+1):(length(f)-t-1)    
        KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end    
end
%------------creat Ks-----------------
%         for k=2:400            
%             HAcacaTemp=[HAcaca(k,1) HAcaca(k,2) HAcaca(k,3) HAcaca(k,4);
%                         HAcaca(matLength+k,1) HAcaca(matLength+k,2) HAcaca(matLength+k,3) HAcaca(matLength+k,4);
%                         HAcaca(matLength*2+k,1) HAcaca(matLength*2+k,2) HAcaca(matLength*2+k,3) HAcaca(matLength*2+k,4);
%                         HAcaca(matLength*3+k,1) HAcaca(matLength*3+k,2) HAcaca(matLength*3+k,3) HAcaca(matLength*3+k,4)];
%             HAoacaTemp=[HAoaca(k,1) HAoaca(k,2) HAoaca(k,3) HAoaca(k,4);
%                         HAoaca(matLength+k,1) HAoaca(matLength+k,2) HAoaca(matLength+k,3) HAoaca(matLength+k,4);
%                         HAoaca(matLength*2+k,1) HAoaca(matLength*2+k,2) HAoaca(matLength*2+k,3) HAoaca(matLength*2+k,4);
%                         HAoaca(matLength*3+k,1) HAoaca(matLength*3+k,2) HAoaca(matLength*3+k,3) HAoaca(matLength*3+k,4)];
%             HBcbcbTemp=[HBcbcb(k,1) HBcbcb(k,2) HBcbcb(k,3) HBcbcb(k,4);
%                         HBcbcb(matLength+k,1) HBcbcb(matLength+k,2) HBcbcb(matLength+k,3) HBcbcb(matLength+k,4);
%                         HBcbcb(matLength*2+k,1) HBcbcb(matLength*2+k,2) HBcbcb(matLength*2+k,3) HBcbcb(matLength*2+k,4);
%                         HBcbcb(matLength*3+k,1) HBcbcb(matLength*3+k,2) HBcbcb(matLength*3+k,3) HBcbcb(matLength*3+k,4)];
%             HBcbibTemp=[HBcbib(k,1) HBcbib(k,2) HBcbib(k,3) HBcbib(k,4);
%                         HBcbib(matLength+k,1) HBcbib(matLength+k,2) HBcbib(matLength+k,3) HBcbib(matLength+k,4);
%                         HBcbib(matLength*2+k,1) HBcbib(matLength*2+k,2) HBcbib(matLength*2+k,3) HBcbib(matLength*2+k,4);
%                         HBcbib(matLength*3+k,1) HBcbib(matLength*3+k,2) HBcbib(matLength*3+k,3) HBcbib(matLength*3+k,4)];
%             HsoaibTemp=[Hsoaib(k,1) Hsoaib(k,2) Hsoaib(k,3) Hsoaib(k,4);
%                         Hsoaib(matLength+k,1) Hsoaib(matLength+k,2) Hsoaib(matLength+k,3) Hsoaib(matLength+k,4);
%                         Hsoaib(matLength*2+k,1) Hsoaib(matLength*2+k,2) Hsoaib(matLength*2+k,3) Hsoaib(matLength*2+k,4);
%                         Hsoaib(matLength*3+k,1) Hsoaib(matLength*3+k,2) Hsoaib(matLength*3+k,3) Hsoaib(matLength*3+k,4)];
%             D=HAcacaTemp+HBcbcbTemp;
%             Ks(:,:,k)=-inv(HBcbibTemp/inv(HsoaibTemp)*HAoacaTemp-D);
%             Ks11(k)=Ks(1,1,k);Ks22(k)=Ks(2,2,k);
%             Ks33(k)=Ks(3,3,k);Ks44(k)=Ks(4,4,k);
%             %Hsoaib11(k)=Hsoaib(1,1);->Hsoaib(k,1)
%             %Hsoaib48(k)=Hsoaib(4,4);->Hsoaib(matLength*3+k,4)
%         end
%  clear HAcacaTemp HBcbcbTemp HBcbibTemp HsoaibTemp HAoacaTemp;
% % finish creat Ks(:,:,:)
% KS11=Ks11;KS22=Ks22;
% KS33=Ks33;KS44=Ks44;

% 
% 暂时不平滑
% Moving average---> smoothing results:
% KK=max(1./f(2:matLength));
% t=15;
% for n=(t+1):(length(f)-t-1)
%    KS11(n)=mean(Ks11(n-t:n+t))*(KK/f(n))^(1/5);
%    KS22(n)=mean(Ks22(n-t:n+t))*(KK/f(n))^(1/5);
%    KS33(n)=mean(Ks33(n-t:n+t))*(KK/f(n))^(1/5);
%    KS44(n)=mean(Ks44(n-t:n+t))*(KK/f(n))^(1/5);
% end
% KS11(1:t)=Ks11(1:t);KS22(1:t)=Ks22(1:t);
% KS33(1:t)=Ks33(1:t);KS44(1:t)=Ks44(1:t);


    close(msg);
end
    
    %%
 function ret=myload2(path,name,head,tail,size)
 global f
matLength=401;
    c = mat2cell( zeros(matLength*size,size), matLength*ones(size,1), ones(size,1));
    for i=1:size
        a=num2str(i);
        for j=1:size
            file=[path '\' name '\' head a tail num2str(j) '.mat'];
            if ~exist(file,'file')           
                continue;%set 0
            end
            temp=importdata(file);        
            tempval=temp(:,5)+1i*temp(:,6);
            c{i,j}=tempval;
        end
    end
    ret=cell2mat(c);
     if ~exist('A','var')   
     	f=temp(:,1);
     end
    clear temp tempval c;   
end   
    
