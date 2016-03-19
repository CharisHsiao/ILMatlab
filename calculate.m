function calculate(measure)
%根据选用的计算方法，计算出KS、C、PC、F
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
%                           直接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Direct()
%直接逆子结构法计算KS、C、PC、FT
global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');    %详见消息函数msgbox    modal表示消息框为'模式'模式

matLength  = 401
I=eye(caSize,caSize);  %单位矩阵
%预留临时变量空间
    HscacaTemp=zeros(caSize,caSize);
    HscacbTemp=zeros(caSize,caSize);
    HscbcbTemp=zeros(caSize,caSize);
    HsoacaTemp=zeros(oaSize,caSize);
    HscaibTemp=zeros(caSize,ibSize);

    %预留结果保存变量空间
Ks=zeros(caSize,caSize,matLength);
Hcaca=zeros(caSize,caSize,matLength);
Hcbcb=zeros(caSize,caSize,matLength);
Hoaca=zeros(oaSize,caSize,matLength);
Hcbib=zeros(caSize,ibSize,matLength);
C=zeros(caSize,caSize,matLength);

% 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
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

clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);


%--------------------------------------------------------------------------
%
%                           第一类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_1()
%第一类间接逆子结构法计算KS、C、PC、F、
clear f   Hcaca Hcbcb Hoaca Hcbib Hsoaib
global f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib

matLength=401;
   
    msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');

    I=eye(size,size);
%预留临时变量空间
    HcacaTemp=zeros(size,size);
    HoacaTemp=zeros(size,size);
    HcbcbTemp=zeros(size,size);
    HcbibTemp=zeros(size,size);
    HsoaibTemp=zeros(size,size);
        %预留结果保存变量空间
Ks=zeros(size,size,matLength);
C=zeros(size,size,matLength);

 % 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
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
    C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(Ks(:,:,k).*I));
end

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
%                           第二类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_2 ()
%%第二类间接逆子结构法计算KS、C、PC、F、
%--------------------------------------------------------------------------
%
%                           第三类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_3 ()
%%第三类间接逆子结构法计算KS、C、PC、F、
%--------------------------------------------------------------------------
%
%                           第四类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_4 ()
%%第四类间接逆子结构法计算KS、C、PC、F、
%--------------------------------------------------------------------------
%
%                           第五类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_5 ()
%%第五类间接逆子结构法计算KS、C、PC、F、
