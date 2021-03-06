function test_suite = test_generate_basis
initTestSuite;
end

function test_generate_basis_1
in_num_sites = 4;
in_num_up = 3;
in_num_dn = 2;

[ out_combinedBasis, out_TOTAL_ALL_STATES, out_TOTAL_UP_STATES, out_TOTAL_DN_STATES, out_upStates, out_dnStates ] = generateBasis( in_num_sites, in_num_up, in_num_dn );

assertEqual(out_TOTAL_UP_STATES, 4); 
assertEqual(out_TOTAL_DN_STATES, 6); 
assertEqual(out_TOTAL_ALL_STATES, 24); 

assertEqual(out_upStates, ...
     [7; ...
     11; ...
     13; ...
     14]);...
     
assertEqual(out_dnStates,...     
     [3;...
      5;...
      6;...
      9;...
     10;...
     12]);
assertEqual(out_combinedBasis,...
    [1     7     3;...
     2     7     5;...
     3     7     6;...
     4     7     9;...
     5     7    10;...
     6     7    12;...
     7    11     3;...
     8    11     5;...
     9    11     6;...
    10    11     9;...
    11    11    10;...
    12    11    12;...
    13    13     3;...
    14    13     5;...
    15    13     6;...
    16    13     9;...
    17    13    10;...
    18    13    12;...
    19    14     3;...
    20    14     5;...
    21    14     6;...
    22    14     9;...
    23    14    10;...
    24    14    12]);
end

function test_generate_basis_2
in_num_sites = 6;
in_num_up = 4;
in_num_dn = 3;

[ out_combinedBasis, out_TOTAL_ALL_STATES, out_TOTAL_UP_STATES, out_TOTAL_DN_STATES, out_upStates, out_dnStates ] = generateBasis( in_num_sites, in_num_up, in_num_dn );

assertEqual(out_TOTAL_UP_STATES, 15); 
assertEqual(out_TOTAL_DN_STATES, 20); 
assertEqual(out_TOTAL_ALL_STATES, 300); 

assertEqual(out_upStates, ...
     [15;...
        23;...
        27;...
        29;...
        30;...
        39;...
        43;...
        45;...
        46;...
        51;...
        53;...
        54;...
        57;...
        58;...
        60]);...
     
assertEqual(out_dnStates,...     
     [7;...
        11;...
        13;...
        14;...
        19;...
        21;...
        22;...
        25;...
        26;...
        28;...
        35;...
        37;...
        38;...
        41;...
        42;...
        44;...
        49;...
        50;...
        52;...
        56]);
