function [ bool ] = GenerateExcel( g, select )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%�������Ĳ��� WordParameter ��һ���ṹ��
%�ṹ��WordParameter�����ݰ���
%global g_1 s method LoadSflag  %��Ҫglobal ��Ϊÿ�ο��Դ�������ͬproject�����excel������

%select  %KS FT PC C Ks

if(isempty(g.KS) || isempty(g.PC) || isempty(g.FT))
    bool = 0;
    return;
end

path=uigetdir('','����·��');
dataname = datestr(now, 30);  %29
% dataname
filename = [path '\' dataname '.xlsx'];
% filename
k = sum(select);
i = 0;
hwait=waitbar(0/k,'���ڵ��������Ժ�>>>>>>>>');
if(select(1,1))
    xlswrite(filename, g.KS, 'KS');
    %pause(1);
    i = i+1;
    waitbar(i/k,hwait,'�ѵ���KS');
end

if(select(1,2))
    xlswrite(filename, g.FT, 'FT');
    %pause(1);
    i = i+1;
    waitbar(i/k,hwait,'�ѵ���FT');
end

if(select(1,3))
    temp = cell(g.oaSize * g.ibSize + 1 ,2 + g.caSize);
    temp(1,1:3) = {'oa', 'ib', 'ca'};  %��ͷ
    temp1 =zeros(1,3);
    counter = 2;  %excel���м���
    for i = 1:g.oaSize
        for j = 1:g.ibSize
            temp(counter,1:2) = {i, j};
            for m = 1:g.caSize;
                temp(counter,m+2)={num2str(g.PC(i,j,m))};
            end
            counter = counter +1;
        end
    end
    xlswrite(filename, temp, 'PC');
    %pause(1);
    i = i+1;
    waitbar(i/k,hwait,'�ѵ���PC');
end

pause(0.3);
close(hwait);
bool = 1;

try
     Excel=actxGetRunningServer('Excel.Application');
catch
     Excel = actxserver('Excel.Application'); 
end
Workbooks = Excel.Workbooks;

if exist(filename,'file');
    Workbook = invoke(Workbooks,'Open',filename);
else
    Workbook = invoke(Workbooks, 'Add');
    Workbook.SaveAs(filename);
end
Sheets = Excel.ActiveWorkBook.Sheets; %���ع�������
Count = Excel.ActiveWorkbook.Sheets.Count;%���ع��������ж��ٹ�������
%�����������������������޸�
%Sheets.Item(1).Name = '��֪��';%������Ϊ��һ����������������Ϊ��֪��,
Sheets.Item(1).Delete;%ɾ����1ҳ�Ĺ�����
Excel.ActiveWorkbook.Save;
Excel.ActiveWorkbook.Close;
Excel.Quit;
Excel.delete;



%{
if(GenarateWordHead(WordParamters)&&GenerateWordFigure(WordParameters)&&GenerateWordHead(WordParameters))
bool = true;
else
    bool = false;
end

end

function bool = GenerateWordHead(WordParameters)
global g_1 s method LoadSflag
end


function bool GenerateWordFigure(WordParameters)
global g_1 s method LoadSflag
end

function bool GenerateWordHead(WordParameters)
global g_1 s method LoadSflag
end

Excel = actxGetRunningServer('Excel.Application');
Excel = actxserver('Excel.Application');
Excel.visible = 1;
%}


