function [ bool ] = GenerateExcel( WordParameters )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%传进来的参数 WordParameter 是一个结构体
%结构体WordParameter的内容包括
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

        