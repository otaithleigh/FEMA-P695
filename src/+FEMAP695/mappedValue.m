function val = mappedValue(value,sdc)
% mappedValue Retrieve tabulated seismic design parameters
%
%   val = mappedValue(value,sdc) retrieves the requested parameter `value` for
%       seismic design category `sdc`.
%
%   Valid parameters are:
%   'SS':   Mapped short-period spectral acceleration
%   'S1':   Mapped 1-second period spectral acceleration
%   'Fa':   Site coefficient for short-period accelerations
%   'Fv':   Site coefficient for 1-second period accelerations
%   'SMS':  Short-period spectral acceleration adjusted for site-class effects
%   'SM1':  1-second period spectral acceleration adjusted for site-class effects
%   'SDS':  Design short-period spectral acceleration
%   'SD1':  Design 1-second period spectral acceleration
%   'TS':   Transition period from short- to long-period
%
%   Valid seismic design categories are:
%   'Dmax'
%   'Dmin'
%   'Cmax'
%   'Cmin'
%   'Bmax'
%   'Bmin'
%
switch sdc
    case 'Dmax'
        SS  = 1.5;      Fa  = 1.0;      SMS = 1.5;      SDS = 1.0;
        S1  = 0.60;     Fv  = 1.50;     SM1 = 0.90;     SD1 = 0.60;
    case {'Cmax','Dmin'}
        SS  = 0.55;     Fa  = 1.36;     SMS = 0.75;     SDS = 0.50;
        S1  = 0.132;    Fv  = 2.28;     SM1 = 0.30;     SD1 = 0.20;
    case {'Bmax','Cmin'}
        SS  = 0.33;     Fa  = 1.53;     SMS = 0.50;     SDS = 0.33;
        S1  = 0.083;    Fv  = 2.4;      SM1 = 0.20;     SD1 = 0.133;
    case 'Bmin'
        SS  = 0.156;    Fa  = 1.6;      SMS = 0.25;     SDS = 0.167;
        S1  = 0.042;    Fv  = 2.4;      SM1 = 0.10;     SD1 = 0.067;
    otherwise
        error('Unknown Seismic Design Category')
end

switch lower(value)
    case 'ss';   val = SS;
    case 's1';   val = S1;
    case 'fa';   val = Fa;
    case 'fv';   val = Fv;
    case 'sms';  val = SMS;
    case 'sm1';  val = SM1;
    case 'sds';  val = SDS;
    case 'sd1';  val = SD1;
    case 'ts';   val = SD1/SDS; % also equal to SM1/SMS
    otherwise;   error('Unknown value %s',value);
end

end
