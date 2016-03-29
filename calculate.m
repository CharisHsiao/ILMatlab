function [bool] = calculate(measure,g)
%根据选用的计算方法，计算出KS、C、PC、F
switch measure
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



%--------------------------------------------------------------------------
%
%                           直接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Direct(g)
%直接逆子结构法计算KS、C、PC、FT
%global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');    %详见消息函数msgbox    modal表示消息框为'模式'模式

matLength  = 401;
I=eye(g.caSize,g.caSize);  %单位矩阵
%预留临时变量空间
    HscacaTemp=zeros(g.caSize,g.caSize);
    HscacbTemp=zeros(g.caSize,g.caSize);
    HscbcbTemp=zeros(g.caSize,g.caSize);
    HsoacaTemp=zeros(g.oaSize,g.caSize);
    HscaibTemp=zeros(g.caSize,g.ibSize);

    %预留结果保存变量空间
g.Ks=zeros(g.caSize,g.caSize,matLength);
g.Hcaca=zeros(g.caSize,g.caSize,matLength);
g.Hcbcb=zeros(g.caSize,g.caSize,matLength);
g.Hoaca=zeros(g.oaSize,g.caSize,matLength);
g.Hcbib=zeros(g.caSize,g.ibSize,matLength);
g.C=zeros(g.caSize,g.caSize,matLength);

% 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
    for i=1:g.caSize
        for j=1:g.caSize
            HscacaTemp(i,j)=g.Hscaca(i,matLength*(j-1)+k);
            HscacbTemp(i,j)=g.Hscacb(i,matLength*(j-1)+k);
            HscbcbTemp(i,j)=g.Hscbcb(i,matLength*(j-1)+k);
            if i<=g.oaSize
                HsoacaTemp(i,j)=g.Hsoaca(i,matLength*(j-1)+k);
            end
            if j<=g.ibSize
                HscaibTemp(i,j)=g.Hscaib(i,matLength*(j-1)+k);
            end
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

%KS=zeros(g.caSize,matLength);
for i=1:g.caSize
    for j=1:matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);


%--------------------------------------------------------------------------
%
%                           第一类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_1(g)
%第一类间接逆子结构法计算KS、C、PC、F、
%clear f   Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C    %探讨清除的必要性    此处清除的是局部变量
%clear f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C
%global f size  Hcaca Hcbcb Hoaca Hcbib Hsoaib KS C
matLength=401;
global f;
    msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');

    I=eye(g.size,g.size);
%预留临时变量空间
    HcacaTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
    HsoaibTemp=zeros(g.size,g.size);
        %预留结果保存变量空间
g.Ks=zeros(g.size,g.size,matLength);
g.C=zeros(g.size,g.size,matLength);

HoacaT=zeros(g.size,g.size,matLength);
HcbibT=zeros(g.size,g.size,matLength);

 % 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,matLength*(j-1)+k);
            HsoaibTemp(i,j) = g.Hsoaib(i,matLength*(j-1)+k);
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

g.KS=zeros(g.size,matLength);
for i=1:g.size
    for j=1:matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./f(2:matLength));
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
%                           第二类间接逆子结构法
%
%--------------------------------------------------------------------------

function cal_Indirect_2 (g)
%%第二类间接逆子结构法计算KS、C、PC、F、
%clear f  Hoaca Hcaca Hcbcb Hoaia Hsoaia Hscaia Hcbib KS C
%global f size   Hoaca Hcaca Hcbcb Hoaia Hsoaia  Hcbib Hcaia KS C
global f;
matLength=401;

    msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');


    I=eye(g.size,g.size);
%预留临时变量空间
    HoacaTemp=zeros(g.size,g.size);
    HcacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HoaiaTemp=zeros(g.size,g.size);
    HsoaiaTemp=zeros(g.size,g.size);
    HcaiaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);

        %预留结果保存变量空间
g.Ks=zeros(g.size,g.size,matLength);
HoacaT=zeros(g.size,g.size,matLength);
HcbibT=zeros(g.size,g.size,matLength);
g.C=zeros(g.size,g.size,matLength);
 % 开始计算
for k=2:matLength    %k为1时计算结果为NaN，跳过
    for i=1:g.size
        for j=1:g.size
            HoacaTemp(i,j) = g.Hoaca(i,matLength*(j-1)+k);
            HcacaTemp(i,j) = g.Hcaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,matLength*(j-1)+k);
            HoaiaTemp(i,j) = g.Hoaia(i,matLength*(j-1)+k);
            HsoaiaTemp(i,j) = g.Hsoaia(i,matLength*(j-1)+k);
            HcaiaTemp(i,j) = g.Hcaia(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,matLength*(j-1)+k);
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

g.KS=zeros(g.size,matLength);
for i=1:g.size
    for j=1:matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end
% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./f(2:matLength));
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)
       g. KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
 close(msg);



