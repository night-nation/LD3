% Dominykas Kerulis, EF-25/2, 2026-09-25
close all
clear all
clc

%==================
% a)
x1 = 0:0.5:2*pi;
y1 = sin(x1) + cos(x1).^2;

figure(1);
plot(x1, y1, 'o-', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'y');
xlabel('x');
ylabel('y');
title('Funkcija f(x) = sin(x) + cos^2(x)');
xlim([min(x1) max(x1)]);
ylim([min(y1) max(y1)]);
grid on;

% b)
x2 = 0:0.01:2;
y2_1 = x2.^exp(1);
y2_2 = x2.^(2*exp(1));
y2_3 = x2.^(3*exp(1));

figure(2);
plot(x2, y2_1, 'b', x2, y2_2, 'g', x2, y2_3, 'r');
xlabel('x');
ylabel('y');
title('Funkcijos f(x) = x^{e}, x^{2e}, x^{3e}');
legend('f(x) = x^e', 'f(x) = x^{2e}', 'f(x) = x^{3e}', 'Location', 'northwest');
set(gca, 'XTick', [0 1 2]);
set(gca, 'YTick', [0 1 max(y2_3)]);
grid on;


%==============

figure(3);
x = -2*pi:0.5:2*pi;
y = x.^3 + sin(x);
 
subplot(1,2,1);
quiver(x, zeros(size(x)), zeros(size(x)), y);
title('y(x) = x^3 + sin(x)');
xlabel('x');
ylabel('y');
grid on;
 
subplot(1,2,2);
bar(x, y);
title('y(x) = x^3 + sin(x)');
xlabel('x');
ylabel('y');
grid on;



%==============

 