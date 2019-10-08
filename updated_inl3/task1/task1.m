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
% Fit a line to these data points with least squares
% Here you should write code to obtain the p_ls coefficients (assuming the
% line has the form y = p_ls(1) * x + p_ls(2)).
p_ls = (A'*A)\(A'*y)
k= p_ls(1)
m = p_ls(2)
plot(x_fine, k * x_fine + m)

% Fit a line to these data points with total least squares.
% Note that the total least squares line has the form 
% ax + by + c = 0, but the plot command requires it to be of the form
% y = kx + m, so make sure to convert appropriately.
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
p_tls = -[a c]./b % REMOVE AND REPLACE WITH TOTAL LEAST SQUARES
plot(x_fine, p_tls(1) * x_fine + p_tls(2), 'k--')

% Legend --> show which line corresponds to what (if you need to
% re-position the legend, you can modify rect below)
h=legend('data points', 'least-squares','total-least-squares');
rect = [0.20, 0.65, 0.25, 0.25];
set(h, 'Position', rect)

% After having plotted both lines, it's time to compute errors for the
% respective lines. Specifically, for each line (the least squares and the
% total least squares line), compute the least square error and the total
% least square error. Note that the error is the sum of the individual
% errors for each data point! In total you should get 4 errors. Report these
% in your report, and comment on the results. OBS: Recall the distance formula
% between a point and a line from linear algebra, useful when computing orthogonal
% errors!

% WRITE CODE BELOW TO COMPUTE THE 4 ERRORS

ls_ls = norm(y-A*p_ls)^2
ls_tls = norm(y-(p_tls(1) * x + p_tls(2)))^2

tls_tls = sum((a*x+b*y+c).^2)
tls_ls = sum((k*x-y+m).^2)/(sqrt(1+k^2))

