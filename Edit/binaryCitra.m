function [D] = binaryCitra(img)

Im = img;
%figure, imshow(Im), title('gambar asli');
Ed = edge(Im,'canny');
se = strel('square',2);
DE = imdilate(Ed,se);
%figure,imshow(DE);
DE = uint8(DE);
 mask1 = Im.*DE;
T1  = mean2(mask1);

T2 = iterative(Im);
OT = (Im>T2); %Original iterative Thresholding
TF = (T2 + T1)/2; % Fusion Thresholding mean edge + iterative
ImF = (Im>TF); %
%figure,imshow(ImF);
ImF1 = uint8(ImF);
mask2 = Im.*ImF1;
%figure,imshow(mask2),title('mask2');
%Adaptive Thresholding
[D]=adaptivethreshold2(mask2);
%imwrite(D,'9a.tif');