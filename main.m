clc
clear
close all
% Author: Wonjoong Cheon
%%
[filename, pathname] = uigetfile({'*.tif'},'Select Background film image');
Film_BG = imread(fullfile(pathname, filename));
color_channel = 'red';

if(strcmp(color_channel, 'red'))
    Film_BG = Film_BG(:,:,1);    
elseif(strcmp(color_channel, 'green'))
    Film_BG = Film_BG(:,:,2);
elseif(strcmp(color_channel, 'blue'))
    Film_BG = Film_BG(:,:,3);
end


%%
[filename_irr, pathname_irr] = uigetfile({'*.tif'},'Select Irrdiated film image');
Film_IRR = imread(fullfile(pathname_irr, filename_irr));
color_channel = 'red';

if(strcmp(color_channel, 'red'))
    Film_IRR = Film_IRR(:,:,1);    
elseif(strcmp(color_channel, 'green'))
    Film_IRR = Film_IRR(:,:,2);
elseif(strcmp(color_channel, 'blue'))
    Film_IRR = Film_IRR(:,:,3);
end
%%
Film_Subtraction = Film_BG - Film_IRR;

%%
profile_line = 940;
figure, subplot(3,2,1), imshow(Film_BG, [])
subplot(3,2,3), imshow(Film_IRR, [])
subplot(3,2,5), imshow(Film_Subtraction, [])
%
subplot(3,2,2), plot(Film_BG(1:560, profile_line))
subplot(3,2,4), plot(Film_IRR(1:560, profile_line))
subplot(3,2,6), plot(Film_Subtraction(1:560, profile_line))



