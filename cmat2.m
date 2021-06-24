function C = cmat2(A, alpha) % A is the original adjacency matrix
    N = size(A,1); % A is square; 1 means "the number of rows"
    outdeg=sum(A); % compute vector of out-degrees
    C = zeros(N,N); % C has the same dimensions as A
    % this nested loop goes through all elements of C
    % i.e. it looks at every possible combination of "from"
    % and "to" nodes
    for from=1:N
        for to=1:N
            % probability to go from "from" node to "to" node
            % depends on whether there is an edge going from
            % "from" to "to" and also on the out-degree of
            % the "from" node
            if from==to
                % never stay at the same node
                C(to,from) = 0;
            elseif outdeg(from)>0
                % jump to a random node (with probability
                % alpha) or follow one of the outgoing
                % links (with probability (1-alpha))
                C(to,from) = alpha/(N-1)+(1-alpha)*A(to,from)/outdeg(from);
            else
                % jump to a random node
                C(to,from) = 1/(N-1);
            end
        end
    end
end