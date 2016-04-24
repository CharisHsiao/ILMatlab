function [bool] = calculate(g)
%����ѡ�õļ��㷽���������KS��C��PC��F
switch g.method
    case 0
        cal_Direct(g);
        bool = 1;
    case 1
        cal_Indirect_1(g);
        bool = 1;
    case 2
        cal_Indirect_2(g);
        bool = 1;
    case 3
        cal_Indirect_3(g);
        bool = 1;
    case 4
        cal_Indirect_4(g);
        bool = 1;
    case 5
        cal_Indirect_5(g)
        bool = 1;
    otherwise
        bool = 0;
end
cal_PC(g);
cal_FT(g);



%--------------------------------------------------------------------------
%
%                           ֱ�����ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Direct(g)
%ֱ�����ӽṹ������KS��C��PC��FT
%global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('�����У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');    %�����Ϣ����msgbox    modal��ʾ��Ϣ��Ϊ'ģʽ'ģʽ

% matLength  = 401;
I=eye(g.caSize,g.caSize);  %��λ����
%Ԥ����ʱ�����ռ�
    HscacaTemp=zeros(g.caSize,g.caSize);
    HscacbTemp=zeros(g.caSize,g.caSize);
    HscbcbTemp=zeros(g.caSize,g.caSize);
    HsoacaTemp=zeros(g.oaSize,g.caSize);
    HscaibTemp=zeros(g.caSize,g.ibSize);

    %Ԥ�������������ռ�
g.Ks=zeros(g.caSize,g.caSize,g.matLength);
g.Hcaca=zeros(g.caSize,g.caSize,g.matLength);
g.Hcbcb=zeros(g.caSize,g.caSize,g.matLength);
g.Hoaca=zeros(g.oaSize,g.caSize,g.matLength);
g.Hcbib=zeros(g.caSize,g.ibSize,g.matLength);
g.C=zeros(g.caSize,g.caSize,g.matLength);

% ��ʼ����
for k=2:g.matLength%kΪ1ʱ������ΪNaN������
    for i=1:g.caSize
        for j=1:g.caSize
            HscacaTemp(i,j)=g.Hscaca(i,g.matLength*(j-1)+k);
             HscacbTemp(i,j)=g.Hscacb(i,g.matLength*(j-1)+k);
             HscbcbTemp(i,j)=g.Hscbcb(i,g.matLength*(j-1)+k);
