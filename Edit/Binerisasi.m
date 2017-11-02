a=imread('KIA1P.jpg');
a=medfilt2(a);
B=binaryCitra(a);
imwrite(B,'Biner/KIA1P.jpg');