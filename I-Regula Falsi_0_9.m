pkg load interval
% RF    Finds  single  roots  of  a  function  in  given  range.
%
%           RF(func,a,b,tol)
%
%           Uses an interval version of Regula Falsi Family method (Pegasus) to provide
%           rigorous  bounds  on  the single  roots  of  a  function  f.
%           Bounds are displayed as they are found.
%           Roots  are  displayed  if  radius  of  enclosure  <  tol
%           or if enclosure is no longer becoming tighter.   
%
%          INPUT:    f        function  of  nonlinear equation.
%                    a,b      limits of the interval containing the root.             
%                    tol      used as stopping criterion.
%
function [root,It] = RF(f,a, b,  tol)
It=0;ItMax=50;
fa=f(a);
if fa == 0; root=infsup(a,a); return; end
fb=f(b);
if fb == 0; root=infsup(b,b); return; end
if fa*fb > 0
   'Root is not bracketed in (a,b)'
   x=infsup(NaN, NaN);
   return;
end
x=b;fx=fb;
while 1
   It=It+1;dx=-fx/(fb-fa)*(b-a);
   x=x+dx;fx=f(x);
   % [It,a,b,x,fx,dx]
   if  fx == 0.0 
       root=infsup(x, x);
       width0=wid(root)
     break
   end
   if fx*fb <0 
     a=b;fa=fb;
   else
     fa=fa/(1+fx/fb)^2;
   end
   b=x; fb=fx;
   % Conversion to interval by infimum and supremum computed 
   % such that root is enclosed in [root] interval 
   if a < b   
       root=infsup(a, b);
   else
       root=infsup(b, a);
   end 
  if or(wid(root) < tol, It >  ItMax ) 
     width=wid(root)
     break
  end
end
if It > ItMax 
  Erro=1
else
  Erro=0
end
endfunction