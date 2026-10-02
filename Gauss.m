A = [2 1 -1; 4 3 1; -2 1 2];
b = [3; 9; 4];
n = length(b);
M = [A b];
disp('Matriks awal [A|b]:'); disp(M);

% Forward elimination
for k = 1:n-1
  for i = k+1:n
    m = M(i,k) / M(k,k);
    printf('m%d%d = %g\n', i, k, m);
    M(i,:) = M(i,:) - m * M(k,:);
  end
  printf('\nSetelah eliminasi kolom %d:\n', k); disp(M);
end

% Substitusi mundur
x = zeros(n,1);
for i = n:-1:1
  x(i) = (M(i,n+1) - M(i,i+1:n) * x(i+1:n)) / M(i,i);
end

disp('Solusi:');
for i = 1:n
  printf('x%d = %g\n', i, x(i));
end

