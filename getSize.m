function [ result ] = getSize(g_1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

switch g_1.method 
    case 0
    defaultanswer={'6','3','8'};
    sizeParameter=inputdlg({'��ϵ���','��Ӧ����','��������'},'�趨����',1,defaultanswer);
    if(isempty(sizeParameter))%������ж���bug,ȡ������ô����
        result = 0;
    else 
        g_1.caSize=str2num(sizeParameter{1});    %��������Ĵ�С����ֵ
         g_1.oaSize=str2num(sizeParameter{2});
         g_1.ibSize=str2num(sizeParameter{3});
     result = 1;
    end
    case {1 2 3 4 5}       
        defaultanswer={'2'};
            sizeParameter=inputdlg({'����'},'�趨����',1,defaultanswer);
        %������ж���bug,ȡ������ô����
        if(isempty(sizeParameter))    
           result = 0; 
        else
             g_1.size=str2num(sizeParameter{1});
             result  = 1;
        end
end

