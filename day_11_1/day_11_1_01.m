%非线性规划

[x,y] = fmincon('fun1',rand(3,1),[],[],[],[],zeros(3,1),[],'fun2')
