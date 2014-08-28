function [ spinUpGreenFunction, spinDnGreenFunction ] = unequalTimeGF_long_tau( t, U, tau, noOfSites, noOfUp, noOfDn, NUM_OF_EIGEN_VALUES )
% calculate the unequal time GF by using series expansion

OPTS.issym = 1;
OPTS.isreal = 1;

expanded_space_size_up = nchoosek(noOfSites,noOfUp+1)*nchoosek(noOfSites,noOfDn);
expanded_space_size_dn = nchoosek(noOfSites,noOfUp)*nchoosek(noOfSites,noOfDn + 1);
format compact;
savedFileName=strcat('ED_',num2str(noOfSites, '%02d'),...
                    '_sites_',num2str(noOfUp, '%02d'),...
                    'u',num2str(noOfDn, '%02d'),...
                    'd_U_',num2str(U, '%4.2f'),...
                    '_tau_',num2str(tau, '%4.2f'),...
                    '_t_',num2str(t),...
                    '_eigen_', num2str(NUM_OF_EIGEN_VALUES, '%04d'),...
                    ' ',datestr(now,'_yymmdd_HHMMSS'),'.mat');

tic;

if (noOfUp < noOfSites) && (noOfDn < noOfSites)
    fprintf('Begin calculations at time %s.\n', datestr(now,'yymmdd_HHMMSS'))
    spinUpGreenFunction=zeros(noOfSites);
    spinDnGreenFunction=zeros(noOfSites);
    
    % with this line to save memory:
    [groundState,groundStateEnergy]=eigs( hubbardHamiltonian( t, U, noOfSites, noOfUp, noOfDn ),...
                                               1,'sa'); %ASSUMING THAT THE HAMILTONIAN IS REAL SYMMETRIC
    save(savedFileName,'groundState','groundStateEnergy'); %save variables...    
    fprintf('\nData file: %s\n', savedFileName)
    
       
