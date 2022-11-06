pwd

clear
clc
%矩阵w为钢材铁道的运输方式
w=zeros(39,39);c=zeros(39,39);c2=zeros(39,39);
w(1,29)=20;w(1,30)=202;w(2,30)=1200;w(3,31)=690;w(4,34)=690;w(5,33)=462;
w(6,38)=70;w(7,39)=30;w(23,25)=450;w(24,25)=80;w(25,27)=1150;
w(26,28)=306;w(27,30)=1100;w(28,29)=195;w(30,31)=720;w(31,32)=520;
w(32,34)=170;w(33,34)=88;w(34,36)=160;w(35,36)=70;w(36,37)=320;
w(37,38)=160;w(38,39)=290;

w = w+w';
for i=1:39
    for j=1:39
        if (i~=j) && w(i,j)==0
            w(i,j) = 200000;
        end
    end
end
[w] = Floyd_algorithm(w);%利用弗洛伊德算法求出最小距离
c1=w;%c1接受w的值

%列出c1的限制
for i=1:39
    for j=1:39
        if c1(i,j)==0 
            c1(i,j)=0;
        end
        if c1(i,j)>0 && c1(i,j)<=300
            c1(i,j)=20;
        end
        if c1(i,j)>300 && c1(i,j)<=350
            c1(i,j)=23;
        end
        if c1(i,j)>350 && c1(i,j)<=400
            c1(i,j)=26;
        end
        if c1(i,j)>400 && c1(i,j)<=450
            c1(i,j)=29;
        end
        if c1(i,j)>450 && c1(i,j)<=500
            c1(i,j)=32;
        end
        if c1(i,j)>500 && c1(i,j)<=600
            c1(i,j)=37;
        end
        if c1(i,j)>600 && c1(i,j)<=700
            c1(i,j)=44;
        end
        if c1(i,j)>700 && c1(i,j)<=800
            c1(i,j)=50;
        end
        if c1(i,j)>800 && c1(i,j)<=900
            c1(i,j)=55;
        end
        if c1(i,j)>900 && c1(i,j)<=1000
            c1(i,j)=60;
        end
        %当距离大于1000时，特别注意临界值！！！
        if c1(i,j)>1000 && rem(c1(i,j),100)==0
            c1(i,j)=(floor((c1(i,j)-1000)/100))*5+60;
        end
        if c1(i,j)>1000 && rem(c1(i,j),100)~=0
            c1(i,j)=(floor((c1(i,j)-1000)/100))*5+65;
        end
    end

end

%c2为钢材公路运输最短距离矩阵
c2(1,14)=31;c2(6,21)=110;c2(7,22)=20;c2(8,9)=104;c2(9,10)=301;c2(9,23)=3;
c2(10,11)=750;c2(10,24)=2;c2(11,12)=606;c2(11,27)=600;c2(12,13)=194;
c2(12,26)=10;c2(13,14)=205;c2(13,28)=5;c2(14,15)=201;c2(14,29)=10;
c2(15,16)=680;c2(15,30)=12;c2(16,17)=480;c2(16,31)=42;c2(17,18)=300;
c2(17,32)=70;c2(18,19)=220;c2(18,33)=10;c2(19,20)=210;c2(19,35)=10;
c2(20,21)=420;c2(20,37)=62;c2(21,22)=500;c2(21,38)=30;c2(22,39)=20;
c2=c2+c2';

for i=1:39
    for j=1:39
        if (i~=j) && c2(i,j)==0
            c2(i,j) = 200000;
        end
    end
end

[c2] = Floyd_algorithm(c2);%同样利用弗洛伊德算法
c3 =c2;
c2 = 0.1*c2;%求出公路运输费用

for i=1:39
    for j=1:39
        if c1(i,j)<c2(i,j)
            c(i,j)=c1(i,j);
        end
        if c1(i,j)>c2(i,j)
            c(i,j)=c2(i,j);
        end
        if c1(i,j)==c2(i,j)
            c(i,j)=c2(i,j);
        end
    end
end
[c] = Floyd_algorithm(c);
%因为钢材铁路运输费用呈分段函数；
%钢材公路运输费用呈线性函数
%拟合两个结果需要用第三次弗洛伊德算法

for i=1:39
    for j=1:39
        if (i<=7)&&(j>=8)&&(j<=22)
            dist(i,j-7) = c(i,j);%求出最后的各个钢材厂与施工点的最小运送费用
        end
    end
end


xlswrite('D:\matlab\MATLAB\day_11_6\1.xlsx',dist,'sheet1','b3:p9');
%xlswrite('D:\matlab\MATLAB\day_11_6\1.xlsx',w,'sheet2','b4:AN42');
%xlswrite('D:\matlab\MATLAB\day_11_6\1.xlsx',c1,'sheet2','b54:AN92');
%xlswrite('D:\matlab\MATLAB\day_11_6\1.xlsx',c3,'sheet3','b4:AN42');
%xlswrite('D:\matlab\MATLAB\day_11_6\1.xlsx',c2,'sheet3','b54:AN92');
%xlswrite('D:\matlab\MATLAB\day_11_6\1.xlsx',c,'sheet4','b4:AN42');