%             if i<=g.oaSize
%                 HsoacaTemp(i,j)=g.Hsoaca(i,g.matLength*(j-1)+k);
%             end
%             if j<=g.ibSize
%                 HscaibTemp(i,j)=g.Hscaib(i,g.matLength*(j-1)+k);
%             end
         end
    end
      for i=1:g.oaSize
        for j=1:g.caSize
                HsoacaTemp(i,j)=g.Hsoaca(i,g.matLength*(j-1)+k);
        end
      end
     for i=1:g.caSize
        for j=1:g.ibSize
                HscaibTemp(i,j)=g.Hscaib(i,g.matLength*(j-1)+k);
        end
      end
    
            KsTemp=inv(HscacaTemp/(HscacbTemp')*HscbcbTemp-HscacbTemp);
            g.Ks(:,:,k)=KsTemp;
            g.Hcaca(:,:,k)=HscacbTemp/(HscbcbTemp-HscacbTemp)/(KsTemp);
            g.Hcbcb(:,:,k)=HscacbTemp*((HscacbTemp')\HscbcbTemp-I)/(KsTemp);
            g.Hoaca(:,:,k)=HsoacaTemp/(I-inv(I+g.Hcaca(:,:,k)\g.Hcbcb(:,:,k)+(g.Hcaca(:,:,k))\inv(KsTemp)));
            g.Hcbib(:,:,k)=(I+g.Hcbcb(:,:,k)/(g.Hcaca(:,:,k))+(KsTemp)\inv(g.Hcaca(:,:,k)))*HscaibTemp;
            g.C(:,:,k)=inv(g.Hcaca(:,:,k).*I+g.Hcbcb(:,:,k).*I+inv(g.Ks(:,:,k).*I));
end

%KS=zeros(g.caSize,g.matLength);
for i=1:g.caSize
    for j=1:g.matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);


%--------------------------------------------------------------------------
%
%                           ��һ�������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_1(g)
%��һ�������ӽṹ������KS��C��PC��F��
%clear f   Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C    %̽������ı�Ҫ��    �˴�������Ǿֲ�����
%clear f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C
%global f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C
%matLength=401;
%global f;
    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

    I=eye(g.size,g.size);
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
    HsoaibTemp=zeros(g.size,g.size);
        %Ԥ�������������ռ�
g.Ks=zeros(g.size,g.size,g.matLength);
g.C=zeros(g.size,g.size,g.matLength);

HoacaT=zeros(g.size,g.size,g.matLength);
HcbibT=zeros(g.size,g.size,g.matLength);

 % ��ʼ����
for k=2:g.matLength%kΪ1ʱ������ΪNaN������
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,g.matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,g.matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,g.matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,g.matLength*(j-1)+k);
            HsoaibTemp(i,j) = g.Hsoaib(i,g.matLength*(j-1)+k);
        end
    end
    D=HcacaTemp+HcbcbTemp;
    g.Ks(:,:,k)=inv(  HcbibTemp/(HsoaibTemp)*HoacaTemp-D  );

    HoacaT(:,:,k)=HoacaTemp;
    HcbibT(:,:,k)=HcbibTemp;

    g.C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(g.Ks(:,:,k).*I));
end

g.Hoaca=HoacaT;
g.Hcbib=HcbibT;

g.KS=zeros(g.size,g.matLength);
for i=1:g.size
    for j=1:g.matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./g.f(2:g.matLength));
 t=15;
 for i=1:g.size
    for n=(t+1):(length(g.f)-t-1)
        g.KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/g.f(n))^(1/5);
    end
end

%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);



%--------------------------------------------------------------------------
%
%                           �ڶ��������ӽṹ��
%
%--------------------------------------------------------------------------

function cal_Indirect_2 (g)
%%�ڶ��������ӽṹ������KS��C��PC��F��
%clear f  Hoaca Hcaca Hcbcb Hoaia Hsoaia Hscaia Hcbib KS C
%global f size   Hoaca Hcaca Hcbcb Hoaia Hsoaia  Hcbib Hcaia KS C
global f;
%matLength=401;

    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');


    I=eye(g.size,g.size);
%Ԥ����ʱ�����ռ�
    HoacaTemp=zeros(g.size,g.size);
    HcacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HoaiaTemp=zeros(g.size,g.size);
    HsoaiaTemp=zeros(g.size,g.size);
    HcaiaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);

        %Ԥ�������������ռ�
g.Ks=zeros(g.size,g.size,g.matLength);
HoacaT=zeros(g.size,g.size,g.matLength);
HcbibT=zeros(g.size,g.size,g.matLength);
g.C=zeros(g.size,g.size,g.matLength);
 % ��ʼ����
for k=2:g.matLength    %kΪ1ʱ������ΪNaN������
    for i=1:g.size
        for j=1:g.size
            HoacaTemp(i,j) = g.Hoaca(i,g.matLength*(j-1)+k);
            HcacaTemp(i,j) = g.Hcaca(i,g.matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,g.matLength*(j-1)+k);
            HoaiaTemp(i,j) = g.Hoaia(i,g.matLength*(j-1)+k);
            HsoaiaTemp(i,j) = g.Hsoaia(i,g.matLength*(j-1)+k);
            HcaiaTemp(i,j) = g.Hcaia(i,g.matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,g.matLength*(j-1)+k);
        end
    end
    D=HcacaTemp+HcbcbTemp;
    g.Ks(:,:,k)=inv(HcaiaTemp*inv(HoaiaTemp - HsoaiaTemp)*HoacaTemp -D);
    HoacaT(:,:,k)=HoacaTemp;
    HcbibT(:,:,k)=HcbibTemp;

    g.C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(g.Ks(:,:,k).*I));
