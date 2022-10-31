f = [-20 -10];
A = [5 4;2 5];
B = [24 13];
lb = [0 0];

[x,fval,status] = intprog(f,A,B,[1,2],[],[],lb)
