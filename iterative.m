function itr = iterative(I)

I = double(I(:));

%step 1 mean dari keseluruhan image
[pix,index] = hist(I,256);
i = 1;
muA = cumsum(pix);
T(i)= (sum(index.*pix))/muA(end);

%step2 membagi menjadi 2 bagian dental dan background

mu1 = cumsum(pix(index <=T(i)));
MB = sum(index(index<=T(i)).*pix(index <=T(i)))/mu1(end);

mu2 = cumsum(pix(index >T(i)));
MD = sum(index(index>T(i)).*pix(index >T(i)))/mu2(end);
%MAT = sum(N(N>T(i)).*counts(N>T(i)))/mu3(end);
i = i + 1;

T(i) = (MB + MD)/2;

%step 3 ulangi langkah kedua sampai T(i) = T(i -1) or T(i) = T(i+1)
itr = T(i);
while abs(T(i)-T(i-1))>=1
    mu1 = cumsum(pix(index<=T(i)));
    MB = sum(index(index<=T(i)).*pix(index<=T(i)))/mu1(end);

    mu2 = cumsum(pix(index>=T(i)));
    MD = sum(index(index>=T(i)).*pix(index>=T(i)))/mu2(end);
    i = i + 1;
    T(i) = (MB + MD)/2;
    itr = T(i);
end
    
    
    

    