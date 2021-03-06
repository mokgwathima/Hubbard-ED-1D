function  test_hubbard_Hamiltonnian_parallel_improved

in_t = 1;
in_U = 4;
in_noOfSites = 4;
in_noOfUp = 3;
in_noOfDn = 2;
in_num_cores = 4;

% [ out_totalHamiltonian, out_kineticHamiltonian,  out_potentialHamiltonian] = hubbardHamiltonian_parallel_improved( in_t, in_U, in_noOfSites, in_noOfUp, in_noOfDn, in_num_cores );
out_totalHamiltonian = hubbardHamiltonian_parallel_improved( in_t, in_U, in_noOfSites, in_noOfUp, in_noOfDn, in_num_cores );

% assertEqual(full(out_kineticHamiltonian),...
%    [0 -1 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;...
%    -1 0 -1 -1 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0;...
%     0 -1 0 0 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0;...
%     0 -1 0 0 -1 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0;...
%     1 0 -1 -1 0 -1 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0;...
%     0 1 0 0 -1 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1;...
%     -1 0 0 0 0 0 0 -1 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0;...
%     0 -1 0 0 0 0 -1 0 -1 -1 0 1 0 -1 0 0 0 0 0 0 0 0 0 0;...
%     0 0 -1 0 0 0 0 -1 0 0 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0;...
%     0 0 0 -1 0 0 0 -1 0 0 -1 0 0 0 0 -1 0 0 0 0 0 0 0 0;...
%     0 0 0 0 -1 0 1 0 -1 -1 0 -1 0 0 0 0 -1 0 0 0 0 0 0 0;...
%     0 0 0 0 0 -1 0 1 0 0 -1 0 0 0 0 0 0 -1 0 0 0 0 0 0;...
%     0 0 0 0 0 0 -1 0 0 0 0 0 0 -1 0 0 1 0 -1 0 0 0 0 0;...
%     0 0 0 0 0 0 0 -1 0 0 0 0 -1 0 -1 -1 0 1 0 -1 0 0 0 0;...
%     0 0 0 0 0 0 0 0 -1 0 0 0 0 -1 0 0 -1 0 0 0 -1 0 0 0;...
%     0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 0 -1 0 0 0 0 -1 0 0;...
%     0 0 0 0 0 0 0 0 0 0 -1 0 1 0 -1 -1 0 -1 0 0 0 0 -1 0;...
%     0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 0 -1 0 0 0 0 0 0 -1;...
%     -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 -1 0 0 1 0;...
%     0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 -1 0 -1 -1 0 1;...
%     0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 -1 0 0 -1 0;...
%     0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 0 -1 0;...
%     0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 -1 -1 0 -1;...
%     0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 0 -1 0;]);

% assertEqual(full(out_potentialHamiltonian),...
%    [8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0;...
%     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8]);
% 
assertEqual(full(out_totalHamiltonian),...
   [8 -1 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0;...
    -1 8 -1 -1 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0;...
    0 -1 8 0 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0;...
    0 -1 0 4 -1 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0;...
    1 0 -1 -1 4 -1 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0;...
    0 1 0 0 -1 4 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1;...
    -1 0 0 0 0 0 8 -1 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0;...
    0 -1 0 0 0 0 -1 4 -1 -1 0 1 0 -1 0 0 0 0 0 0 0 0 0 0;...
    0 0 -1 0 0 0 0 -1 4 0 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0;...
    0 0 0 -1 0 0 0 -1 0 8 -1 0 0 0 0 -1 0 0 0 0 0 0 0 0;...
    0 0 0 0 -1 0 1 0 -1 -1 8 -1 0 0 0 0 -1 0 0 0 0 0 0 0;...
    0 0 0 0 0 -1 0 1 0 0 -1 4 0 0 0 0 0 -1 0 0 0 0 0 0;...
    0 0 0 0 0 0 -1 0 0 0 0 0 4 -1 0 0 1 0 -1 0 0 0 0 0;...
    0 0 0 0 0 0 0 -1 0 0 0 0 -1 8 -1 -1 0 1 0 -1 0 0 0 0;...
    0 0 0 0 0 0 0 0 -1 0 0 0 0 -1 4 0 -1 0 0 0 -1 0 0 0;...
    0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 8 -1 0 0 0 0 -1 0 0;...
    0 0 0 0 0 0 0 0 0 0 -1 0 1 0 -1 -1 4 -1 0 0 0 0 -1 0;...
    0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 0 -1 8 0 0 0 0 0 -1;...
    -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 4 -1 0 0 1 0;...
    0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 -1 4 -1 -1 0 1;...
    0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 -1 8 0 -1 0;...
    0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 4 -1 0;...
    0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 -1 -1 8 -1;...
    0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 0 -1 8]);
end

