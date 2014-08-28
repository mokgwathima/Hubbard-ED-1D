function test_suite = test_unequal_time_gf_long_tau_5_sites
initTestSuite;
end

function inp = setup
inp.in_t = 1;
inp.in_U = 4;
inp.in_noOfSites = 5;
inp.in_noOfUp = 3;
inp.in_noOfDn = 3;
inp.NUM_EIGEN_VALUES = 23; %21 is the smallest value that we can get away with such that the result still agrees with the brute-force results to within 0.1%
end

function teardown(inp)
% do nothing
end

function test_unqual_time_gf_0_0(inp)
in_tau = 0;
[ out_spinUpGreenFunction, out_spinDnGreenFunction ] = unequalTimeGF_long_tau( inp.in_t, inp.in_U, in_tau, inp.in_noOfSites, inp.in_noOfUp, inp.in_noOfDn, inp.NUM_EIGEN_VALUES );

assertElementsAlmostEqual(out_spinUpGreenFunction,...
   [0.4 -0.28245 0.10829 0.10829 -0.28245;...
    -0.28245 0.4 -0.28245 0.10829 0.10829;...
    0.10829 -0.28245 0.4 -0.28245 0.10829;...
    0.10829 0.10829 -0.28245 0.4 -0.28245;...
    -0.28245 0.10829 0.10829 -0.28245 0.4],...
   'relative', 0.001);

assertElementsAlmostEqual(out_spinDnGreenFunction,...
   [0.4 -0.28245 0.10829 0.10829 -0.28245;...
    -0.28245 0.4 -0.28245 0.10829 0.10829;...
    0.10829 -0.28245 0.4 -0.28245 0.10829;...
    0.10829 0.10829 -0.28245 0.4 -0.28245;...
    -0.28245 0.10829 0.10829 -0.28245 0.4],...
    'relative', 0.001);
end

function test_unqual_time_gf_0_5(inp)
in_tau = 0.5;
[ out_spinUpGreenFunction, out_spinDnGreenFunction ] = unequalTimeGF_long_tau( inp.in_t, inp.in_U, in_tau, inp.in_noOfSites, inp.in_noOfUp, inp.in_noOfDn, inp.NUM_EIGEN_VALUES );

assertElementsAlmostEqual(out_spinUpGreenFunction,...
   [0.040428 -0.031364 0.012102 0.012102 -0.031364;...
    -0.031364 0.040428 -0.031364 0.012102 0.012102;...
    0.012102 -0.031364 0.040428 -0.031364 0.012102;...
    0.012102 0.012102 -0.031364 0.040428 -0.031364;...
    -0.031364 0.012102 0.012102 -0.031364 0.040428],...
   'relative', 0.001);

assertElementsAlmostEqual(out_spinDnGreenFunction,...
   [0.040428 -0.031364 0.012102 0.012102 -0.031364;...
    -0.031364 0.040428 -0.031364 0.012102 0.012102;...
    0.012102 -0.031364 0.040428 -0.031364 0.012102;...
    0.012102 0.012102 -0.031364 0.040428 -0.031364;...
    -0.031364 0.012102 0.012102 -0.031364 0.040428],...
    'relative', 0.001);
end

function test_unqual_time_gf_1_0(inp)
in_tau = 1.0;
[ out_spinUpGreenFunction, out_spinDnGreenFunction ] = unequalTimeGF_long_tau( inp.in_t, inp.in_U, in_tau, inp.in_noOfSites, inp.in_noOfUp, inp.in_noOfDn, inp.NUM_EIGEN_VALUES );

assertElementsAlmostEqual(out_spinUpGreenFunction,...
   [0.0044057 -0.0035174 0.0013523 0.0013523 -0.0035174;...
    -0.0035174 0.0044057 -0.0035174 0.0013523 0.0013523;...
    0.0013523 -0.0035174 0.0044057 -0.0035174 0.0013523;...
    0.0013523 0.0013523 -0.0035174 0.0044057 -0.0035174;...
    -0.0035174 0.0013523 0.0013523 -0.0035174 0.0044057],...
   'relative', 0.001);

assertElementsAlmostEqual(out_spinDnGreenFunction,...
   [0.0044057 -0.0035174 0.0013523 0.0013523 -0.0035174;...
    -0.0035174 0.0044057 -0.0035174 0.0013523 0.0013523;...
    0.0013523 -0.0035174 0.0044057 -0.0035174 0.0013523;...
    0.0013523 0.0013523 -0.0035174 0.0044057 -0.0035174;...
    -0.0035174 0.0013523 0.0013523 -0.0035174 0.0044057],...
    'relative', 0.001);
end