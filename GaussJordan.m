A = [2 1 -1; 4 3 1; -2 1 2];
b = [3; 9; 4];
n = length(b);
M = [A b];

% Forward elimination (sama seperti bagian a)
for k = 1:n-1
  for i = k+1:n
    m = M(i,k) / M(k,k);
    M(i,:) = M(i,:) - m * M(k,:);
  end
end
disp('Hasil forward elimination (segitiga atas):'); disp(M);

% Backward elimination
for k = n:-1:1
  M(k,:) = M(k,:) / M(k,k);              % diagonal menjadi 1
  for i = 1:k-1
    M(i,:) = M(i,:) - M(i,k) * M(k,:);   % nolkan elemen di atas diagonal
  end
  printf('\nSetelah backward elimination kolom %d:\n', k); disp(M);
end

x = M(:,n+1);
disp('Solusi:');
for i = 1:n
  printf('x%d = %g\n', i, x(i));
end

