function nabla = make_derivatives_mine(W, H)

N = W * H;

row = zeros(1, 4 * N);
col = zeros(1, 4 * N);
val = zeros(1, 4 * N);
cnt = 1;
for c = 1:W
    for r = 1:H
        n = r + (c-1) * W;
        
        % p_ij^x
        row(cnt) = n;
        col(cnt) = n;
        val(cnt) = -1;
        cnt = cnt + 1;
        
        % p_ij^y
        row(cnt) = N + n;
        col(cnt) = n;
        val(cnt) = -1;
        cnt = cnt + 1;
        
        % -p_i-1j^x
        if (r<H)
            row(cnt) = n;
            col(cnt) = n+1;
            val(cnt) = 1;
            cnt = cnt + 1;
        end
        
        % -p_ij-1^y
        if (c<W)
            row(cnt) = N + n;
            col(cnt) = n + H;
            val(cnt) = 1;
            cnt = cnt + 1;
        end
    end
end

row = row(1:cnt-1);
col = col(1:cnt-1);
val = val(1:cnt-1);

nabla = sparse(row, col, val, 2*N, N);