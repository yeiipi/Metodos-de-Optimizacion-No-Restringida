function [x1,x2,x3] = Ajuste_Cuadratico(x1,x2,x3,f,I)
% Ajuste_Cuadratico | Esta función que útiliza el algoritmo de ajuste
%                     cuadrático para soluciónar problemas cuadráticos.
%                     =====================================================
%                     Parámetros:
%                       - x1: punto de busqueda.
%                       - x2: punto de busqueda.
%                       - x3: punto de busqueda.
%                       - I : coeficiente de error aceptable.
%                       - f : la función que se quiere solucionar.

b12 = x1^2 - x2^2;
b31 = x3^2 - x1^2;
b23 = x2^2 - x3^2;

a12 = x1 - x2;
a31 = x3 - x1;
a23 = x2 - x3;

x_ = (b23*f(x1)+b31*f(x2)+b12*f(x3))/(2*(a23*f(x1)+a31*f(x2)+a12*f(x3)));

while x3-x1 >= I
    if x_ > x2
%         disp("Paso 2")
        if  f(x_) >= f(x2)
            x3 = x_;
        elseif f(x_) <= f(x2)
            x1 = x2;
            x2 = x_;
        end
    elseif x_ < x2
%         disp("Paso 3")
        if f(x_) >= f(x2)
            x1 = x_;
        elseif f(x_) <= f(x2)
            x3 = x2;
            x2 = x_;
        end
    elseif x_ == x2
%         disp("Paso 4");
        if x2-x1 < x3-x2
            x_ = x2 + I/2;
        elseif x2-x1 > x3-x2
            x_ = x2 - I/2;
        end
    end
end

end

