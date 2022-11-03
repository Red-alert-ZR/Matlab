clear
clc
pwd


a =     [0  50  Inf  40  25  10;
         50  0   15  20  Inf 25;
         Inf 15  0   10  20  Inf;
         40  20  10  0   10  25;
         25  Inf 20  10  0   55;
         10  25  Inf 25  55  0;];
 [D,path,min1,path1]=floyd(a,2,5)
