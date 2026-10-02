A = [2 1 -1; 4 3 1; -2 1 2];
b = [3; 9; 4];
n = length(b);
L = eye(n);
U = A;

% Forward elimination, simpan pengali ke L
for k = 1:n-1
  for i = k+1:n
    m = U(i,k) / U(k,k);
    L(i,k) = m;
    printf('m%d%d = %g\n', i, k, m);
    U(i,:) = U(i,:) - m * U(k,:);
  end
end

disp('L ='); disp(L);
disp('U ='); disp(U);
disp('L*U ='); disp(L*U);
if norm(L*U - A) < 1e-12
  disp('Terbukti A = LU');
end

% Ly = b (forward substitution)
y = zeros(n,1);
for i = 1:n
  y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
end
disp('y ='); disp(y);

% Ux = y (backward substitution)
x = zeros(n,1);
for i = n:-1:1
  x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
end

disp('Solusi:');
for i = 1:n
  printf('x%d = %g\n', i, x(i));
end

