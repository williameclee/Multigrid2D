function R = residual(U,F,dx)
    R = zeros(size(U));
    R(2:end-1,2:end-1) = (U(1:end-2,2:end-1)+U(3:end,2:end-1)+U(2:end-1,1:end-2)+U(2:end-1,3:end)-4*U(2:end-1,2:end-1))/dx^2-F(2:end-1,2:end-1);
end