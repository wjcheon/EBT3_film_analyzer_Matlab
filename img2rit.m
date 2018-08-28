function [] = img2rit( imgs_ ,length_of_area_,filename_,outputsize_)
%   Author : Wonjoong Jason Cheon
%   Date : 2017-05-15
%   Detailed explanation goes here
%   imgs_ : 2D dose distribution [2D matrix]
%   length_of_area_ : Size of 2D dose distribution matrix in real space [cm]
%   filename_ : Filename for saving [string]
%   outputsize_ : Size of dimension for output 2D dose distribution [pixel] 
% 
% if size(imgs_,3) > 1 
%     im = mean(imgs_,3);
% else
%     im = imresize(double(imgs_),outputsize_/size(imgs_,1));
% end
im = imgs_;
%
im_type = 'RIT113 V4.x';
%
ip.row = size(im,1);
ip.col = size(im,2);
ip.ps = [length_of_area_/size(im,1), length_of_area_/size(im,2)];
ip.unit = 'cm';
ip.data_format = 'double';
ip.data_scan = [];
ip.version = 4.00;
ip.def_filt ='';
%
save(filename_,'im','im_type','ip')
figure, imshow(im,[]), colormap(jet)
end