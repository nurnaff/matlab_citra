function [pusat_x,pusat_y,luas]=tengah(bin)
[tinggi, lebar] = size(bin);
pusat_x = 0;
pusat_y = 0;
luas = 0;
for q = 1 : tinggi
for p = 1 : lebar
if bin(q, p) == 1
luas = luas + 1;
pusat_x = pusat_x + p;
pusat_y = pusat_y + q;
end
end
end
pusat_x = fix(pusat_x/luas);
pusat_y = fix(pusat_y/luas);
luas;