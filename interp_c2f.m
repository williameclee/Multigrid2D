function E = interp_c2f(U, Ec)
    E = zeros(size(U));
    [Xc, Yc] = meshgrid(linspace(0, 1, length(Ec)));
    [X, Y] = meshgrid(linspace(0, 1, length(E)));
    E = interp2(Xc, Yc, Ec, X, Y);
end