%--------------------------------------------------------------------------
%
%                           第三类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_3 (g)
%%第三类间接逆子结构法计算KS、C、PC、F、
%clear f  Hcaca Hsoaca Hcbcb Hoaca Hcbib KS C
%global f size   Hcaca Hsoaca Hcbcb Hoaca Hcbib KS C
global f;
matLength=401;
    msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');
%预留临时变量空间
    HcacaTemp=zeros(g.size,g.size);
    HsoacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
        %预留结果保存变量空间
g.Ks=zeros(g.size,g.size,matLength);
HoacaT=zeros(g.size,g.size,matLength);
HcbibT=zeros(g.size,g.size,matLength);
C=zeros(g.size,g.size,matLength);


I=eye(g.size,g.size);

 % 开始计算
for k=2:matLength    %k为1时计算结果为NaN，跳过
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,matLength*(j-1)+k);
            HsoacaTemp(i,j) = g.Hsoaca(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,matLength*(j-1)+k);
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

g.KS=zeros(g.size,matLength);
for i=1:g.size
    for j=1:matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end
% Moving average---> smoothing results:
temp= g.KS;
 KK=max(1./f(2:matLength));
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)
        g.KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
 close(msg);


%--------------------------------------------------------------------------
%
%                           第四类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_4 (g)
%%第四类间接逆子结构法计算KS、C、PC、F、
%clear f   Hcaca Hcbcb Hscaca Hcbib Hoaca KS C
%global f size  Hcaca Hcbcb Hscaca Hcbib Hoaca KS C
global f;
matLength=401;

    msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');

    I=eye(g.size,g.size);
%预留临时变量空间
    HcacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HscacaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
        %预留结果保存变量空间
g.Ks=zeros(g.size,g.size,matLength);
g.C=zeros(g.size,g.size,matLength);

HcbibT=zeros(g.size,g.size,matLength);
HoacaT=zeros(g.size,g.size,matLength);

 % 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,matLength*(j-1)+k);
            HscacaTemp(i,j) = g.Hscaca(i,matLength*(j-1)+k);
        end
    end

    HcbibT(:,:,k)=HcbibTemp;
    HoacaT(:,:,k)=HoacaTemp;

    D=HcacaTemp+HcbcbTemp;
    Iac=I-HscacaTemp/(HcacaTemp);
    g.Ks(:,:,k)=inv(Iac\HcacaTemp-D);    %使用建议语法
    g.C(:,:,k)=inv(HcacaTemp.*I+HcbcbTemp.*I+inv(g.Ks(:,:,k).*I));
end

g.Hcbib=HcbibT;
g.Hoaca=HoacaT;

g.KS=zeros(g.size,matLength);
for i=1:g.size
    for j=1:matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./f(2:matLength));
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
%                           第五类间接逆子结构法
%
%--------------------------------------------------------------------------
function cal_Indirect_5 (g)
%clear f   Hcaca Hcbcb Hcaia  Hscaia Hcbib Hoaca KS C
%global f size Hcaca Hcbcb Hcaia  Hscaia Hcbib Hoaca KS C
global f;
matLength=401;

 msg=msgbox('载入计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');

    I=eye(g.size,g.size);
%预留临时变量空间
    HcacaTemp=zeros(g.size,g.size);
    HcbcbTemp=zeros(g.size,g.size);
    HcaiaTemp=zeros(g.size,g.size);
    HscaiaTemp=zeros(g.size,g.size);
    HcbibTemp=zeros(g.size,g.size);
    HoacaTemp=zeros(g.size,g.size);
        %预留结果保存变量空间
g.Ks=zeros(g.size,g.size,matLength);
g.C=zeros(g.size,g.size,matLength);

HcbibT=zeros(g.size,g.size,matLength);
HoacaT=zeros(g.size,g.size,matLength);

 % 开始计算
for k=2:matLength%k为1时计算结果为NaN，跳过
    for i=1:g.size
        for j=1:g.size
            HcacaTemp(i,j) = g.Hcaca(i,matLength*(j-1)+k);
            HcbcbTemp(i,j) = g.Hcbcb(i,matLength*(j-1)+k);
            HcaiaTemp(i,j) = g.Hcaia(i,matLength*(j-1)+k);
            HscaiaTemp(i,j) = g.Hscaia(i,matLength*(j-1)+k);
            HcbibTemp(i,j) = g.Hcbib(i,matLength*(j-1)+k);
            HoacaTemp(i,j) = g.Hoaca(i,matLength*(j-1)+k);
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

g.KS=zeros(g.size,matLength);
for i=1:g.size
    for j=1:matLength
        g.KS(i,j)=g.Ks(i,i,j);
    end
end

% Moving average---> smoothing results:
temp=g.KS;
 KK=max(1./f(2:matLength));%指第二个到四百零一个
 t=15;
 for i=1:g.size
    for n=(t+1):(length(f)-t-1)  %length(f)获取f中行数或列数中的最大值
        g.KS(i,n)=mean(temp(i,(n-t:n+t)))*(KK/f(n))^(1/5);
    end
end
%clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);
