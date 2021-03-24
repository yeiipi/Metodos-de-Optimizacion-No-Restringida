function [ak,bk] = Seccion_Aurea(f,ak,bk,I)
% Seccion_Aurea | Esta función utiliza el algoritma de sección aurea para
%                 resolver problemas de programación lineal.
%                 =========================================================
%                 Parámetros:
%                   - f : la función que se quiere solucionar.
%                   - ak: cota de busqueda en la función f.
%                   - bk: cota de busqueda en la función f.
%                   - I : coeficiente de error aceptable.

phi = (1+sqrt(5))/2;
alpha = abs(1 - phi);

lambdak =  ak + (1-alpha)*(bk-ak);
muk = ak+alpha*(bk-ak);untitled
f_lambda = f(lambdak);
f_mu = f(muk);

while abs(bk-ak) > I
    if f_lambda >= f_mu
        ak = lambdak;
        lambdak = muk;
        muk = ak + alpha*(bk-ak);
        f_mu = f(muk);
    else
        bk = muk;
        muk = lambdak;
        lambdak = ak + (1-alpha)*(bk-ak);
        f_lambda = f(lambdak);
    end
end

end

