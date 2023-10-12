function path_len = decode(code, D, n)
    path_len = 0;
    for j = 2:n
        path_len = path_len + D(code(j-1), code(j));
    end
    path_len = path_len + D(code(n), code(1));
end