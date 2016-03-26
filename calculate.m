function calculate(measure)
%����ѡ�õļ��㷽���������KS��C��PC��F
switch measure
    case 0
        cal_Direct()
    case 1
        cal_Indirect_1()
    case 2
        cal_Indirect_2()
    case 3
        cal_Indirect_3()
    case 4
        cal_Indirect_4()
    case 5
        cal_Indirect_5()
    otherwise
        return
end



%--------------------------------------------------------------------------
%
%                           ֱ�����ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Direct()
%ֱ�����ӽṹ������KS��C��PC��FT
global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('�����У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');    %�����Ϣ����msgbox    modal��ʾ��Ϣ��Ϊ'ģʽ'ģʽ

matLength  = 401;
I=eye(caSize,caSize);  %��λ����
%Ԥ����ʱ�����ռ�
    HscacaTemp=zeros(caSize,caSize);
    HscacbTemp=zeros(caSize,caSize);
    HscbcbTemp=zeros(caSize,caSize);
    HsoacaTemp=zeros(oaSize,caSize);
    HscaibTemp=zeros(caSize,ibSize);

    %Ԥ�������������ռ�
Ks=zeros(caSize,caSize,matLength);
Hcaca=zeros(caSize,caSize,matLength);
Hcbcb=zeros(caSize,caSize,matLength);
Hoaca=zeros(oaSize,caSize,matLength);
Hcbib=zeros(caSize,ibSize,matLength);
C=zeros(caSize,caSize,matLength);

