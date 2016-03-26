function main
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
%------------splash-------------------------
I = imread('splash.jpg');
%input('y=');     %仅用于手动控制开始  变量y无实质作用
time=2000;    %开始界面停留3000毫秒
%% Create splash screen     %使用JAVA生成开始的界面
splashImage = im2java(I);
win = javax.swing.JWindow;
icon = javax.swing.ImageIcon(splashImage);
label = javax.swing.JLabel(icon);
win.getContentPane.add(label);
win.setAlwaysOnTop(true);
win.pack;

%% set the splash image to the center of the screen
screenSize = win.getToolkit.getScreenSize;
screenHeight = screenSize.height;
screenWidth = screenSize.width;
% get the actual splashImage size
imgHeight = icon.getIconHeight;
imgWidth = icon.getIconWidth;
win.setLocation((screenWidth-imgWidth)/2,(screenHeight-imgHeight)/2);
win.show % show the splash screen
% win.toFront %raise the splash window to the top (foreground)

%% controling the duration time    %控制开始界面显示时间  3000毫秒
if ~isempty(time)
    tic;
    while toc < time/1000
    end
    win.dispose()   % close the splash screen
end
%---------------------splash-end--------------------------------

ImportUI    %加载初始选择界面
