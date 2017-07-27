function ssf = SSF(T,mu_t,sdc)
% SSF Compute the spectral shape factor
%
%   ssf = SSF(T,mu_t,sdc) Calculates the spectral shape factor using the values
%       in Tables 7-1a and 7-1b of FEMA P695. User must provide the fundamental
%       period of the archetype (`T`), the period-based ductility (`mu_t`), and
%       the seismic design category (`sdc`).
%
switch sdc
    case 'Dmax'
        Z_SSF = [
            1.00 1.05 1.10 1.13 1.18 1.22 1.28 1.33
            1.00 1.05 1.11 1.14 1.20 1.24 1.30 1.36
            1.00 1.06 1.11 1.15 1.21 1.25 1.32 1.38
            1.00 1.06 1.12 1.16 1.22 1.27 1.35 1.41
            1.00 1.06 1.13 1.17 1.24 1.29 1.37 1.44
            1.00 1.07 1.13 1.18 1.25 1.31 1.39 1.46
            1.00 1.07 1.14 1.19 1.27 1.32 1.41 1.49
            1.00 1.07 1.15 1.20 1.28 1.34 1.44 1.52
            1.00 1.08 1.16 1.21 1.29 1.36 1.46 1.55
            1.00 1.08 1.16 1.22 1.31 1.38 1.49 1.58
            1.00 1.08 1.17 1.23 1.32 1.40 1.51 1.61 ];
    case {'Dmin','Cmax','Cmin','Bmax','Bmin'}
        Z_SSF = [
            1.00 1.02 1.04 1.06 1.08 1.09 1.12 1.14
            1.00 1.02 1.05 1.07 1.09 1.11 1.13 1.16
            1.00 1.03 1.06 1.08 1.10 1.12 1.15 1.18
            1.00 1.03 1.06 1.08 1.11 1.14 1.17 1.20
            1.00 1.03 1.07 1.09 1.13 1.15 1.19 1.22
            1.00 1.04 1.08 1.10 1.14 1.17 1.21 1.25
            1.00 1.04 1.08 1.11 1.15 1.18 1.23 1.27
            1.00 1.04 1.09 1.12 1.17 1.20 1.25 1.30
            1.00 1.05 1.10 1.13 1.18 1.22 1.27 1.32
            1.00 1.05 1.10 1.14 1.19 1.23 1.30 1.35
            1.00 1.05 1.11 1.15 1.21 1.25 1.32 1.37 ];
    otherwise
        error('Unknown Seismic Design Category')
end

assert(mu_t>=1,'mu_t must be greater than or equal to 1')

X_mu_t = [1.0 1.1 1.5 2 3 4 6 8];
Y_T    = [0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5]';

if ( T <= 0.5 )
    if ( mu_t >= 8 )
        ssf = Z_SSF(1,end);
    else
        ssf = interp1(X_mu_t,Z_SSF(1,:),mu_t);
    end
elseif ( T >= 1.5 )
    if ( mu_t >= 8 )
        ssf = Z_SSF(end,end);
    else
        ssf = interp1(X_mu_t,Z_SSF(end,:),mu_t);
    end
else
    if ( mu_t >= 8 )
        ssf = interp1(Y_T,Z_SSF(:,end),T);
    else
        [xx,yy] = meshgrid(X_mu_t,Y_T);
        ssf = interp2(xx,yy,Z_SSF,mu_t,T);
    end
end

end
