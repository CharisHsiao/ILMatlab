function [ result ] = getSize(g_1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

switch g_1.method 
    case 0
    defaultanswer={'6','3','8'};
    sizeParameter=inputdlg({'耦合点数','响应点数','激励点数'},'设定参数',1,defaultanswer);
    if(isempty(sizeParameter))%这里的判断有bug,取消了怎么处理？
        result = 0;
    else 
        g_1.caSize=str2num(sizeParameter{1});    %读出输入的大小并赋值
         g_1.oaSize=str2num(sizeParameter{2});
         g_1.ibSize=str2num(sizeParameter{3});
     result = 1;
    end
    case {1 2 3 4 5}       
        defaultanswer={'2'};
            sizeParameter=inputdlg({'点数'},'设定参数',1,defaultanswer);
        %这里的判断有bug,取消了怎么处理？
        if(isempty(sizeParameter))    
           result = 0; 
        else
             g_1.size=str2num(sizeParameter{1});
             result  = 1;
        end
end