assertEqual(out_combinedBasis,...
    [1 15 7;...
     2 15 11;...
     3 15 13;...
     4 15 14;...
     5 15 19;...
     6 15 21;...
     7 15 22;...
     8 15 25;...
     9 15 26;...
     10 15 28;...
     11 15 35;...
     12 15 37;...
     13 15 38;...
     14 15 41;...
     15 15 42;...
     16 15 44;...
     17 15 49;...
     18 15 50;...
     19 15 52;...
     20 15 56;...
     21 23 7;...
     22 23 11;...
     23 23 13;...
     24 23 14;...
     25 23 19;...
     26 23 21;...
     27 23 22;...
     28 23 25;...
     29 23 26;...
     30 23 28;...
     31 23 35;...
     32 23 37;...
     33 23 38;...
     34 23 41;...
     35 23 42;...
     36 23 44;...
     37 23 49;...
     38 23 50;...
     39 23 52;...
     40 23 56;...
     41 27 7;...
     42 27 11;...
     43 27 13;...
     44 27 14;...
     45 27 19;...
     46 27 21;...
     47 27 22;...
     48 27 25;...
     49 27 26;...
     50 27 28;...
     51 27 35;...
     52 27 37;...
     53 27 38;...
     54 27 41;...
     55 27 42;...
     56 27 44;...
     57 27 49;...
     58 27 50;...
     59 27 52;...
     60 27 56;...
     61 29 7;...
     62 29 11;...
     63 29 13;...
     64 29 14;...
     65 29 19;...
     66 29 21;...
     67 29 22;...
     68 29 25;...
     69 29 26;...
     70 29 28;...
     71 29 35;...
     72 29 37;...
     73 29 38;...
     74 29 41;...
     75 29 42;...
     76 29 44;...
     77 29 49;...
     78 29 50;...
     79 29 52;...
     80 29 56;...
     81 30 7;...
     82 30 11;...
     83 30 13;...
     84 30 14;...
     85 30 19;...
     86 30 21;...
     87 30 22;...
     88 30 25;...
     89 30 26;...
     90 30 28;...
     91 30 35;...
     92 30 37;...
     93 30 38;...
     94 30 41;...
     95 30 42;...
     96 30 44;...
     97 30 49;...
     98 30 50;...
     99 30 52;...
     100 30 56;...
     101 39 7;...
     102 39 11;...
     103 39 13;...
     104 39 14;...
     105 39 19;...
     106 39 21;...
     107 39 22;...
     108 39 25;...
     109 39 26;...
     110 39 28;...
     111 39 35;...
     112 39 37;...
     113 39 38;...
     114 39 41;...
     115 39 42;...
     116 39 44;...
     117 39 49;...
     118 39 50;...
     119 39 52;...
     120 39 56;...
     121 43 7;...
     122 43 11;...
     123 43 13;...
     124 43 14;...
     125 43 19;...
     126 43 21;...
     127 43 22;...
     128 43 25;...
     129 43 26;...
     130 43 28;...
     131 43 35;...
     132 43 37;...
     133 43 38;...
     134 43 41;...
     135 43 42;...
     136 43 44;...
     137 43 49;...
     138 43 50;...
     139 43 52;...
     140 43 56;...
     141 45 7;...
     142 45 11;...
     143 45 13;...
     144 45 14;...
     145 45 19;...
     146 45 21;...
     147 45 22;...
     148 45 25;...
     149 45 26;...
     150 45 28;...
     151 45 35;...
     152 45 37;...
     153 45 38;...
     154 45 41;...
     155 45 42;...
     156 45 44;...
     157 45 49;...
     158 45 50;...
     159 45 52;...
     160 45 56;...
     161 46 7;...
     162 46 11;...
     163 46 13;...
     164 46 14;...
     165 46 19;...
     166 46 21;...
     167 46 22;...
     168 46 25;...
     169 46 26;...
     170 46 28;...
     171 46 35;...
     172 46 37;...
     173 46 38;...
     174 46 41;...
     175 46 42;...
     176 46 44;...
     177 46 49;...
     178 46 50;...
     179 46 52;...
     180 46 56;...
     181 51 7;...
     182 51 11;...
     183 51 13;...
     184 51 14;...
     185 51 19;...
     186 51 21;...
     187 51 22;...
     188 51 25;...
     189 51 26;...
     190 51 28;...
     191 51 35;...
     192 51 37;...
     193 51 38;...
     194 51 41;...
     195 51 42;...
     196 51 44;...
     197 51 49;...
     198 51 50;...
     199 51 52;...
     200 51 56;...
     201 53 7;...
     202 53 11;...
     203 53 13;...
     204 53 14;...
     205 53 19;...
     206 53 21;...
     207 53 22;...
     208 53 25;...
     209 53 26;...
     210 53 28;...
     211 53 35;...
     212 53 37;...
     213 53 38;...
     214 53 41;...
     215 53 42;...
     216 53 44;...
     217 53 49;...
     218 53 50;...
     219 53 52;...
     220 53 56;...
     221 54 7;...
     222 54 11;...
     223 54 13;...
     224 54 14;...
     225 54 19;...
     226 54 21;...
     227 54 22;...
     228 54 25;...
     229 54 26;...
     230 54 28;...
     231 54 35;...
     232 54 37;...
     233 54 38;...
     234 54 41;...
     235 54 42;...
     236 54 44;...
     237 54 49;...
     238 54 50;...
     239 54 52;...
     240 54 56;...
     241 57 7;...
     242 57 11;...
     243 57 13;...
     244 57 14;...
     245 57 19;...
     246 57 21;...
     247 57 22;...
     248 57 25;...
     249 57 26;...
     250 57 28;...
     251 57 35;...
     252 57 37;...
     253 57 38;...
     254 57 41;...
     255 57 42;...
     256 57 44;...
     257 57 49;...
     258 57 50;...
     259 57 52;...
     260 57 56;...
     261 58 7;...
     262 58 11;...
     263 58 13;...
     264 58 14;...
     265 58 19;...
     266 58 21;...
     267 58 22;...
     268 58 25;...
     269 58 26;...
     270 58 28;...
     271 58 35;...
     272 58 37;...
     273 58 38;...
     274 58 41;...
     275 58 42;...
     276 58 44;...
     277 58 49;...
     278 58 50;...
     279 58 52;...
     280 58 56;...
     281 60 7;...
     282 60 11;...
     283 60 13;...
     284 60 14;...
     285 60 19;...
     286 60 21;...
     287 60 22;...
     288 60 25;...
     289 60 26;...
     290 60 28;...
     291 60 35;...
     292 60 37;...
     293 60 38;...
     294 60 41;...
     295 60 42;...
     296 60 44;...
     297 60 49;...
     298 60 50;...
     299 60 52;...
     300 60 56;...
     ]);     
end

