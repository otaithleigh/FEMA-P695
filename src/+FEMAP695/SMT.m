function smt = SMT(T,sdc)
% SMT Calculate the maximum-considered ground motion intensity
%
%   smt = SMT(T,sdc) calculates the maximum-considered ground motion intensity
%       for a given period (`T`) and seismic design category (`sdc`).
%
SM1 = FEMAP695.mappedValue('SM1',sdc);
SMS = FEMAP695.mappedValue('SMS',sdc);
if T <= SM1/SMS
    smt = SMS;
else
    smt = SM1/T;
end

end
