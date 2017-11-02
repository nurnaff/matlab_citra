function [crop] = adaptivethreshold2(A);

[bar,kol]= size(A);
win = 100;
win2 = 100/2;
D(bar+win,kol+win)=0;
D =uint8(D);
[x,y]=size(D);
D(win2+1:x-win2,win2+1:y-win2)=A(1:bar,1:kol);
N = 100;
[H,W]= size(D);
out = zeros(H,W);
N2 = floor(N/2);

h = waitbar(0,'Proses Threshold...[estimasi 55 detik]');



for i = 1+N2:H-N2;
  for j = 1+N2:W-N2;
     
         sub = D(i-N2:i+N2,j-N2:j+N2);
        %sub=A(i,j);
        SA = sum(sum(sub));
        B = find(sub);
        [m,n]=size(B);
        T = (SA/m);
        thresh1 = 0.9*T;
        if D(i,j) >= thresh1
            out(i,j) = 1;
        else 
            out(i,j) = 0;
        end
  end
   waitbar(i/H-N2)
end
close(h)
crop = imcrop(out,[51 51 kol-1 bar-1]);