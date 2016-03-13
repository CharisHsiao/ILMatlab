function main
%-------------------------------------------------------------------------------------------
%      Software of indirect inverse sub-structure dynamic analysis based on MATLAB
%                            Copyright ? 2013  by  Manhua Jiang
%-------------------------------------------------------------------------------------------
%------------splash-------------------------
I = imread('splash.jpg');
input('y=');
time=3000;
%% Create splash screen
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

%% controling the duration time
if ~isempty(time)
    tic;
    while toc < time/1000
    end
    win.dispose()   % close the splash screen
end
%---------------------splash-end--------------------------------

ImportUI