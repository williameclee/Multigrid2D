%% Setup
U = double(imread('image.tif')) / 256;
U = U(:, :, 1);
U(1:2, :) = 0;
U(end - 1:end, :) = 0;
U(:, 1:2) = 0;
U(:, end - 1:end) = 0;

F = zeros(size(U));
dx = 1 / (size(U, 1) - 1);
F(2:end - 1, 2:end - 1) = ...
    (U(1:end - 2, 2:end - 1) + U(3:end, 2:end - 1) + U(2:end - 1, 1:end - 2) + U(2:end - 1, 3:end) ...
    - 4 * U(2:end - 1, 2:end - 1)) / dx ^ 2;

%% Iterate solution
s = 3; % times of multigrid iteration
UMtg = zeros(size(U));
EMtg = zeros(1, s);
TMtg = zeros(1, s);
UMtgRec = zeros([size(U), s]);
tic

for r = 1:s
    UMtg = multigrid(UMtg, F, dx);
    EMtg(r) = mean(abs(UMtg - U), "all");
    TMtg(r) = toc;
    UMtgRec(:, :, r) = UMtg;
end

%% Display solution
figure(1)
clf
subplot(1, 2, 1)
imagesc(U)
colorbar
clim([0, 1])
title('Target solution')

subplot(1, 2, 2)
imagesc(UMtg)
colorbar
clim([0, 1])
title(['Multigrid solution, s = ', num2str(s)])

% disp(EMtg);
% imagesc(UMtg)
