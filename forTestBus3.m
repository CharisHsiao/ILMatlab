function forTestBus3
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
clear;
clc;
global Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize
path ='E:\项目\直接\work\归一化后的数据mod\第三辆车';
caSize=6;
oaSize=3;
ibSize=8;

 hwait=waitbar(0,'载入中，请稍后>>>>>>>>');
    Hscaca = loadcbf(path,'Hscaca','ca','ca',caSize,caSize);
    waitbar(1/6,hwait,'已载入Hscaca');
    Hscacb = loadcbf(path,'Hscacb','ca','cb',caSize,caSize);
    waitbar(2/6,hwait,'已载入Hscacb');
    Hscbcb = loadcbf(path,'Hscbcb','cb','cb',caSize,caSize);
    waitbar(1/2,hwait,'已载入Hscbcb');
    Hsoaca = loadcbf(path,'Hsoaca','oa','ca',oaSize,caSize);
    waitbar(4/6,hwait,'已载入Hsoaca');
    Hscaib = loadcbf(path,'Hscaib','ca','ib',caSize,ibSize);
    waitbar(5/6,hwait,'已载入Hscaib');
    Hsoaib = loadcbf(path,'Hsoaib','oa','ib',oaSize,ibSize);
    waitbar(1,hwait,'已载入Hsoaib');
    pause(0.1);
    pre
close(hwait);
clear path;  
DirectMainUI


function pre
global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('计算中，请稍后...[计算完成后本对话框将自动关闭]','提示', 'help','modal');

I=eye(caSize,caSize);
%预留临时变量空间
    HscacaTemp=zeros(caSize,caSize);
    HscacbTemp=zeros(caSize,caSize);
    HscbcbTemp=zeros(caSize,caSize);
    HsoacaTemp=zeros(oaSize,caSize);
    HscaibTemp=zeros(caSize,ibSize);

    %预留结果保存变量空间
Ks=zeros(caSize,caSize,401);
Hcaca=zeros(caSize,caSize,401);
Hcbcb=zeros(caSize,caSize,401);
Hoaca=zeros(oaSize,caSize,401);
Hcbib=zeros(caSize,ibSize,401);
C=zeros(caSize,caSize,401);

% 开始计算
for k=2:401%k为1时计算结果为NaN，跳过
    for i=1:caSize
        for j=1:caSize
            HscacaTemp(i,j)=Hscaca(i,401*(j-1)+k);
            HscacbTemp(i,j)=Hscacb(i,401*(j-1)+k);
            HscbcbTemp(i,j)=Hscbcb(i,401*(j-1)+k);
            if i<=oaSize
                HsoacaTemp(i,j)=Hsoaca(i,401*(j-1)+k);
            end
            if j<=ibSize
                HscaibTemp(i,j)=Hscaib(i,401*(j-1)+k);
            end
        end
    end
            KsTemp=inv(HscacaTemp/(HscacbTemp')*HscbcbTemp-HscacbTemp);
            Ks(:,:,k)=KsTemp;
            Hcaca(:,:,k)=HscacbTemp/(HscbcbTemp-HscacbTemp)/(KsTemp);
            Hcbcb(:,:,k)=HscacbTemp*((HscacbTemp')\HscbcbTemp-I)/(KsTemp);
            Hoaca(:,:,k)=HsoacaTemp/(I-inv(I+HscacaTemp\HscbcbTemp+(HscacaTemp)\inv(KsTemp)));
            Hcbib(:,:,k)=(I+HscbcbTemp/(HscacaTemp)+(KsTemp)\inv(HscacaTemp))*HscaibTemp;
            C(:,:,k)=inv(Hcaca(:,:,k).*I+Hcbcb(:,:,k).*I+inv(Ks(:,:,k).*I));
end

KS=zeros(caSize,401);
for i=1:caSize
    for j=1:401
        KS(i,j)=Ks(i,i,j);
    end
end


clear Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib HscacaTemp HscacbTemp HscbcbTemp HsoacaTemp HscaibTemp KsTemp;
close(msg);
