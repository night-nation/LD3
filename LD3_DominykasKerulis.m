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


A = 5.5;
f = 8;
sigma = 0.8;
U1 = 3.5;
U2 = 1.5;
t = 0 : 0.002 : 1.2;

s_svarus = A * sin(2 * pi * f * t);
n = sigma * randn(size(t));
s = s_svarus + n;                 

s_atrinktas = s(s > U1);          
s_filtruotas = s;
s_filtruotas(abs(s_filtruotas) < U2) = 0;

dydis_s = length(s);
dydis_s_atrinktas = length(s_atrinktas);
max_filtruotas = max(s_filtruotas);
min_filtruotas = min(s_filtruotas);


figure(4);
subplot(1, 2, 1);
plot(t, s_filtruotas, '-', 'LineWidth', 1.25);
hold on;
plot(t, s_svarus, ':', 'LineWidth', 1.25);
yline(U1, '-c', 'LineWidth', 1.25);
yline(U2, '--m', 'LineWidth', 1.25);
yline(-U2, '--m', 'LineWidth', 1.25);
hold off;
grid on;
xlim([t(1), t(end)]);
ylim([min(s) - 1, max(s) + 1]);
xlabel('Laikas t, s');
ylabel('Itampa U, V');
title('Pradinis ir filtruotas signalai', 'Color', 'b', 'FontSize', 13, 'FontWeight', 'bold');
legend('Pradinis signalas', 'Filtruotas signalas', ['U_1 = ', num2str(U1), ' V'], ['U_2 = ', num2str(U2), ' V'], ['-U_2 = ', num2str(-U2), ' V'], 'Location', 'southwest');


subplot(1, 2, 2);
n_idx = 1 : length(s_atrinktas);
stem(n_idx, s_atrinktas, 'filled', 'LineWidth', 1.25);
hold on;

lok_max = islocalmax(s_atrinktas);
lok_min = islocalmin(s_atrinktas);

plot(n_idx(lok_max), s_atrinktas(lok_max), 'd', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 11);
plot(n_idx(lok_min), s_atrinktas(lok_min), 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerSize', 7);
hold off;
grid on;
xlim([1, length(s_atrinktas)]);
ylim([U1 - 0.5, max(s_atrinktas) + 0.5]);
xlabel('Atskaitos numeris n');
ylabel('Itampa U, V');
title('Reiksmes, virsijancios U_1 riba', 'Color', 'b', 'FontSize', 13, 'FontWeight', 'bold');
legend('Atrinktos reiksmes', 'Maksimumai', 'Minimumai', 'Location', 'southwest');