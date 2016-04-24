function [ bool ] = GenerateExcel( g, select )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%传进来的参数 WordParameter 是一个结构体
%结构体WordParameter的内容包括
%global g_1 s method LoadSflag  %不要global 因为每次可以传进来不同project类进行excel的生成

%select  %KS FT PC C Ks

if(isempty(g.KS) || isempty(g.PC) || isempty(g.FT))
    bool = 0;
    return;
end

path=uigetdir('','保存路径');
dataname = datestr(now, 30);  %29
% dataname
filename = [path '\' dataname '.xlsx'];
% filename
k = sum(select);
i = 0;
hwait=waitbar(0/k,'正在导出，请稍后>>>>>>>>');
if(select(1,1))
    xlswrite(filename, g.KS, 'KS');
    %pause(1);
    i = i+1;
    waitbar(i/k,hwait,'已导出KS');
end

if(select(1,2))
    xlswrite(filename, g.FT, 'FT');
    %pause(1);
    i = i+1;
    waitbar(i/k,hwait,'已导出FT');
end

if(select(1,3))
    temp = cell(g.oaSize * g.ibSize + 1 ,2 + g.caSize);
    temp(1,1:3) = {'oa', 'ib', 'ca'};  %表头
    temp1 =zeros(1,3);
    counter = 2;  %excel中行计数
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
    waitbar(i/k,hwait,'已导出PC');
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
Sheets = Excel.ActiveWorkBook.Sheets; %返回工作表句柄
Count = Excel.ActiveWorkbook.Sheets.Count;%返回工作簿中有多少工作表数
%重命名，其他工作表类似修改
%Sheets.Item(1).Name = '已知点';%将排序为第一个工作表名字命名为已知点,
Sheets.Item(1).Delete;%删除第1页的工作表
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


