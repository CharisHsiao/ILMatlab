function [ bool ] = GenerateExcel( WordParameters )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%�������Ĳ��� WordParameter ��һ���ṹ��
%�ṹ��WordParameter�����ݰ���
global g_1 s method LoadSflag

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

        