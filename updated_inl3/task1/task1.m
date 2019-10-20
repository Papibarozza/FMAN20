% Task 1: Fit least squares and total least squares lines to data points.

% Clear up
clc;
close all;
clearvars;

% Begin by loading data points from linjepunkter.mat
load linjepunkter

% Convenient to have x, y as column vectors
x = x';
y = y';
N = length(x); % number of data points

% Plot data
plot(x, y, '*'); hold on;
xlabel('x') 
ylabel('y')
title('LS and TLS comparison') % OBS - CHANGE TITLE!
x_fine = [min(x)-0.05,max(x)+0.05]; % used when plotting the fitted lines

A = [ x ones(length(x),1)];
%LS
p_ls = (A'*A)\(A'*y)
k= p_ls(1)
m = p_ls(2)
plot(x_fine, k * x_fine + m)
%TLS
e = 1/size(x,1)
x_ss = x'*x;
y_ss = y'*y;
x_s = sum(x)
y_s = sum(y)
xy_ss = x'*y;

A_tls = [x_ss-e*x_s*x_s xy_ss-e*x_s*y_s;xy_ss-e*x_s*y_s y_ss-e*y_s*y_s];

[V,D] = eig(A_tls)
a = V(1,1);
b = V(2,1);
c = -e*(a*x_s+b*y_s);
p_tls = -[a c]./b 
plot(x_fine, p_tls(1) * x_fine + p_tls(2), 'k--')

h=legend('data points', 'least-squares','total-least-squares');
rect = [0.20, 0.65, 0.25, 0.25];
set(h, 'Position', rect)

ls_ls = norm(y-A*p_ls)
ls_tls = norm(y-(p_tls(1) * x + p_tls(2)))

tls_tls = sum(abs(a*x+b*y+c))/sqrt(a^2+b^2)
tls_ls = sum(abs(k*x-y+m))/(sqrt(1+k^2))

