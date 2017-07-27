function sf = SF1(T,sdc)
% SF1 Compute scale factor 1
%
%   sf = SF1(T,sdc) computes scale factor 1, which adjusts the intensity of the
%       ground motion to the geometric mean of the data set at the fundamental
%       period of the archetype in question.
%
T_interp    = [0.25 0.30 0.35 0.40 0.45 0.5 0.6 0.7 0.8 0.9 1.0 1.2 ...
    1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0 3.5 4.0 4.5 5.0];
SNRT_interp = [0.785 0.781 0.767 0.754 0.755 0.742 0.607 0.541 0.453 ...
    0.402 0.350 0.303 0.258 0.210 0.169 0.149 0.134 0.119 0.106 ...
    0.092 0.081 0.063 0.053 0.046 0.041];

assert(T>=T_interp(1) && T<=T_interp(end),'Period is out of range');

SNRT = interp1(T_interp,SNRT_interp,T);
SMT  = FEMAP695.SMT(T,sdc);
sf   = SMT/SNRT;

end
