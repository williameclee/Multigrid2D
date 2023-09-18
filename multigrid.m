function U = multigrid(U, F, dx)
    s = 3;

    for r = 1:s
        U = gaussseidel(U, F, dx);
    end

    R = residual(U, F, dx);
    Rc = R(1:2:end, 1:2:end);

    if length(Rc) - 1 > 2
        Ec = multigrid(zeros(size(Rc)), Rc, 2 * dx);
    else
        Ec = gaussseidel(zeros(size(Rc)), Rc, 2 * dx);
    end

    E = interp_c2f(U, Ec);
    U = U - E;

    for r = 1:s
        U = gaussseidel(U, F, dx);
    end

end