end

    g.Hoaca=HoacaT;
    g.Hcbib=HcbibT;

g.KS=zeros(g.size,g.matLength);
for i=1:g.size
    for j=1:g.matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end
% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./g.f(2:g.matLength));
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)
       g. KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
 close(msg);



%--------------------------------------------------------------------------
%
%                           �����������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_3 (g)
%%�����������ӽṹ������KS��C��PC��F��
%clear f  Hcaca Hsoaca Hcbcb Hoaca Hcbib KS C
%global f size   Hcaca Hsoaca Hcbcb Hoaca Hcbib KS C
global f;
%matLength=401;
    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(g.size,g.size);
    HsoacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
        %Ԥ�������������ռ�
g.Ks=zeros(g.size,g.size,g.matLength);
HoacaT=zeros(g.size,g.size,g.matLength);
HcbibT=zeros(g.size,g.size,g.matLength);
C=zeros(g.size,g.size,g.matLength);


I=eye(g.size,g.size);

 % ��ʼ����
for k=2:g.matLength    %kΪ1ʱ������ΪNaN������
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,g.matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,g.matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,g.matLength*(j-1)+k);
            HsoacaTemp(i,j) = g.Hsoaca(i,g.matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,g.matLength*(j-1)+k);
        end
    end
    D=HcacaTemp+HcbcbTemp;
    IA=I-HsoacaTemp/HoacaTemp;
    g.Ks(:,:,k)=inv(  HcacaTemp*inv(IA)-D  );
    HoacaT(:,:,k)=HoacaTemp;
    HcbibT(:,:,k)=HcbibTemp;
    g.C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(g.Ks(:,:,k).*I));
end

g.Hcbib=HcbibT;
g.Hoaca=HoacaT;

g.KS=zeros(g.size,g.matLength);
for i=1:g.size
    for j=1:g.matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end
% Moving average---> smoothing results:
temp= g.KS;
 KK=max(1./g.f(2:g.matLength));
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)
        g.KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
 close(msg);


%--------------------------------------------------------------------------
%
%                           �����������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_4 (g)
%%�����������ӽṹ������KS��C��PC��F��
%clear f   Hcaca Hcbcb Hscaca Hcbib Hoaca KS C
%global f size  Hcaca Hcbcb Hscaca Hcbib Hoaca KS C
global f;
%matLength=401;

    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

    I=eye(g.size,g.size);
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HscacaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
        %Ԥ�������������ռ�
g.Ks=zeros(g.size,g.size,g.matLength);
g.C=zeros(g.size,g.size,g.matLength);

HcbibT=zeros(g.size,g.size,g.matLength);
HoacaT=zeros(g.size,g.size,g.matLength);

 % ��ʼ����
for k=2:g.matLength%kΪ1ʱ������ΪNaN������
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,g.matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,g.matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,g.matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,g.matLength*(j-1)+k);
            HscacaTemp(i,j) = g.Hscaca(i,g.matLength*(j-1)+k);
        end
    end

    HcbibT(:,:,k)=HcbibTemp;
    HoacaT(:,:,k)=HoacaTemp;

    D=HcacaTemp+HcbcbTemp;
    Iac=I-HscacaTemp/(HcacaTemp);
    g.Ks(:,:,k)=inv(Iac\HcacaTemp-D);    %ʹ�ý����﷨
    g.C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(g.Ks(:,:,k).*I));
end

g.Hcbib=HcbibT;
g.Hoaca=HoacaT;

g.KS=zeros(g.size,g.matLength);
for i=1:g.size
    for j=1:g.matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./g.f(2:g.matLength));
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)
        g.KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);



