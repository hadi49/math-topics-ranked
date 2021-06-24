clc; clear

A = [ 0 0 1 0 0 1 0 0 0 0; 
      1 0 1 0 0 0 1 1 0 1; 
      0 1 0 1 0 0 1 0 0 0;  
      0 0 0 0 0 0 0 0 0 0;
      0 0 1 1 0 1 0 1 1 1; 
      1 1 1 1 1 0 1 1 0 1;
      0 0 0 0 0 0 0 1 0 0;
      0 0 0 0 1 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 1 0 0 0 0]; % adjacency matrix for our Network
C = cmat2(A,0.19); % matrix C is computed by the function cmat1

N = size(A,2); % the number of nodes in the network

M = [ C - eye(N,N); % the system matrix...
      ones(1,N) ]; % with a row of 1s added at the bottom
b = [ zeros(N,1);
          1 ]; % the right-hand side vector
  
p = M \ b