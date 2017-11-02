a=imread('KIB1P.jpg');
a=rgb2gray(a);
a=medfilt2(a);
B=binaryCitra(a);
imwrite(B,'Biner Awal/KIB1P.jpg');