%--------------------------------------------------------------------------
%
%                           �����������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_5 (g)
%clear f   Hcaca Hcbcb Hcaia  Hscaia Hcbib Hoaca KS C
%global f size Hcaca Hcbcb Hcaia  Hscaia Hcbib Hoaca KS C
global f;
%matLength=401;

 msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

    I=eye(g.size,g.size);
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HcaiaTemp=zeros(g.size,g.size);
    HscaiaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
        %Ԥ�������������ռ�
g.Ks=zeros(g.size,g.size,g.matLength);
g.C=zeros(g.size,g.size,g.matLength);

HcbibT=zeros(g.size,g.size,g.matLength);
HoacaT=zeros(g.size,g.size,g.matLength);

 % ��ʼ����
for k=2:g.matLength%kΪ1ʱ������ΪNaN������
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,g.matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,g.matLength*(j-1)+k);
            HcaiaTemp(i,j) = g.Hcaia(i,g.matLength*(j-1)+k);
            HscaiaTemp(i,j) = g.Hscaia(i,g.matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,g.matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,g.matLength*(j-1)+k);
        end
    end

    HcbibT(:,:,k)=HcbibTemp;
    HoacaT(:,:,k)=HoacaTemp;

    D=HcacaTemp+HcbcbTemp;
    IAci=I-HscaiaTemp* inv(HcaiaTemp);
    g.Ks(:,:,k)=inv( inv(IAci)*HcacaTemp-D);

    g.C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(g.Ks(:,:,k).*I));
end

g.Hcbib=HcbibT;
g.Hoaca=HoacaT;

g.KS=zeros(g.size,g.matLength);
for i=1:g.size
    for j=1:g.matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./g.f(2:g.matLength));%ָ�ڶ������İ���һ��
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)  %length(f)��ȡf�������������е����ֵ
        g.KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);




function  cal_PC(g)
  %  global matLength Hoaca Hcbib 
%   matLength = 401;
  if isequal(g.method,0) 
      g.PC = zeros(g.oaSize,g.ibSize,g.caSize);
    for ib = 1:g.ibSize
        for oa = 1:g.oaSize
            %g.PC(oa,ib) = zeros(g.caSize,1);
            for j=1:g.caSize
                temp=0;
                for k=1:g.matLength
                     temp=temp+(g.Hoaca(oa,j,k)*g.C(j,j,k)*g.Hcbib(j,ib,k))^2;
                end
                g.PC(oa,ib,j)= sqrt(temp/g.matLength);
            end
        end
    end
  else
      g.PC = zeros(g.size,g.size,g.size,1);
      for ib = 1:g.size
        for oa = 1:g.size
           % g.PC(oa,ib) = zeros(g.size,1);
            for j=1:g.size
                temp=0;
                for k=1:g.matLength
                     temp=temp+(g.Hoaca(oa,j,k)*g.C(j,j,k)*g.Hcbib(j,ib,k))^2;
                end
                g.PC(oa,ib,j)= sqrt(temp/g.matLength);
            end
        end
      end
  end
%           
            
   function  cal_FT(g)
       % global matLength ibSize cbSize size C Hcbib    
%        matLength  = 401;
        if(isequal(g.method,0))
            m=g.ibSize;  %��   8
            n=g.caSize;  %ǰ  6
        else 
            m =  g.size;
            n = g.size;
        end
        g.FT = zeros(n,m);   %(6,8)  
       for i = 1:m   % 8
        for j = 1:n   %6
          temp=0;         
          for k=1:g.matLength
            temp=temp+(g.C(j,j,k)*g.Hcbib(j,i,k))^2;
          end
               g.FT(j,i)= sqrt(temp/g.matLength);
        end
      end
temp=0;















       %  for i = 1:m
       %   for j = 1:n
       %       temp = 0;
       %       for k = 1:g.matLength
       %           temp = temp + C(i,i,k)*Hcbib(i,j,k);
       %       end
       %       FT(i,j) = temp;
       %   end
       %end