# matlab-2dmultigrid

For a evenly-spaced $N\times N$ matrix $\textbf{U}$ that satisfy the following Poisson's equation:
$$
    \frac{\partial u(x,y)}{\partial x}+\frac{\partial u(x,y)}{\partial y}=f(x,y),
$$
where the grid is squared, i.e., $\Delta x=\Delta y$, $\textbf{U}$ can be solved with the Gauss-Seidel method, which is accelerated with the multigrid method in this case.