% ��ʼ����
for k=2:matLength%kΪ1ʱ������ΪNaN������
    for i=1:caSize
        for j=1:caSize
            HscacaTemp(i,j)=Hscaca(i,matLength*(j-1)+k);
            HscacbTemp(i,j)=Hscacb(i,matLength*(j-1)+k);
            HscbcbTemp(i,j)=Hscbcb(i,matLength*(j-1)+k);
            if i<=oaSize
                HsoacaTemp(i,j)=Hsoaca(i,matLength*(j-1)+k);
            end
            if j<=ibSize
                HscaibTemp(i,j)=Hscaib(i,matLength*(j-1)+k);
            end
        end
    end
            KsTemp=inv(HscacaTemp/(HscacbTemp')*HscbcbTemp-HscacbTemp);
            Ks(:,:,k)=KsTemp;
            Hcaca(:,:,k)=HscacbTemp/(HscbcbTemp-HscacbTemp)/(KsTemp);
            Hcbcb(:,:,k)=HscacbTemp*((HscacbTemp')\HscbcbTemp-I)/(KsTemp);
            Hoaca(:,:,k)=HsoacaTemp/(I-inv(I+Hcaca(:,:,k)\Hcbcb(:,:,k)+(Hcaca(:,:,k))\inv(KsTemp)));
            Hcbib(:,:,k)=(I+Hcbcb(:,:,k)/(Hcaca(:,:,k))+(KsTemp)\inv(Hcaca(:,:,k)))*HscaibTemp;
            C(:,:,k)=inv(Hcaca(:,:,k).*I+Hcbcb(:,:,k).*I+inv(Ks(:,:,k).*I));
end

KS=zeros(caSize,matLength);
for i=1:caSize
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end

%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);


%--------------------------------------------------------------------------
%
%                           ��һ�������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_1()
%��һ�������ӽṹ������KS��C��PC��F��
%clear f   Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C    %̽������ı�Ҫ��    �˴�������Ǿֲ�����
clear f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C
global f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C

matLength=401;

    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

    I=eye(size,size);
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(size,size);
    HoacaTemp=zeros(size,size);
    HcbcbTemp=zeros(size,size);
    HcbibTemp=zeros(size,size);
    HsoaibTemp=zeros(size,size);
        %Ԥ�������������ռ�
Ks=zeros(size,size,matLength);
C=zeros(size,size,matLength);

HoacaT=zeros(size,size,matLength);
HcbibT=zeros(size,size,matLength);

 % ��ʼ����
for k=2:matLength%kΪ1ʱ������ΪNaN������
    for i=1:size
        for j=1:size
            HcacaTemp(i,j) = Hcaca(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = Hoaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = Hcbcb(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = Hcbib(i,matLength*(j-1)+k);
            HsoaibTemp(i,j) = Hsoaib(i,matLength*(j-1)+k);
        end
    end
    D=HcacaTemp+HcbcbTemp;
    Ks(:,:,k)=inv(  HcbibTemp/(HsoaibTemp)*HoacaTemp-D  );

    HoacaT(:,:,k)=HoacaTemp;
    HcbibT(:,:,k)=HcbibTemp;

    C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(Ks(:,:,k).*I));
end

Hoaca=HoacaT;
Hcbib=HcbibT;

KS=zeros(size,matLength);
for i=1:size
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=KS;
 KK=max(1./f(2:matLength));
 t=15;
 for i=1:size
    for n=(t+1):(length(f)-t-1)
        KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end

%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);



%--------------------------------------------------------------------------
%
%                           �ڶ��������ӽṹ��
%
%--------------------------------------------------------------------------

function cal_Indirect_2 ()
%%�ڶ��������ӽṹ������KS��C��PC��F��
clear f  Hoaca Hcaca Hcbcb Hoaia Hsoaia Hscaia Hcbib KS C
global f size   Hoaca Hcaca Hcbcb Hoaia Hsoaia  Hcbib Hcaia KS C

matLength=401;

    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');


    I=eye(size,size);
%Ԥ����ʱ�����ռ�
    HoacaTemp=zeros(size,size);
    HcacaTemp=zeros(size,size);
    HcbcbTemp=zeros(size,size);
    HoaiaTemp=zeros(size,size);
    HsoaiaTemp=zeros(size,size);
    HcaiaTemp=zeros(size,size);
    HcbibTemp=zeros(size,size);

        %Ԥ�������������ռ�
Ks=zeros(size,size,matLength);
HoacaT=zeros(size,size,matLength);
HcbibT=zeros(size,size,matLength);
C=zeros(size,size,matLength);
 % ��ʼ����
for k=2:matLength    %kΪ1ʱ������ΪNaN������
    for i=1:size
        for j=1:size
            HoacaTemp(i,j) = Hoaca(i,matLength*(j-1)+k);
            HcacaTemp(i,j) = Hcaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = Hcbcb(i,matLength*(j-1)+k);
            HoaiaTemp(i,j) = Hoaia(i,matLength*(j-1)+k);
            HsoaiaTemp(i,j) = Hsoaia(i,matLength*(j-1)+k);
            HcaiaTemp(i,j) = Hcaia(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = Hcbib(i,matLength*(j-1)+k);
        end
    end
    D=HcacaTemp+HcbcbTemp;
    Ks(:,:,k)=inv(HcaiaTemp*inv(HoaiaTemp - HsoaiaTemp)*HoacaTemp -D);
    HoacaT(:,:,k)=HoacaTemp;
    HcbibT(:,:,k)=HcbibTemp;

    C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(Ks(:,:,k).*I));
end

    Hoaca=HoacaT;
    Hcbib=HcbibT;

KS=zeros(size,matLength);
for i=1:size
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end
% Moving average---> smoothing results:
temp=KS;
 KK=max(1./f(2:matLength));
 t=15;
 for i=1:size
    for n=(t+1):(length(f)-t-1)
        KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
 close(msg);



%--------------------------------------------------------------------------
%
%                           �����������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_3 ()
%%�����������ӽṹ������KS��C��PC��F��
clear f  Hcaca Hsoaca Hcbcb Hoaca Hcbib KS C
global f size   Hcaca Hsoaca Hcbcb Hoaca Hcbib KS C

matLength=401;
    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(size,size);
    HsoacaTemp=zeros(size,size);
    HcbcbTemp=zeros(size,size);
    HoacaTemp=zeros(size,size);
    HcbibTemp=zeros(size,size);
        %Ԥ�������������ռ�
Ks=zeros(size,size,matLength);
HoacaT=zeros(size,size,matLength);
HcbibT=zeros(size,size,matLength);
C=zeros(size,size,matLength);


I=eye(size,size);

 % ��ʼ����
for k=2:matLength    %kΪ1ʱ������ΪNaN������
    for i=1:size
        for j=1:size
            HcacaTemp(i,j) = Hcaca(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = Hoaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = Hcbcb(i,matLength*(j-1)+k);
            HsoacaTemp(i,j) = Hsoaca(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = Hcbib(i,matLength*(j-1)+k);
        end
    end
    D=HcacaTemp+HcbcbTemp;
    IA=I-HsoacaTemp/HoacaTemp;
    Ks(:,:,k)=inv(  HcacaTemp*inv(IA)-D  );
    HoacaT(:,:,k)=HoacaTemp;
    HcbibT(:,:,k)=HcbibTemp;
    C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(Ks(:,:,k).*I));
end

Hcbib=HcbibT;
Hoaca=HoacaT;

KS=zeros(size,matLength);
for i=1:size
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end
% Moving average---> smoothing results:
temp=KS;
 KK=max(1./f(2:matLength));
 t=15;
 for i=1:size
    for n=(t+1):(length(f)-t-1)
        KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
 close(msg);


%--------------------------------------------------------------------------
%
%                           �����������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_4 ()
%%�����������ӽṹ������KS��C��PC��F��
clear f   Hcaca Hcbcb Hscaca Hcbib Hoaca KS C
global f size  Hcaca Hcbcb Hscaca Hcbib Hoaca KS C

matLength=401;

    msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

    I=eye(size,size);
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(size,size);
    HcbcbTemp=zeros(size,size);
    HscacaTemp=zeros(size,size);
    HcbibTemp=zeros(size,size);
    HoacaTemp=zeros(size,size);
        %Ԥ�������������ռ�
Ks=zeros(size,size,matLength);
C=zeros(size,size,matLength);

HcbibT=zeros(size,size,matLength);
HoacaT=zeros(size,size,matLength);

 % ��ʼ����
for k=2:matLength%kΪ1ʱ������ΪNaN������
    for i=1:size
        for j=1:size
            HcacaTemp(i,j) = Hcaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = Hcbcb(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = Hcbib(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = Hoaca(i,matLength*(j-1)+k);
            HscacaTemp(i,j) = Hscaca(i,matLength*(j-1)+k);
        end
    end

    HcbibT(:,:,k)=HcbibTemp;
    HoacaT(:,:,k)=HoacaTemp;

    D=HcacaTemp+HcbcbTemp;
    Iac=I-HscacaTemp/(HcacaTemp);
    Ks(:,:,k)=inv(Iac\HcacaTemp-D);    %ʹ�ý����﷨
    C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(Ks(:,:,k).*I));
end

Hcbib=HcbibT;
Hoaca=HoacaT;

KS=zeros(size,matLength);
for i=1:size
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=KS;
 KK=max(1./f(2:matLength));
 t=15;
 for i=1:size
    for n=(t+1):(length(f)-t-1)
        KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);



%--------------------------------------------------------------------------
%
%                           �����������ӽṹ��
%
%--------------------------------------------------------------------------
function cal_Indirect_5 ()
clear f   Hcaca Hcbcb Hcaia  Hscaia Hcbib Hoaca KS C
global f size Hcaca Hcbcb Hcaia  Hscaia Hcbib Hoaca KS C

matLength=401;

 msg=msgbox('��������У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

    I=eye(size,size);
%Ԥ����ʱ�����ռ�
    HcacaTemp=zeros(size,size);
    HcbcbTemp=zeros(size,size);
    HcaiaTemp=zeros(size,size);
    HscaiaTemp=zeros(size,size);
    HcbibTemp=zeros(size,size);
    HoacaTemp=zeros(size,size);
        %Ԥ�������������ռ�
Ks=zeros(size,size,matLength);
C=zeros(size,size,matLength);

HcbibT=zeros(size,size,matLength);
HoacaT=zeros(size,size,matLength);

 % ��ʼ����
for k=2:matLength%kΪ1ʱ������ΪNaN������
    for i=1:size
        for j=1:size
            HcacaTemp(i,j) = Hcaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = Hcbcb(i,matLength*(j-1)+k);
            HcaiaTemp(i,j) = Hcaia(i,matLength*(j-1)+k);
            HscaiaTemp(i,j) = Hscaia(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = Hcbib(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = Hoaca(i,matLength*(j-1)+k);
        end
    end

    HcbibT(:,:,k)=HcbibTemp;
    HoacaT(:,:,k)=HoacaTemp;

    D=HcacaTemp+HcbcbTemp;
    IAci=I-HscaiaTemp* inv(HcaiaTemp);
    Ks(:,:,k)=inv( inv(IAci)*HcacaTemp-D);

    C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(Ks(:,:,k).*I));
end

Hcbib=HcbibT;
Hoaca=HoacaT;

KS=zeros(size,matLength);
for i=1:size
    for j=1:matLength
        KS(i,j)=Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=KS;
 KK=max(1./f(2:matLength));%ָ�ڶ������İ���һ��
 t=15;
 for i=1:size
    for n=(t+1):(length(f)-t-1)  %length(f)��ȡf�������������е����ֵ
        KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);
