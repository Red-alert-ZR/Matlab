%第二问
%建立liaoch函数

function f = liaoch(x)
a = [1.25 8.75 0.5 5.75 3 7.25];
b = [1.25 0.75 4.75 5 6.5 7.75];
d = [3 5 4 7 6 11];
e = [20 20];
f1 = 0;

for i = 1:6
    s(i) = sqrt((x(13)-a(i))^2+(x(14)-b(i))^2);
    f1 = s(i)*x(i)+f1;
end
f2 = 0;
for i = 7:12
    s(i) = sqrt((x(15)-a(i-6))^2+(x(16)-b(i-6))^2);
    f2 = s(i)*x(i)+f2;
end
f = f1+f2;
