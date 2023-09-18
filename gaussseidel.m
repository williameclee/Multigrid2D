function U_next = gaussseidel(U,F,dx)
    U_next = U;
    for i = 2:size(U,1)-1
        for j = 2:size(U,1)-1
            U_next(i,j) = (U(i-1,j)+U(i+1,j)+U_next(i,j-1)+U_next(i,j+1)-dx^2*F(i,j))/4;
        end
    end
end