%% SPIN UP:
    fprintf('Begin spin-up calculations at time %s.\n', datestr(now,'yymmdd_HHMMSS'))
    if NUM_OF_EIGEN_VALUES >= expanded_space_size_up
        NUM_OF_EIGEN_VALUES_UP = expanded_space_size_up - 1;
        fprintf('NUM_EIGEN_VALUES exceeds dimension of spin-up matrix. Now set to %d\n', NUM_OF_EIGEN_VALUES_UP)
    else
        NUM_OF_EIGEN_VALUES_UP = NUM_OF_EIGEN_VALUES;
    end
    
    [eigenVectors_up, eigenValues_up] = eigs( hubbardHamiltonian( t, U, noOfSites, noOfUp+1, noOfDn ), ...
                                            NUM_OF_EIGEN_VALUES_UP, 'sa', OPTS);
    eigenValues_up = diag(eigenValues_up);
    save(savedFileName,'-append','eigenValues_up','eigenVectors_up');
    fprintf('Begin calculating off-diagonal elements at time %s.\n', datestr(now,'yymmdd_HHMMSS'))
    for i_site=1:noOfSites        
        fprintf('Working on i = %3d     at time %s\n', i_site, datestr(now,'yymmdd_HHMMSS'))
        destructionMatrix=creationOperator( noOfSites, noOfUp, noOfDn , i_site, 'up' )'; 
        left_wave_function =  (groundState') * destructionMatrix; 
        for j_site=(i_site+1):noOfSites % maybe consider j_site=i_site:noOfSites ?
            fprintf('Working on j =     %3d at time %s\n', j_site, datestr(now,'yymmdd_HHMMSS'))
            right_wave_function = creationOperator( noOfSites, noOfUp, noOfDn , j_site, 'up' ) * ...
                                                groundState;
            k_sum = 0;
            for k_eigenValues = 1:NUM_OF_EIGEN_VALUES_UP %sum over k
                expo_factor = exp( tau*( groundStateEnergy - eigenValues_up(k_eigenValues)));                
                i_total = left_wave_function * eigenVectors_up(:,k_eigenValues);
                j_total = dot( right_wave_function, conj(eigenVectors_up(:,k_eigenValues)) );
                k_sum = k_sum + expo_factor * i_total * j_total;
                
                clearvars expo_factor i_total j_total;
            end
            spinUpGreenFunction(i_site,j_site) = k_sum;
            clearvars creationMatrix right_wave_function k_sum;
        end
        clearvars destructionMatrix left_wave_function;
    end
    
    fprintf('Begin calculating on-diagonal elements at time  %s.\n', datestr(now,'yymmdd_HHMMSS'))
    i_site = 1;
        destructionMatrix=creationOperator( noOfSites, noOfUp, noOfDn , i_site, 'up' )';
        left_wave_function =  (groundState') * destructionMatrix;    
        j_site = 1;  
            right_wave_function = creationOperator( noOfSites, noOfUp, noOfDn , j_site, 'up' ) * ...
                groundState;
            k_sum = 0;
            for k_eigenValues = 1:NUM_OF_EIGEN_VALUES_UP %sum over k
                expo_factor = exp( tau*( groundStateEnergy - eigenValues_up(k_eigenValues)));
                i_total = left_wave_function * eigenVectors_up(:,k_eigenValues);
                j_total = dot( right_wave_function, conj(eigenVectors_up(:,k_eigenValues)) );
                k_sum = k_sum + expo_factor * i_total * j_total;        
                clearvars expo_factor i_total j_total;
            end
            diagonal_elem_up = k_sum;
    
    spinUpGreenFunction = spinUpGreenFunction + spinUpGreenFunction';
    for i_diag = 1:noOfSites
        spinUpGreenFunction(i_diag, i_diag) = diagonal_elem_up;
    end
    
    clearvars sizeSpacePlusOne eigenVectors_up eigenValues_up diagonal_elem_up;
    
%% SPIN DOWN:        
    fprintf('Begin spin-down calculations at time %s.\n', datestr(now,'yymmdd_HHMMSS'))
    if NUM_OF_EIGEN_VALUES >= expanded_space_size_dn
        NUM_OF_EIGEN_VALUES_DN = expanded_space_size_dn - 1;
        fprintf('NUM_EIGEN_VALUES exceeds dimension of spin-down matrix. Now set to %d\n', NUM_OF_EIGEN_VALUES_DN)
    else
        NUM_OF_EIGEN_VALUES_DN = NUM_OF_EIGEN_VALUES;
    end

    [eigenVectors_dn, eigenValues_dn] = eigs( hubbardHamiltonian( t, U, noOfSites, noOfUp, noOfDn + 1 ), ...
                                            NUM_OF_EIGEN_VALUES_DN, 'sa', OPTS);
    eigenValues_dn = diag(eigenValues_dn);
    save(savedFileName,'-append','eigenVectors_dn','eigenValues_dn');
    fprintf('Begin calculating off-diagonal elements at time %s.\n', datestr(now,'yymmdd_HHMMSS'))
    for i_site=1:noOfSites 
        fprintf('Working on i = %3d     at time %s\n', i_site, datestr(now,'yymmdd_HHMMSS'))
        destructionMatrix=creationOperator( noOfSites, noOfUp, noOfDn , i_site, 'dn' )'; 
        left_wave_function =  (groundState') * destructionMatrix; 
        for j_site=(i_site+1):noOfSites % maybe consider j_site=i_site:noOfSites ?
            fprintf('Working on j =     %3d at time %s\n', j_site, datestr(now,'yymmdd_HHMMSS'))
            right_wave_function = creationOperator( noOfSites, noOfUp, noOfDn , j_site, 'dn' ) * ...
                                                groundState;
            k_sum = 0;
            for k_eigenValues = 1:NUM_OF_EIGEN_VALUES_DN %sum over k
                expo_factor = exp( tau*( groundStateEnergy - eigenValues_dn(k_eigenValues)));                
                i_total = left_wave_function * eigenVectors_dn(:,k_eigenValues);
                j_total = dot( right_wave_function, conj(eigenVectors_dn(:,k_eigenValues)) );
                k_sum = k_sum + expo_factor * i_total * j_total;
                
                clearvars expo_factor i_total j_total;
            end
            spinDnGreenFunction(i_site,j_site) = k_sum;
            clearvars creationMatrix right_wave_function;
        end
        clearvars destructionMatrix left_wave_function;
    end
    
    fprintf('Begin calculating on-diagonal elements at time  %s.\n', datestr(now,'yymmdd_HHMMSS'))
    i_site = 1;
        destructionMatrix=creationOperator( noOfSites, noOfUp, noOfDn , i_site, 'dn' )';
        left_wave_function =  (groundState') * destructionMatrix;    
        j_site = 1;  
            right_wave_function = creationOperator( noOfSites, noOfUp, noOfDn , j_site, 'dn' ) * ...
                groundState;
            k_sum = 0;
            for k_eigenValues = 1:NUM_OF_EIGEN_VALUES_DN %sum over k
                expo_factor = exp( tau*( groundStateEnergy - eigenValues_dn(k_eigenValues)));
                i_total = left_wave_function * eigenVectors_dn(:,k_eigenValues);
                j_total = dot( right_wave_function, conj(eigenVectors_dn(:,k_eigenValues)) );
                k_sum = k_sum + expo_factor * i_total * j_total;        
                clearvars expo_factor i_total j_total;
            end
            diagonal_elem_dn = k_sum;
    
    spinDnGreenFunction = spinDnGreenFunction + spinDnGreenFunction';
    for i_diag = 1:noOfSites
        spinDnGreenFunction(i_diag, i_diag) = diagonal_elem_dn;
    end
    
    clearvars sizeSpacePlusOne eigenVectors_dn eigenValues_dn diagonal_elem_dn;


else
    error('Error: cannot apply creation operator when number of electrons = number of sites');
end

time=toc
save(savedFileName,'-append','noOfSites','noOfUp','noOfDn','U','tau','t','time', 'NUM_OF_EIGEN_VALUES_UP', 'NUM_OF_EIGEN_VALUES_DN');
save(savedFileName, '-append','spinUpGreenFunction', 'spinDnGreenFunction');
disp('Saved spinUpGreenFunction, spinDnGreenFunction.');
fprintf('Finish all calculations at time %s.\n', datestr(now,'yymmdd_HHMMSS'))


end
