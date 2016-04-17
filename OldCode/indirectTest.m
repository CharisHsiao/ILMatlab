function indirectTest
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
global size KS C Hoaca Hcbib
path ='E:\项目\直接\work\间接数据';
size=4;
[KS C Hoaca Hcbib]=loadcbf2(path,size);
IndirectMainUI