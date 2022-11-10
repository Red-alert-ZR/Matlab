for m=100:999
    m1=fix(m/100);
    m2=rem(fix(m/10),10);
    m3=rem(m,10);
    if m==m1*m1*m1+m2*m2*m2+m3*m3*m3
    disp(m)
    end
end
