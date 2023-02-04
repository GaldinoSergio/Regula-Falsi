function [x,It] = RF(f,a, b,  tol)
fa=f(a);fb=f(b);
x=b;fx=fb;It=0;ItMax=50;
while 1
   It=It+1;dx=-fx/(fb-fa)*(b-a);
   x=x+dx;fx=f(x);
   % [It,a,b,x,fx,dx]
   %   if or(abs(dx) < tol , abs(fx) < tol , It >  ItMax , fx== 0.0) 
   if or(abs(dx) < tol, It >  ItMax , fx== 0.0) 
     break
   end
   if fx*fb <0 
     a=b;fa=fb;
   else
     fa=fa*fb/(fb+fx);
   end
   b=x; fb=fx;
end
if It > ItMax 
  Erro=1
else
  Erro=0
end
endfunction