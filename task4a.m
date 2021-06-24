clc; clear

A = [ 0 0 1 0 0 1 0 0 0 0; 
      1 0 1 0 0 0 1 1 0 1; 
      0 1 0 1 0 0 1 0 0 0;  
      0 0 0 0 0 0 0 0 0 0;
      0 0 1 1 0 1 0 1 1 1; 
      1 1 1 1 1 0 1 1 0 1;
      0 0 0 0 0 0 0 1 0 0;
      0 0 0 0 1 0 0 0 0 0;
      0 0 0 1 0 0 0 0 0 0;
      0 0 0 0 0 1 0 0 0 0]; % adjacency matrix for our Network

N = size(A,2); % the number of nodes in the network

figure; % create new figure window...
hold on; % ...and make sure that mutiple plotting commands
         % all draw into the same figure

for i=0:100 % during each iteration we
    
    C = cmat2(A,i/100); % matrix C is computed by the function cmat2 where 
    %alpha takes values from 1 to 100 with increment of 0.01


    M = [ C - eye(N,N); % the system matrix...
          ones(1,N) ]; % with a row of 1s added at the bottom
    b = [ zeros(N,1);
              1 ]; % the right-hand side vector
    p = M \ b;%generates the probabilites vector
    
    
    
    plot(i/100,p(1),'ok',i/100,p(2),'ob',i/100,p(3),'or',i/100,p(4),'oc',...
        i/100,p(5),'og',i/100,p(6),'om',i/100,p(7),'^r',i/100,p(8),'^g',...
        i/100,p(9),'^k',i/100,p(10),'^b','MarkerSize',3);
    % plot each component of the probabilities vector for the current value
    % of alpha
    
  
end
legend('1','2','3','4','5','6','7','8','9','10'); % legends
xlabel('alpha');%label the x axis as alpha
hold off;