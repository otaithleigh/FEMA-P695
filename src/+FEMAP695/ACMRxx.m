function acmr = ACMRxx(beta_total,collapseProbability)
% ACMRxx Calculate the acceptable adjusted collapse margin ratio
%
%   acmr = ACMRxx(beta_total,collapseProbability) calculates the acceptable
%       adjusted collapse margin ratio for a given uncertainty (`beta_total`)
%       and collapse probability (`collapseProbability`).
%
acmr = 1/logninv(collapseProbability,0,beta_total);

end
