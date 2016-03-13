function forTestBus3
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
clear;
clc;
global Hscaca Hscacb Hscbcb Hsoaca Hscaib Hsoaib caSize oaSize ibSize
path ='E:\��Ŀ\ֱ��\work\��һ���������mod\��������';
caSize=6;
oaSize=3;
ibSize=8;

 hwait=waitbar(0,'�����У����Ժ�>>>>>>>>');
    Hscaca = loadcbf(path,'Hscaca','ca','ca',caSize,caSize);
    waitbar(1/6,hwait,'������Hscaca');
    Hscacb = loadcbf(path,'Hscacb','ca','cb',caSize,caSize);
    waitbar(2/6,hwait,'������Hscacb');
    Hscbcb = loadcbf(path,'Hscbcb','cb','cb',caSize,caSize);
    waitbar(1/2,hwait,'������Hscbcb');
    Hsoaca = loadcbf(path,'Hsoaca','oa','ca',oaSize,caSize);
    waitbar(4/6,hwait,'������Hsoaca');
    Hscaib = loadcbf(path,'Hscaib','ca','ib',caSize,ibSize);
    waitbar(5/6,hwait,'������Hscaib');
    Hsoaib = loadcbf(path,'Hsoaib','oa','ib',oaSize,ibSize);
    waitbar(1,hwait,'������Hsoaib');
    pause(0.1);
    pre
close(hwait);
clear path;  
DirectMainUI


function pre
global Hscaca Hscacb Hscbcb Hsoaca Hscaib KS caSize oaSize ibSize Hoaca Hcbib C
msg=msgbox('�����У����Ժ�...[������ɺ󱾶Ի����Զ��ر�]','��ʾ', 'help','modal');

I=eye(caSize,caSize);
%Ԥ����ʱ�����ռ�
    HscacaTemp=zeros(caSize,caSize);
    HscacbTemp=zeros(caSize,caSize);
    HscbcbTemp=zeros(caSize,caSize);
    HsoacaTemp=zeros(oaSize,caSize);
    HscaibTemp=zeros(caSize,ibSize);

    %Ԥ�������������ռ�
Ks=zeros(caSize,caSize,401);
Hcaca=zeros(caSize,caSize,401);
Hcbcb=zeros(caSize,caSize,401);
Hoaca=zeros(oaSize,caSize,401);
Hcbib=zeros(caSize,ibSize,401);
C=zeros(caSize,caSize,401);

% ��ʼ����
for k=2:401%kΪ1ʱ������ΪNaN������
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
