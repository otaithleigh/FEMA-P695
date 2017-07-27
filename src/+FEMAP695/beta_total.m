function beta = beta_total(rating_DR,rating_TD,rating_MDL,mu_T)
% beta_total Calculate the total uncertainty present in the system.
%
%   beta = beta_total(rating_DR,rating_TD,rating_MDL,mu_T) calculates the
%       uncertainty `beta` based on the qualitative ratings of the design
%       requirements (`rating_DR`), test data (`rating_TD`), and the nonlinear
%       model (`rating_MDL`), as well as the period-based ductility (`mu_T`).
%
switch rating_DR
    case 'A';  beta_DR = 0.10;
    case 'B';  beta_DR = 0.20;
    case 'C';  beta_DR = 0.35;
    case 'D';  beta_DR = 0.50;
    otherwise; error('Unknown rating_DR');
end
switch rating_TD
    case 'A';  beta_TD = 0.10;
    case 'B';  beta_TD = 0.20;
    case 'C';  beta_TD = 0.35;
    case 'D';  beta_TD = 0.50;
    otherwise; error('Unknown rating_TD');
end
switch rating_MDL
    case 'A';  beta_MDL = 0.10;
    case 'B';  beta_MDL = 0.20;
    case 'C';  beta_MDL = 0.35;
    case 'D';  beta_MDL = 0.50;
    otherwise; error('Unknown rating_MDL');
end
beta_RTR = min(0.1+0.1*mu_T,0.4);
beta = sqrt(beta_RTR^2 + beta_DR^2 + beta_TD^2 + beta_MDL^2);
beta = round(beta*40)/40; % Round to nearest 0.025

end
