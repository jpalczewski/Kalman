data = dlmread('output.csv', ';');
data(1,:) = [];
Gx = data(:,1);
Gy = data(:,2);
Sx = data(:,3);
Sy = data(:,4);
Kx = data(:,5);
Ky = data(:,6);
%wykres x
%roznica w wartosciach
dx_kal_gen = Gx - Kx;
dy_kal_gen = Gy - Ky;
dx_sen_gen = Gx - Sx;
dy_sen_gen = Gy - Sy;
%std dev
std_dev_x_kal_gen = std(dx_kal_gen)
std_dev_y_kal_gen = std(dy_kal_gen)
std_dev_x_sen_gen = std(dx_sen_gen)
std_dev_y_sen_gen = std(dy_sen_gen)
%plots
figure()
plot([:,1:rows(Gy)]', Sx,"k","linestyle",":",   [:,1:rows(Gy)]', Gx, "r","linewidth", 2,  [:,1:rows(Gy)]', Kx,"b","linewidth", 2)
legend('{\fontsize{12} generator}','{\fontsize{12} kalman}','{\fontsize{12} sensor}')
title("plot x","fontsize", 16)
xlabel("sample","fontsize", 12)
ylabel("value","fontsize", 12)
%wykres y
figure()
plot([:,1:rows(Gy)]', Sy,"linestyle",":","k",   [1:rows(Gy)]', Gy, "r","linewidth", 2,  [:,1:rows(Gy)]', Ky,"b","linewidth", 2)
legend('{\fontsize{12} generator}','{\fontsize{12} kalman}','{\fontsize{12} sensor}')
title("plot y","fontsize", 16)
xlabel("sample","fontsize", 12)
ylabel("value","fontsize", 12)
figure()
plot(Sx, Sy,"k","linestyle",":",  Gx, Gy, "r","linewidth", 2,  Kx, Ky,"b","linewidth", 2)
legend('{\fontsize{12} generator}','{\fontsize{12} kalman}','{\fontsize{12} sensor}')
title("path","fontsize", 16)
xlabel("X","fontsize", 12)
ylabel("Y","fontsize", 12)