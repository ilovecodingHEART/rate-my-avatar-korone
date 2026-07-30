-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Base64);
local l_ipairs_0 = ipairs;
local l_band_0 = bit32.band;
local l_bor_0 = bit32.bor;
local l_bxor_0 = bit32.bxor;
local l_lshift_0 = bit32.lshift;
local l_rshift_0 = bit32.rshift;
local l_lrotate_0 = bit32.lrotate;
local l_rrotate_0 = bit32.rrotate;
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {
    [224] = {}, 
    [256] = v12
};
local v16 = {
    [384] = {}, 
    [512] = v11
};
local v17 = {
    [384] = {}, 
    [512] = v12
};
local v18 = {};
local v19 = {
    1732584193, 
    4023233417, 
    2562383102, 
    271733878, 
    3285377520
};
local v20 = {
    0, 
    0, 
    0, 
    0, 
    0, 
    0, 
    0, 
    0, 
    28, 
    25, 
    26, 
    27, 
    0, 
    0, 
    10, 
    9, 
    11, 
    12, 
    0, 
    15, 
    16, 
    17, 
    18, 
    0, 
    20, 
    22, 
    23, 
    21
};
local v21 = {};
local function v56(v22, v23, v24, v25) --[[ Line: 181 ]] --[[ Name: sha256_feed_64 ]]
    local l_v21_0 = v21;
    local l_v10_0 = v10;
    local v28 = v22[1];
    local v29 = v22[2];
    local v30 = v22[3];
    local v31 = v22[4];
    local v32 = v22[5];
    local v33 = v22[6];
    local v34 = v22[7];
    local v35 = v22[8];
    for v36 = v24, v24 + v25 - 1, 64 do
        local l_v36_0 = v36;
        for v38 = 1, 16 do
            l_v36_0 = l_v36_0 + 4;
            local v39, v40, v41, v42 = string.byte(v23, l_v36_0 - 3, l_v36_0);
            l_v21_0[v38] = ((v39 * 256 + v40) * 256 + v41) * 256 + v42;
        end;
        for v43 = 17, 64 do
            local v44 = l_v21_0[v43 - 15];
            local v45 = l_v21_0[v43 - 2];
            l_v21_0[v43] = l_bxor_0(l_rrotate_0(v44, 7), l_lrotate_0(v44, 14), (l_rshift_0(v44, 3))) + l_bxor_0(l_lrotate_0(v45, 15), l_lrotate_0(v45, 13), (l_rshift_0(v45, 10))) + l_v21_0[v43 - 7] + l_v21_0[v43 - 16];
        end;
        local l_v28_0 = v28;
        local l_v29_0 = v29;
        local l_v30_0 = v30;
        local l_v31_0 = v31;
        local l_v32_0 = v32;
        local l_v33_0 = v33;
        local l_v34_0 = v34;
        local l_v35_0 = v35;
        for v54 = 1, 64 do
            local v55 = l_bxor_0(l_rrotate_0(l_v32_0, 6), l_rrotate_0(l_v32_0, 11), (l_lrotate_0(l_v32_0, 7))) + l_band_0(l_v32_0, l_v33_0) + l_band_0(-1 - l_v32_0, l_v34_0) + l_v35_0 + l_v10_0[v54] + l_v21_0[v54];
            l_v35_0 = l_v34_0;
            l_v34_0 = l_v33_0;
            l_v33_0 = l_v32_0;
            l_v32_0 = v55 + l_v31_0;
            l_v31_0 = l_v30_0;
            l_v30_0 = l_v29_0;
            l_v29_0 = l_v28_0;
            l_v28_0 = v55 + l_band_0(l_v31_0, l_v30_0) + l_band_0(l_v28_0, (l_bxor_0(l_v31_0, l_v30_0))) + l_bxor_0(l_rrotate_0(l_v28_0, 2), l_rrotate_0(l_v28_0, 13), (l_lrotate_0(l_v28_0, 10)));
        end;
        v28 = (l_v28_0 + v28) % 4294967296;
        v29 = (l_v29_0 + v29) % 4294967296;
        v30 = (l_v30_0 + v30) % 4294967296;
        v31 = (l_v31_0 + v31) % 4294967296;
        v32 = (l_v32_0 + v32) % 4294967296;
        v33 = (l_v33_0 + v33) % 4294967296;
        v34 = (l_v34_0 + v34) % 4294967296;
        v35 = (l_v35_0 + v35) % 4294967296;
    end;
    v22[1] = v28;
    v22[2] = v29;
    v22[3] = v30;
    v22[4] = v31;
    v22[5] = v32;
    v22[6] = v33;
    v22[7] = v34;
    v22[8] = v35;
end;
local function v116(v57, v58, v59, v60, v61) --[[ Line: 228 ]] --[[ Name: sha512_feed_128 ]]
    local l_v21_1 = v21;
    local l_v9_0 = v9;
    local l_v10_1 = v10;
    local v65 = v57[1];
    local v66 = v57[2];
    local v67 = v57[3];
    local v68 = v57[4];
    local v69 = v57[5];
    local v70 = v57[6];
    local v71 = v57[7];
    local v72 = v57[8];
    local v73 = v58[1];
    local v74 = v58[2];
    local v75 = v58[3];
    local v76 = v58[4];
    local v77 = v58[5];
    local v78 = v58[6];
    local v79 = v58[7];
    local v80 = v58[8];
    for v81 = v60, v60 + v61 - 1, 128 do
        local l_v81_0 = v81;
        for v83 = 1, 32 do
            l_v81_0 = l_v81_0 + 4;
            local v84, v85, v86, v87 = string.byte(v59, l_v81_0 - 3, l_v81_0);
            l_v21_1[v83] = ((v84 * 256 + v85) * 256 + v86) * 256 + v87;
        end;
        for v88 = 34, 160, 2 do
            local v89 = l_v21_1[v88 - 30];
            local v90 = l_v21_1[v88 - 31];
            local v91 = l_v21_1[v88 - 4];
            local v92 = l_v21_1[v88 - 5];
            local v93 = l_bxor_0(l_rshift_0(v89, 1) + l_lshift_0(v90, 31), l_rshift_0(v89, 8) + l_lshift_0(v90, 24), l_rshift_0(v89, 7) + l_lshift_0(v90, 25)) % 4294967296 + l_bxor_0(l_rshift_0(v91, 19) + l_lshift_0(v92, 13), l_lshift_0(v91, 3) + l_rshift_0(v92, 29), l_rshift_0(v91, 6) + l_lshift_0(v92, 26)) % 4294967296 + l_v21_1[v88 - 14] + l_v21_1[v88 - 32];
            local v94 = v93 % 4294967296;
            l_v21_1[v88 - 1] = l_bxor_0(l_rshift_0(v90, 1) + l_lshift_0(v89, 31), l_rshift_0(v90, 8) + l_lshift_0(v89, 24), (l_rshift_0(v90, 7))) + l_bxor_0(l_rshift_0(v92, 19) + l_lshift_0(v91, 13), l_lshift_0(v92, 3) + l_rshift_0(v91, 29), (l_rshift_0(v92, 6))) + l_v21_1[v88 - 15] + l_v21_1[v88 - 33] + (v93 - v94) / 4294967296;
            l_v21_1[v88] = v94;
        end;
        local l_v65_0 = v65;
        local l_v66_0 = v66;
        local l_v67_0 = v67;
        local l_v68_0 = v68;
        local l_v69_0 = v69;
        local l_v70_0 = v70;
        local l_v71_0 = v71;
        local l_v72_0 = v72;
        local l_v73_0 = v73;
        local l_v74_0 = v74;
        local l_v75_0 = v75;
        local l_v76_0 = v76;
        local l_v77_0 = v77;
        local l_v78_0 = v78;
        local l_v79_0 = v79;
        local l_v80_0 = v80;
        for v111 = 1, 80 do
            local v112 = 2 * v111;
            local v113 = l_bxor_0(l_rshift_0(l_v69_0, 14) + l_lshift_0(l_v77_0, 18), l_rshift_0(l_v69_0, 18) + l_lshift_0(l_v77_0, 14), l_lshift_0(l_v69_0, 23) + l_rshift_0(l_v77_0, 9)) % 4294967296 + (l_band_0(l_v69_0, l_v70_0) + l_band_0(-1 - l_v69_0, l_v71_0)) % 4294967296 + l_v72_0 + l_v9_0[v111] + l_v21_1[v112];
            local v114 = v113 % 4294967296;
            local v115 = l_bxor_0(l_rshift_0(l_v77_0, 14) + l_lshift_0(l_v69_0, 18), l_rshift_0(l_v77_0, 18) + l_lshift_0(l_v69_0, 14), l_lshift_0(l_v77_0, 23) + l_rshift_0(l_v69_0, 9)) + l_band_0(l_v77_0, l_v78_0) + l_band_0(-1 - l_v77_0, l_v79_0) + l_v80_0 + l_v10_1[v111] + l_v21_1[v112 - 1] + (v113 - v114) / 4294967296;
            l_v72_0 = l_v71_0;
            l_v80_0 = l_v79_0;
            l_v71_0 = l_v70_0;
            l_v79_0 = l_v78_0;
            l_v70_0 = l_v69_0;
            l_v78_0 = l_v77_0;
            v113 = v114 + l_v68_0;
            l_v69_0 = v113 % 4294967296;
            l_v77_0 = v115 + l_v76_0 + (v113 - l_v69_0) / 4294967296;
            l_v68_0 = l_v67_0;
            l_v76_0 = l_v75_0;
            l_v67_0 = l_v66_0;
            l_v75_0 = l_v74_0;
            l_v66_0 = l_v65_0;
            l_v74_0 = l_v73_0;
            v113 = v114 + (l_band_0(l_v68_0, l_v67_0) + l_band_0(l_v66_0, (l_bxor_0(l_v68_0, l_v67_0)))) % 4294967296 + l_bxor_0(l_rshift_0(l_v66_0, 28) + l_lshift_0(l_v74_0, 4), l_lshift_0(l_v66_0, 30) + l_rshift_0(l_v74_0, 2), l_lshift_0(l_v66_0, 25) + l_rshift_0(l_v74_0, 7)) % 4294967296;
            l_v65_0 = v113 % 4294967296;
            l_v73_0 = v115 + (l_band_0(l_v76_0, l_v75_0) + l_band_0(l_v74_0, (l_bxor_0(l_v76_0, l_v75_0)))) + l_bxor_0(l_rshift_0(l_v74_0, 28) + l_lshift_0(l_v66_0, 4), l_lshift_0(l_v74_0, 30) + l_rshift_0(l_v66_0, 2), l_lshift_0(l_v74_0, 25) + l_rshift_0(l_v66_0, 7)) + (v113 - l_v65_0) / 4294967296;
        end;
        l_v65_0 = v65 + l_v65_0;
        v65 = l_v65_0 % 4294967296;
        v73 = (v73 + l_v73_0 + (l_v65_0 - v65) / 4294967296) % 4294967296;
        l_v65_0 = v66 + l_v66_0;
        v66 = l_v65_0 % 4294967296;
        v74 = (v74 + l_v74_0 + (l_v65_0 - v66) / 4294967296) % 4294967296;
        l_v65_0 = v67 + l_v67_0;
        v67 = l_v65_0 % 4294967296;
        v75 = (v75 + l_v75_0 + (l_v65_0 - v67) / 4294967296) % 4294967296;
        l_v65_0 = v68 + l_v68_0;
        v68 = l_v65_0 % 4294967296;
        v76 = (v76 + l_v76_0 + (l_v65_0 - v68) / 4294967296) % 4294967296;
        l_v65_0 = v69 + l_v69_0;
        v69 = l_v65_0 % 4294967296;
        v77 = (v77 + l_v77_0 + (l_v65_0 - v69) / 4294967296) % 4294967296;
        l_v65_0 = v70 + l_v70_0;
        v70 = l_v65_0 % 4294967296;
        v78 = (v78 + l_v78_0 + (l_v65_0 - v70) / 4294967296) % 4294967296;
        l_v65_0 = v71 + l_v71_0;
        v71 = l_v65_0 % 4294967296;
        v79 = (v79 + l_v79_0 + (l_v65_0 - v71) / 4294967296) % 4294967296;
        l_v65_0 = v72 + l_v72_0;
        v72 = l_v65_0 % 4294967296;
        v80 = (v80 + l_v80_0 + (l_v65_0 - v72) / 4294967296) % 4294967296;
    end;
    v57[1] = v65;
    v57[2] = v66;
    v57[3] = v67;
    v57[4] = v68;
    v57[5] = v69;
    v57[6] = v70;
    v57[7] = v71;
    v57[8] = v72;
    v58[1] = v73;
    v58[2] = v74;
    v58[3] = v75;
    v58[4] = v76;
    v58[5] = v77;
    v58[6] = v78;
    v58[7] = v79;
    v58[8] = v80;
end;
local function v148(v117, v118, v119, v120) --[[ Line: 352 ]] --[[ Name: md5_feed_64 ]]
    local l_v21_2 = v21;
    local l_v18_0 = v18;
    local l_v20_0 = v20;
    local v124 = v117[1];
    local v125 = v117[2];
    local v126 = v117[3];
    local v127 = v117[4];
    for v128 = v119, v119 + v120 - 1, 64 do
        local l_v128_0 = v128;
        for v130 = 1, 16 do
            l_v128_0 = l_v128_0 + 4;
            local v131, v132, v133, v134 = string.byte(v118, l_v128_0 - 3, l_v128_0);
            l_v21_2[v130] = ((v134 * 256 + v133) * 256 + v132) * 256 + v131;
        end;
        local l_v124_0 = v124;
        local l_v125_0 = v125;
        local l_v126_0 = v126;
        local l_v127_0 = v127;
        local v139 = 25;
        for v140 = 1, 16 do
            local v141 = l_rrotate_0(l_band_0(l_v125_0, l_v126_0) + l_band_0(-1 - l_v125_0, l_v127_0) + l_v124_0 + l_v18_0[v140] + l_v21_2[v140], v139) + l_v125_0;
            v139 = l_v20_0[v139];
            l_v124_0 = l_v127_0;
            l_v127_0 = l_v126_0;
            l_v126_0 = l_v125_0;
            l_v125_0 = v141;
        end;
        v139 = 27;
        for v142 = 17, 32 do
            local v143 = l_rrotate_0(l_band_0(l_v127_0, l_v125_0) + l_band_0(-1 - l_v127_0, l_v126_0) + l_v124_0 + l_v18_0[v142] + l_v21_2[(5 * v142 - 4) % 16 + 1], v139) + l_v125_0;
            v139 = l_v20_0[v139];
            l_v124_0 = l_v127_0;
            l_v127_0 = l_v126_0;
            l_v126_0 = l_v125_0;
            l_v125_0 = v143;
        end;
        v139 = 28;
        for v144 = 33, 48 do
            local v145 = l_rrotate_0(l_bxor_0(l_bxor_0(l_v125_0, l_v126_0), l_v127_0) + l_v124_0 + l_v18_0[v144] + l_v21_2[(3 * v144 + 2) % 16 + 1], v139) + l_v125_0;
            v139 = l_v20_0[v139];
            l_v124_0 = l_v127_0;
            l_v127_0 = l_v126_0;
            l_v126_0 = l_v125_0;
            l_v125_0 = v145;
        end;
        v139 = 26;
        for v146 = 49, 64 do
            local v147 = l_rrotate_0(l_bxor_0(l_v126_0, (l_bor_0(l_v125_0, -1 - l_v127_0))) + l_v124_0 + l_v18_0[v146] + l_v21_2[(v146 * 7 - 7) % 16 + 1], v139) + l_v125_0;
            v139 = l_v20_0[v139];
            l_v124_0 = l_v127_0;
            l_v127_0 = l_v126_0;
            l_v126_0 = l_v125_0;
            l_v125_0 = v147;
        end;
        v124 = (l_v124_0 + v124) % 4294967296;
        v125 = (l_v125_0 + v125) % 4294967296;
        v126 = (l_v126_0 + v126) % 4294967296;
        v127 = (l_v127_0 + v127) % 4294967296;
    end;
    v117[1] = v124;
    v117[2] = v125;
    v117[3] = v126;
    v117[4] = v127;
end;
local function v180(v149, v150, v151, v152) --[[ Line: 414 ]] --[[ Name: sha1_feed_64 ]]
    local l_v21_3 = v21;
    local v154 = v149[1];
    local v155 = v149[2];
    local v156 = v149[3];
    local v157 = v149[4];
    local v158 = v149[5];
    for v159 = v151, v151 + v152 - 1, 64 do
        local l_v159_0 = v159;
        for v161 = 1, 16 do
            l_v159_0 = l_v159_0 + 4;
            local v162, v163, v164, v165 = string.byte(v150, l_v159_0 - 3, l_v159_0);
            l_v21_3[v161] = ((v162 * 256 + v163) * 256 + v164) * 256 + v165;
        end;
        for v166 = 17, 80 do
            l_v21_3[v166] = l_lrotate_0(l_bxor_0(l_v21_3[v166 - 3], l_v21_3[v166 - 8], l_v21_3[v166 - 14], l_v21_3[v166 - 16]), 1);
        end;
        local l_v154_0 = v154;
        local l_v155_0 = v155;
        local l_v156_0 = v156;
        local l_v157_0 = v157;
        local l_v158_0 = v158;
        for v172 = 1, 20 do
            local v173 = l_lrotate_0(l_v154_0, 5) + l_band_0(l_v155_0, l_v156_0) + l_band_0(-1 - l_v155_0, l_v157_0) + 1518500249 + l_v21_3[v172] + l_v158_0;
            l_v158_0 = l_v157_0;
            l_v157_0 = l_v156_0;
            l_v156_0 = l_rrotate_0(l_v155_0, 2);
            l_v155_0 = l_v154_0;
            l_v154_0 = v173;
        end;
        for v174 = 21, 40 do
            local v175 = l_lrotate_0(l_v154_0, 5) + l_bxor_0(l_v155_0, l_v156_0, l_v157_0) + 1859775393 + l_v21_3[v174] + l_v158_0;
            l_v158_0 = l_v157_0;
            l_v157_0 = l_v156_0;
            l_v156_0 = l_rrotate_0(l_v155_0, 2);
            l_v155_0 = l_v154_0;
            l_v154_0 = v175;
        end;
        for v176 = 41, 60 do
            local v177 = l_lrotate_0(l_v154_0, 5) + l_band_0(l_v157_0, l_v156_0) + l_band_0(l_v155_0, (l_bxor_0(l_v157_0, l_v156_0))) + 2400959708 + l_v21_3[v176] + l_v158_0;
            l_v158_0 = l_v157_0;
            l_v157_0 = l_v156_0;
            l_v156_0 = l_rrotate_0(l_v155_0, 2);
            l_v155_0 = l_v154_0;
            l_v154_0 = v177;
        end;
        for v178 = 61, 80 do
            local v179 = l_lrotate_0(l_v154_0, 5) + l_bxor_0(l_v155_0, l_v156_0, l_v157_0) + 3395469782 + l_v21_3[v178] + l_v158_0;
            l_v158_0 = l_v157_0;
            l_v157_0 = l_v156_0;
            l_v156_0 = l_rrotate_0(l_v155_0, 2);
            l_v155_0 = l_v154_0;
            l_v154_0 = v179;
        end;
        v154 = (l_v154_0 + v154) % 4294967296;
        v155 = (l_v155_0 + v155) % 4294967296;
        v156 = (l_v156_0 + v156) % 4294967296;
        v157 = (l_v157_0 + v157) % 4294967296;
        v158 = (l_v158_0 + v158) % 4294967296;
    end;
    v149[1] = v154;
    v149[2] = v155;
    v149[3] = v156;
    v149[4] = v157;
    v149[5] = v158;
end;
local function v278(v181, v182, v183, v184, v185, v186) --[[ Line: 476 ]] --[[ Name: keccak_feed ]]
    local l_v13_0 = v13;
    local l_v14_0 = v14;
    local v189 = v186 / 8;
    for v190 = v184, v184 + v185 - 1, v186 do
        local l_v190_0 = v190;
        for v192 = 1, v189 do
            local v193, v194, v195, v196 = string.byte(v183, l_v190_0 + 1, l_v190_0 + 4);
            v181[v192] = l_bxor_0(v181[v192], ((v196 * 256 + v195) * 256 + v194) * 256 + v193);
            l_v190_0 = l_v190_0 + 8;
            local v197, v198, v199, v200 = string.byte(v183, l_v190_0 - 3, l_v190_0);
            v182[v192] = l_bxor_0(v182[v192], ((v200 * 256 + v199) * 256 + v198) * 256 + v197);
        end;
        local v201 = v181[1];
        local v202 = v182[1];
        local v203 = v181[2];
        local v204 = v182[2];
        local v205 = v181[3];
        local v206 = v182[3];
        local v207 = v181[4];
        local v208 = v182[4];
        local v209 = v181[5];
        local v210 = v182[5];
        local v211 = v181[6];
        local v212 = v182[6];
        local v213 = v181[7];
        local v214 = v182[7];
        local v215 = v181[8];
        local v216 = v182[8];
        local v217 = v181[9];
        local v218 = v182[9];
        local v219 = v181[10];
        local v220 = v182[10];
        local v221 = v181[11];
        local v222 = v182[11];
        local v223 = v181[12];
        local v224 = v182[12];
        local v225 = v181[13];
        local v226 = v182[13];
        local v227 = v181[14];
        local v228 = v182[14];
        local v229 = v181[15];
        local v230 = v182[15];
        local v231 = v181[16];
        local v232 = v182[16];
        local v233 = v181[17];
        local v234 = v182[17];
        local v235 = v181[18];
        local v236 = v182[18];
        local v237 = v181[19];
        local v238 = v182[19];
        local v239 = v181[20];
        local v240 = v182[20];
        local v241 = v181[21];
        local v242 = v182[21];
        local v243 = v181[22];
        local v244 = v182[22];
        local v245 = v181[23];
        local v246 = v182[23];
        local v247 = v181[24];
        local v248 = v182[24];
        local v249 = v181[25];
        local v250 = v182[25];
        for v251 = 1, 24 do
            local v252 = l_bxor_0(v201, v211, v221, v231, v241);
            local v253 = l_bxor_0(v202, v212, v222, v232, v242);
            local v254 = l_bxor_0(v203, v213, v223, v233, v243);
            local v255 = l_bxor_0(v204, v214, v224, v234, v244);
            local v256 = l_bxor_0(v205, v215, v225, v235, v245);
            local v257 = l_bxor_0(v206, v216, v226, v236, v246);
            local v258 = l_bxor_0(v207, v217, v227, v237, v247);
            local v259 = l_bxor_0(v208, v218, v228, v238, v248);
            local v260 = l_bxor_0(v209, v219, v229, v239, v249);
            local v261 = l_bxor_0(v210, v220, v230, v240, v250);
            local v262 = l_bxor_0(v252, v256 * 2 + (v257 % 4294967296 - v257 % 2147483648) / 2147483648);
            local v263 = l_bxor_0(v253, v257 * 2 + (v256 % 4294967296 - v256 % 2147483648) / 2147483648);
            local v264 = l_bxor_0(v262, v203);
            local v265 = l_bxor_0(v263, v204);
            local v266 = l_bxor_0(v262, v213);
            local v267 = l_bxor_0(v263, v214);
            local v268 = l_bxor_0(v262, v223);
            local v269 = l_bxor_0(v263, v224);
            local v270 = l_bxor_0(v262, v233);
            local v271 = l_bxor_0(v263, v234);
            local v272 = l_bxor_0(v262, v243);
            local v273 = l_bxor_0(v263, v244);
            v203 = (v266 % 4294967296 - v266 % 1048576) / 1048576 + v267 * 4096;
            v204 = (v267 % 4294967296 - v267 % 1048576) / 1048576 + v266 * 4096;
            v213 = (v270 % 4294967296 - v270 % 524288) / 524288 + v271 * 8192;
            v214 = (v271 % 4294967296 - v271 % 524288) / 524288 + v270 * 8192;
            v223 = v264 * 2 + (v265 % 4294967296 - v265 % 2147483648) / 2147483648;
            v224 = v265 * 2 + (v264 % 4294967296 - v264 % 2147483648) / 2147483648;
            v233 = v268 * 1024 + (v269 % 4294967296 - v269 % 4194304) / 4194304;
            v234 = v269 * 1024 + (v268 % 4294967296 - v268 % 4194304) / 4194304;
            v243 = v272 * 4 + (v273 % 4294967296 - v273 % 1073741824) / 1073741824;
            v244 = v273 * 4 + (v272 % 4294967296 - v272 % 1073741824) / 1073741824;
            v262 = l_bxor_0(v254, v258 * 2 + (v259 % 4294967296 - v259 % 2147483648) / 2147483648);
            v263 = l_bxor_0(v255, v259 * 2 + (v258 % 4294967296 - v258 % 2147483648) / 2147483648);
            v264 = l_bxor_0(v262, v205);
            v265 = l_bxor_0(v263, v206);
            v266 = l_bxor_0(v262, v215);
            v267 = l_bxor_0(v263, v216);
            v268 = l_bxor_0(v262, v225);
            v269 = l_bxor_0(v263, v226);
            v270 = l_bxor_0(v262, v235);
            v271 = l_bxor_0(v263, v236);
            v272 = l_bxor_0(v262, v245);
            v273 = l_bxor_0(v263, v246);
            v205 = (v268 % 4294967296 - v268 % 2097152) / 2097152 + v269 * 2048;
            v206 = (v269 % 4294967296 - v269 % 2097152) / 2097152 + v268 * 2048;
            v215 = (v272 % 4294967296 - v272 % 8) / 8 + v273 * 536870912 % 4294967296;
            v216 = (v273 % 4294967296 - v273 % 8) / 8 + v272 * 536870912 % 4294967296;
            v225 = v266 * 64 + (v267 % 4294967296 - v267 % 67108864) / 67108864;
            v226 = v267 * 64 + (v266 % 4294967296 - v266 % 67108864) / 67108864;
            v235 = v270 * 32768 + (v271 % 4294967296 - v271 % 131072) / 131072;
            v236 = v271 * 32768 + (v270 % 4294967296 - v270 % 131072) / 131072;
            v245 = (v264 % 4294967296 - v264 % 4) / 4 + v265 * 1073741824 % 4294967296;
            v246 = (v265 % 4294967296 - v265 % 4) / 4 + v264 * 1073741824 % 4294967296;
            v262 = l_bxor_0(v256, v260 * 2 + (v261 % 4294967296 - v261 % 2147483648) / 2147483648);
            v263 = l_bxor_0(v257, v261 * 2 + (v260 % 4294967296 - v260 % 2147483648) / 2147483648);
            v264 = l_bxor_0(v262, v207);
            v265 = l_bxor_0(v263, v208);
            v266 = l_bxor_0(v262, v217);
            v267 = l_bxor_0(v263, v218);
            v268 = l_bxor_0(v262, v227);
            v269 = l_bxor_0(v263, v228);
            v270 = l_bxor_0(v262, v237);
            v271 = l_bxor_0(v263, v238);
            v272 = l_bxor_0(v262, v247);
            v273 = l_bxor_0(v263, v248);
            v207 = v270 * 2097152 % 4294967296 + (v271 % 4294967296 - v271 % 2048) / 2048;
            v208 = v271 * 2097152 % 4294967296 + (v270 % 4294967296 - v270 % 2048) / 2048;
            v217 = v264 * 268435456 % 4294967296 + (v265 % 4294967296 - v265 % 16) / 16;
            v218 = v265 * 268435456 % 4294967296 + (v264 % 4294967296 - v264 % 16) / 16;
            v227 = v268 * 33554432 % 4294967296 + (v269 % 4294967296 - v269 % 128) / 128;
            v228 = v269 * 33554432 % 4294967296 + (v268 % 4294967296 - v268 % 128) / 128;
            v237 = (v272 % 4294967296 - v272 % 256) / 256 + v273 * 16777216 % 4294967296;
            v238 = (v273 % 4294967296 - v273 % 256) / 256 + v272 * 16777216 % 4294967296;
            v247 = (v266 % 4294967296 - v266 % 512) / 512 + v267 * 8388608 % 4294967296;
            v248 = (v267 % 4294967296 - v267 % 512) / 512 + v266 * 8388608 % 4294967296;
            v262 = l_bxor_0(v258, v252 * 2 + (v253 % 4294967296 - v253 % 2147483648) / 2147483648);
            v263 = l_bxor_0(v259, v253 * 2 + (v252 % 4294967296 - v252 % 2147483648) / 2147483648);
            v264 = l_bxor_0(v262, v209);
            v265 = l_bxor_0(v263, v210);
            v266 = l_bxor_0(v262, v219);
            v267 = l_bxor_0(v263, v220);
            v268 = l_bxor_0(v262, v229);
            v269 = l_bxor_0(v263, v230);
            v270 = l_bxor_0(v262, v239);
            v271 = l_bxor_0(v263, v240);
            v272 = l_bxor_0(v262, v249);
            v273 = l_bxor_0(v263, v250);
            v209 = v272 * 16384 + (v273 % 4294967296 - v273 % 262144) / 262144;
            v210 = v273 * 16384 + (v272 % 4294967296 - v272 % 262144) / 262144;
            v219 = v266 * 1048576 % 4294967296 + (v267 % 4294967296 - v267 % 4096) / 4096;
            v220 = v267 * 1048576 % 4294967296 + (v266 % 4294967296 - v266 % 4096) / 4096;
            v229 = v270 * 256 + (v271 % 4294967296 - v271 % 16777216) / 16777216;
            v230 = v271 * 256 + (v270 % 4294967296 - v270 % 16777216) / 16777216;
            v239 = v264 * 134217728 % 4294967296 + (v265 % 4294967296 - v265 % 32) / 32;
            v240 = v265 * 134217728 % 4294967296 + (v264 % 4294967296 - v264 % 32) / 32;
            v249 = (v268 % 4294967296 - v268 % 33554432) / 33554432 + v269 * 128;
            v250 = (v269 % 4294967296 - v269 % 33554432) / 33554432 + v268 * 128;
            v262 = l_bxor_0(v260, v254 * 2 + (v255 % 4294967296 - v255 % 2147483648) / 2147483648);
            v263 = l_bxor_0(v261, v255 * 2 + (v254 % 4294967296 - v254 % 2147483648) / 2147483648);
            v266 = l_bxor_0(v262, v211);
            v267 = l_bxor_0(v263, v212);
            v268 = l_bxor_0(v262, v221);
            v269 = l_bxor_0(v263, v222);
            v270 = l_bxor_0(v262, v231);
            v271 = l_bxor_0(v263, v232);
            v272 = l_bxor_0(v262, v241);
            v273 = l_bxor_0(v263, v242);
            v211 = v268 * 8 + (v269 % 4294967296 - v269 % 536870912) / 536870912;
            v212 = v269 * 8 + (v268 % 4294967296 - v268 % 536870912) / 536870912;
            v221 = v272 * 262144 + (v273 % 4294967296 - v273 % 16384) / 16384;
            v222 = v273 * 262144 + (v272 % 4294967296 - v272 % 16384) / 16384;
            v231 = (v266 % 4294967296 - v266 % 268435456) / 268435456 + v267 * 16;
            v232 = (v267 % 4294967296 - v267 % 268435456) / 268435456 + v266 * 16;
            v241 = (v270 % 4294967296 - v270 % 8388608) / 8388608 + v271 * 512;
            v242 = (v271 % 4294967296 - v271 % 8388608) / 8388608 + v270 * 512;
            v201 = l_bxor_0(v262, v201);
            v202 = l_bxor_0(v263, v202);
            local v274 = l_bxor_0(v201, (l_band_0(-1 - v203, v205)));
            local v275 = l_bxor_0(v203, (l_band_0(-1 - v205, v207)));
            v205 = l_bxor_0(v205, (l_band_0(-1 - v207, v209)));
            v207 = l_bxor_0(v207, (l_band_0(-1 - v209, v201)));
            v209 = l_bxor_0(v209, (l_band_0(-1 - v201, v203)));
            v201 = v274;
            v203 = v275;
            v274 = l_bxor_0(v202, (l_band_0(-1 - v204, v206)));
            v275 = l_bxor_0(v204, (l_band_0(-1 - v206, v208)));
            v206 = l_bxor_0(v206, (l_band_0(-1 - v208, v210)));
            v208 = l_bxor_0(v208, (l_band_0(-1 - v210, v202)));
            v210 = l_bxor_0(v210, (l_band_0(-1 - v202, v204)));
            v202 = v274;
            v204 = v275;
            v274 = l_bxor_0(v217, (l_band_0(-1 - v219, v211)));
            v275 = l_bxor_0(v219, (l_band_0(-1 - v211, v213)));
            local v276 = l_bxor_0(v211, (l_band_0(-1 - v213, v215)));
            local v277 = l_bxor_0(v213, (l_band_0(-1 - v215, v217)));
            v219 = l_bxor_0(v215, (l_band_0(-1 - v217, v219)));
            v211 = v274;
            v213 = v275;
            v215 = v276;
            v217 = v277;
            v274 = l_bxor_0(v218, (l_band_0(-1 - v220, v212)));
            v275 = l_bxor_0(v220, (l_band_0(-1 - v212, v214)));
            v276 = l_bxor_0(v212, (l_band_0(-1 - v214, v216)));
            v277 = l_bxor_0(v214, (l_band_0(-1 - v216, v218)));
            v220 = l_bxor_0(v216, (l_band_0(-1 - v218, v220)));
            v212 = v274;
            v214 = v275;
            v216 = v276;
            v218 = v277;
            v274 = l_bxor_0(v223, (l_band_0(-1 - v225, v227)));
            v275 = l_bxor_0(v225, (l_band_0(-1 - v227, v229)));
            v276 = l_bxor_0(v227, (l_band_0(-1 - v229, v221)));
            v227 = l_bxor_0(v229, (l_band_0(-1 - v221, v223)));
            v229 = l_bxor_0(v221, (l_band_0(-1 - v223, v225)));
            v221 = v274;
            v223 = v275;
            v225 = v276;
            v274 = l_bxor_0(v224, (l_band_0(-1 - v226, v228)));
            v275 = l_bxor_0(v226, (l_band_0(-1 - v228, v230)));
            v276 = l_bxor_0(v228, (l_band_0(-1 - v230, v222)));
            v228 = l_bxor_0(v230, (l_band_0(-1 - v222, v224)));
            v230 = l_bxor_0(v222, (l_band_0(-1 - v224, v226)));
            v222 = v274;
            v224 = v275;
            v226 = v276;
            v274 = l_bxor_0(v239, (l_band_0(-1 - v231, v233)));
            v275 = l_bxor_0(v231, (l_band_0(-1 - v233, v235)));
            v276 = l_bxor_0(v233, (l_band_0(-1 - v235, v237)));
            v277 = l_bxor_0(v235, (l_band_0(-1 - v237, v239)));
            v239 = l_bxor_0(v237, (l_band_0(-1 - v239, v231)));
            v231 = v274;
            v233 = v275;
            v235 = v276;
            v237 = v277;
            v274 = l_bxor_0(v240, (l_band_0(-1 - v232, v234)));
            v275 = l_bxor_0(v232, (l_band_0(-1 - v234, v236)));
            v276 = l_bxor_0(v234, (l_band_0(-1 - v236, v238)));
            v277 = l_bxor_0(v236, (l_band_0(-1 - v238, v240)));
            v240 = l_bxor_0(v238, (l_band_0(-1 - v240, v232)));
            v232 = v274;
            v234 = v275;
            v236 = v276;
            v238 = v277;
            v274 = l_bxor_0(v245, (l_band_0(-1 - v247, v249)));
            v275 = l_bxor_0(v247, (l_band_0(-1 - v249, v241)));
            v276 = l_bxor_0(v249, (l_band_0(-1 - v241, v243)));
            v277 = l_bxor_0(v241, (l_band_0(-1 - v243, v245)));
            v249 = l_bxor_0(v243, (l_band_0(-1 - v245, v247)));
            v241 = v274;
            v243 = v275;
            v245 = v276;
            v247 = v277;
            v274 = l_bxor_0(v246, (l_band_0(-1 - v248, v250)));
            v275 = l_bxor_0(v248, (l_band_0(-1 - v250, v242)));
            v276 = l_bxor_0(v250, (l_band_0(-1 - v242, v244)));
            v277 = l_bxor_0(v242, (l_band_0(-1 - v244, v246)));
            v250 = l_bxor_0(v244, (l_band_0(-1 - v246, v248)));
            v242 = v274;
            v244 = v275;
            v246 = v276;
            v248 = v277;
            v201 = l_bxor_0(v201, l_v13_0[v251]);
            v202 = v202 + l_v14_0[v251];
        end;
        v181[1] = v201;
        v182[1] = v202;
        v181[2] = v203;
        v182[2] = v204;
        v181[3] = v205;
        v182[3] = v206;
        v181[4] = v207;
        v182[4] = v208;
        v181[5] = v209;
        v182[5] = v210;
        v181[6] = v211;
        v182[6] = v212;
        v181[7] = v213;
        v182[7] = v214;
        v181[8] = v215;
        v182[8] = v216;
        v181[9] = v217;
        v182[9] = v218;
        v181[10] = v219;
        v182[10] = v220;
        v181[11] = v221;
        v182[11] = v222;
        v181[12] = v223;
        v182[12] = v224;
        v181[13] = v225;
        v182[13] = v226;
        v181[14] = v227;
        v182[14] = v228;
        v181[15] = v229;
        v182[15] = v230;
        v181[16] = v231;
        v182[16] = v232;
        v181[17] = v233;
        v182[17] = v234;
        v181[18] = v235;
        v182[18] = v236;
        v181[19] = v237;
        v182[19] = v238;
        v181[20] = v239;
        v182[20] = v240;
        v181[21] = v241;
        v182[21] = v242;
        v181[22] = v243;
        v182[22] = v244;
        v181[23] = v245;
        v182[23] = v246;
        v181[24] = v247;
        v182[24] = v248;
        v181[25] = v249;
        v182[25] = v250;
    end;
end;
local function v290(v279, v280, v281, v282) --[[ Line: 803 ]] --[[ Name: mul ]]
    local v283 = table.create(v282);
    local v284 = 0;
    local v285 = 0;
    local v286 = 1;
    for v287 = 1, v282 do
        for v288 = math.max(1, v287 + 1 - #v280), math.min(v287, #v279) do
            v284 = v284 + v281 * v279[v288] * v280[v287 + 1 - v288];
        end;
        local v289 = v284 % 16777216;
        v283[v287] = math.floor(v289);
        v284 = (v284 - v289) / 16777216;
        v285 = v285 + v289 * v286;
        v286 = v286 * 16777216;
    end;
    return v283, v285;
end;
local v291 = 0;
local v292 = {
    4, 
    1, 
    2, 
    -2, 
    2
};
local v293 = 4;
local v294 = {
    1
};
local l_v12_0 = v12;
local l_v11_0 = v11;
repeat
    v293 = v293 + v292[v293 % 6];
    local v297 = 1;
    while true do
        v297 = v297 + v292[v297 % 6];
        if v293 < v297 * v297 then
            local v298 = v293 ^ 0.3333333333333333;
            local v299 = v298 * 1099511627776;
            v299 = v290(table.create(1, (math.floor(v299))), v294, 1, 2);
            local v300, v301 = v290(v299, v290(v299, v299, 1, 4), -1, 4);
            local v302 = v299[2] % 65536 * 65536 + math.floor(v299[1] / 256);
            local v303 = v299[1] % 256 * 16777216 + math.floor(v301 * 4.625929269271485E-18 * v298 / v293);
            if v291 < 16 then
                v298 = math.sqrt(v293);
                v299 = v298 * 1099511627776;
                v299 = v290(table.create(1, (math.floor(v299))), v294, 1, 2);
                local v304, v305 = v290(v299, v299, -1, 2);
                v300 = v304;
                v301 = v305;
                v304 = v299[2] % 65536 * 65536 + math.floor(v299[1] / 256);
                v305 = v299[1] % 256 * 16777216 + math.floor(v301 * 7.62939453125E-6 / v298);
                local v306 = v291 % 8 + 1;
                v15[224][v306] = v305;
                local v307 = v305 + v304 * 0;
                l_v12_0[v306] = v304;
                l_v11_0[v306] = v307;
                if v306 > 7 then
                    l_v12_0 = v17[384];
                    l_v11_0 = v16[384];
                end;
            end;
            v291 = v291 + 1;
            local v308 = v303 % 4294967296 + v302 * 0;
            v10[v291] = v302;
            v9[v291] = v308;
            break;
        elseif v293 % v297 == 0 then
            break;
        end;
    end;
until v291 > 79;
for v309 = 224, 256, 32 do
    v293 = {};
    v294 = nil;
    v294 = {};
    for v310 = 1, 8 do
        v293[v310] = l_bxor_0(v11[v310], 2779096485) % 4294967296;
        v294[v310] = l_bxor_0(v12[v310], 2779096485) % 4294967296;
    end;
    v116(v293, v294, "SHA-512/" .. tostring(v309) .. "\128" .. string.rep("\000", 115) .. "X", 0, 128);
    v16[v309] = v293;
    v17[v309] = v294;
end;
for v311 = 1, 64 do
    v293, v294 = math.modf(math.abs((math.sin(v311))) * 65536);
    v18[v311] = v293 * 65536 + math.floor(v294 * 65536);
end;
v290 = 29;
do
    local l_v290_0 = v290;
    v291 = function() --[[ Line: 893 ]] --[[ Name: next_bit ]]
        local v313 = l_v290_0 % 2;
        l_v290_0 = l_bxor_0((l_v290_0 - v313) / 2, 142 * v313);
        return v313;
    end;
    for v314 = 1, 24 do
        l_v12_0 = 0;
        l_v11_0 = nil;
        for _ = 1, 6 do
            l_v11_0 = l_v11_0 and l_v11_0 * l_v11_0 * 2 or 1;
            local v316 = l_v290_0 % 2;
            l_v290_0 = l_bxor_0((l_v290_0 - v316) / 2, 142 * v316);
            l_v12_0 = l_v12_0 + v316 * l_v11_0;
        end;
        local v317 = l_v290_0 % 2;
        l_v290_0 = l_bxor_0((l_v290_0 - v317) / 2, 142 * v317);
        local v318 = v317 * l_v11_0;
        local v319 = l_v12_0 + v318 * 0;
        v14[v314] = v318;
        v13[v314] = v319;
    end;
end;
v290 = function(v320, v321) --[[ Line: 914 ]] --[[ Name: sha256ext ]]
    local v322 = v15[v320];
    local v323 = 0;
    local v324 = "";
    local v325 = table.create(8);
    local v326 = v322[1];
    local v327 = v322[2];
    local v328 = v322[3];
    local v329 = v322[4];
    local v330 = v322[5];
    local v331 = v322[6];
    local v332 = v322[7];
    local v333 = v322[8];
    v325[1] = v326;
    v325[2] = v327;
    v325[3] = v328;
    v325[4] = v329;
    v325[5] = v330;
    v325[6] = v331;
    v325[7] = v332;
    v325[8] = v333;
    v326 = function(v334) --[[ Line: 922 ]] --[[ Name: partial ]]
        if v334 then
            local v335 = #v334;
            if v324 then
                v323 = v323 + v335;
                local v336 = 0;
                local v337 = #v324;
                if v324 ~= "" and v337 + v335 >= 64 then
                    v336 = 64 - v337;
                    v56(v325, v324 .. string.sub(v334, 1, v336), 0, 64);
                    v324 = "";
                end;
                local v338 = v335 - v336;
                local v339 = v338 % 64;
                v56(v325, v334, v336, v338 - v339);
                v324 = v324 .. string.sub(v334, v335 + 1 - v339);
                return v326;
            else
                error("Adding more chunks is not allowed after receiving the result", 2);
                return;
            end;
        else
            if v324 then
                local v340 = table.create(10);
                v340[1] = v324;
                v340[2] = "\128";
                v340[3] = string.rep("\000", (-9 - v323) % 64 + 1);
                v324 = nil;
                v323 = v323 * 1.1102230246251565E-16;
                for v341 = 4, 10 do
                    v323 = v323 % 1 * 256;
                    v340[v341] = string.char((math.floor(v323)));
                end;
                v340 = table.concat(v340);
                v56(v325, v340, 0, #v340);
                local v342 = v320 / 32;
                for v343 = 1, v342 do
                    v325[v343] = string.format("%08x", v325[v343] % 4294967296);
                end;
                v325 = table.concat(v325, "", 1, v342);
            end;
            return v325;
        end;
    end;
    if v321 then
        return v326(v321)();
    else
        return v326;
    end;
end;
v291 = function(v344, v345) --[[ Line: 984 ]] --[[ Name: sha512ext ]]
    local v346 = 0;
    local v347 = "";
    local v348 = table.pack(table.unpack(v16[v344]));
    local v349 = table.pack(table.unpack(v17[v344]));
    local function v350(v351) --[[ Line: 992 ]] --[[ Name: partial ]]
        if v351 then
            local v352 = #v351;
            if v347 then
                v346 = v346 + v352;
                local v353 = 0;
                if v347 ~= "" and #v347 + v352 >= 128 then
                    v353 = 128 - #v347;
                    v116(v348, v349, v347 .. string.sub(v351, 1, v353), 0, 128);
                    v347 = "";
                end;
                local v354 = v352 - v353;
                local v355 = v354 % 128;
                v116(v348, v349, v351, v353, v354 - v355);
                v347 = v347 .. string.sub(v351, v352 + 1 - v355);
                return v350;
            else
                error("Adding more chunks is not allowed after receiving the result", 2);
                return;
            end;
        else
            if v347 then
                local v356 = table.create(3);
                v356[1] = v347;
                v356[2] = "\128";
                v356[3] = string.rep("\000", (-17 - v346) % 128 + 9);
                v347 = nil;
                v346 = v346 * 1.1102230246251565E-16;
                for v357 = 4, 10 do
                    v346 = v346 % 1 * 256;
                    v356[v357] = string.char((math.floor(v346)));
                end;
                v356 = table.concat(v356);
                v116(v348, v349, v356, 0, #v356);
                local v358 = math.ceil(v344 / 64);
                for v359 = 1, v358 do
                    v348[v359] = string.format("%08x", v349[v359] % 4294967296) .. string.format("%08x", v348[v359] % 4294967296);
                end;
                v349 = nil;
                v348 = string.sub(table.concat(v348, "", 1, v358), 1, v344 / 4);
            end;
            return v348;
        end;
    end;
    if v345 then
        return v350(v345)();
    else
        return v350;
    end;
end;
v292 = function(v360) --[[ Line: 1062 ]] --[[ Name: md5 ]]
    local v361 = table.create(4);
    local v362 = 0;
    local v363 = "";
    local v364 = v19[1];
    local v365 = v19[2];
    local v366 = v19[3];
    local v367 = v19[4];
    v361[1] = v364;
    v361[2] = v365;
    v361[3] = v366;
    v361[4] = v367;
    v364 = function(v368) --[[ Line: 1067 ]] --[[ Name: partial ]]
        if v368 then
            local v369 = #v368;
            if v363 then
                v362 = v362 + v369;
                local v370 = 0;
                if v363 ~= "" and #v363 + v369 >= 64 then
                    v370 = 64 - #v363;
                    v148(v361, v363 .. string.sub(v368, 1, v370), 0, 64);
                    v363 = "";
                end;
                local v371 = v369 - v370;
                local v372 = v371 % 64;
                v148(v361, v368, v370, v371 - v372);
                v363 = v363 .. string.sub(v368, v369 + 1 - v372);
                return v364;
            else
                error("Adding more chunks is not allowed after receiving the result", 2);
                return;
            end;
        else
            if v363 then
                local v373 = table.create(3);
                v373[1] = v363;
                v373[2] = "\128";
                v373[3] = string.rep("\000", (-9 - v362) % 64);
                v363 = nil;
                v362 = v362 * 8;
                for v374 = 4, 11 do
                    local v375 = v362 % 256;
                    v373[v374] = string.char(v375);
                    v362 = (v362 - v375) / 256;
                end;
                v373 = table.concat(v373);
                v148(v361, v373, 0, #v373);
                for v376 = 1, 4 do
                    v361[v376] = string.format("%08x", v361[v376] % 4294967296);
                end;
                v361 = string.gsub(table.concat(v361), "(..)(..)(..)(..)", "%4%3%2%1");
            end;
            return v361;
        end;
    end;
    if v360 then
        return v364(v360)();
    else
        return v364;
    end;
end;
v293 = function(v377) --[[ Line: 1124 ]] --[[ Name: sha1 ]]
    local v378 = table.pack(table.unpack(v19));
    local v379 = 0;
    local v380 = "";
    local function v381(v382) --[[ Line: 1128 ]] --[[ Name: partial ]]
        if v382 then
            local v383 = #v382;
            if v380 then
                v379 = v379 + v383;
                local v384 = 0;
                if v380 ~= "" and #v380 + v383 >= 64 then
                    v384 = 64 - #v380;
                    v180(v378, v380 .. string.sub(v382, 1, v384), 0, 64);
                    v380 = "";
                end;
                local v385 = v383 - v384;
                local v386 = v385 % 64;
                v180(v378, v382, v384, v385 - v386);
                v380 = v380 .. string.sub(v382, v383 + 1 - v386);
                return v381;
            else
                error("Adding more chunks is not allowed after receiving the result", 2);
                return;
            end;
        else
            if v380 then
                local v387 = table.create(10);
                v387[1] = v380;
                v387[2] = "\128";
                v387[3] = string.rep("\000", (-9 - v379) % 64 + 1);
                v380 = nil;
                v379 = v379 * 1.1102230246251565E-16;
                for v388 = 4, 10 do
                    v379 = v379 % 1 * 256;
                    v387[v388] = string.char((math.floor(v379)));
                end;
                v387 = table.concat(v387);
                v180(v378, v387, 0, #v387);
                for v389 = 1, 5 do
                    v378[v389] = string.format("%08x", v378[v389] % 4294967296);
                end;
                v378 = table.concat(v378);
            end;
            return v378;
        end;
    end;
    if v377 then
        return v381(v377)();
    else
        return v381;
    end;
end;
v294 = function(v390, v391, v392, v393) --[[ Line: 1187 ]] --[[ Name: keccak ]]
    if type(v391) ~= "number" then
        error("Argument 'digest_size_in_bytes' must be a number", 2);
    end;
    local v394 = "";
    local v395 = table.create(25, 0);
    local v396 = table.create(25, 0);
    local v397 = nil;
    local function v398(v399) --[[ Line: 1213 ]] --[[ Name: partial ]]
        if v399 then
            local v400 = #v399;
            if v394 then
                local v401 = 0;
                if v394 ~= "" and #v394 + v400 >= v390 then
                    v401 = v390 - #v394;
                    v278(v395, v396, v394 .. string.sub(v399, 1, v401), 0, v390, v390);
                    v394 = "";
                end;
                local v402 = v400 - v401;
                local v403 = v402 % v390;
                v278(v395, v396, v399, v401, v402 - v403, v390);
                v394 = v394 .. string.sub(v399, v400 + 1 - v403);
                return v398;
            else
                error("Adding more chunks is not allowed after receiving the result", 2);
                return;
            end;
        else
            if v394 then
                local v404 = v392 and 31 or 6;
                v394 = v394 .. (#v394 + 1 == v390 and string.char(v404 + 128) or string.char(v404) .. string.rep("\000", (-2 - #v394) % v390) .. "\128");
                v278(v395, v396, v394, 0, #v394, v390);
                v394 = nil;
                local v405 = 0;
                local v406 = math.floor(v390 / 8);
                local v407 = {};
                do
                    local l_v405_0 = v405;
                    local function v411(v409) --[[ Line: 1255 ]] --[[ Name: get_next_qwords_of_digest ]]
                        if v406 <= l_v405_0 then
                            v278(v395, v396, "\000\000\000\000\000\000\000\000", 0, 8, 8);
                            l_v405_0 = 0;
                        end;
                        v409 = math.floor((math.min(v409, v406 - l_v405_0)));
                        for v410 = 1, v409 do
                            v407[v410] = string.format("%08x", v396[l_v405_0 + v410] % 4294967296) .. string.format("%08x", v395[l_v405_0 + v410] % 4294967296);
                        end;
                        l_v405_0 = l_v405_0 + v409;
                        return string.gsub(table.concat(v407, "", 1, v409), "(..)(..)(..)(..)(..)(..)(..)(..)", "%8%7%6%5%4%3%2%1"), v409 * 8;
                    end;
                    local v412 = {};
                    local v413 = "";
                    local v414 = 0;
                    local function v415(v416) --[[ Line: 1288 ]] --[[ Name: get_next_part_of_digest ]]
                        v416 = v416 or 1;
                        if v416 <= v414 then
                            v414 = v414 - v416;
                            local v417 = v416 * 2;
                            local v418 = string.sub(v413, 1, v417);
                            v413 = string.sub(v413, v417 + 1);
                            return v418;
                        else
                            local v419 = 0;
                            if v414 > 0 then
                                v419 = 1;
                                v412[v419] = v413;
                                v416 = v416 - v414;
                            end;
                            while v416 >= 8 do
                                local v420, v421 = v411(v416 / 8);
                                v419 = v419 + 1;
                                v412[v419] = v420;
                                v416 = v416 - v421;
                            end;
                            if v416 > 0 then
                                local v422, v423 = v411(1);
                                v413 = v422;
                                v414 = v423;
                                v419 = v419 + 1;
                                v412[v419] = v415(v416);
                            else
                                local v424 = "";
                                local v425 = 0;
                                v413 = v424;
                                v414 = v425;
                            end;
                            return table.concat(v412, "", 1, v419);
                        end;
                    end;
                    if v391 < 0 then
                        v397 = v415;
                    else
                        v397 = v415(v391);
                    end;
                end;
            end;
            return v397;
        end;
    end;
    if v393 then
        return v398(v393)();
    else
        return v398;
    end;
end;
l_v12_0 = function(v426) --[[ Line: 1346 ]] --[[ Name: HexToBinFunction ]]
    return (string.char((tonumber(v426, 16))));
end;
l_v11_0 = function(v427) --[[ Line: 1350 ]] --[[ Name: hex2bin ]]
    return (string.gsub(v427, "%x%x", l_v12_0));
end;
local v428 = {
    ["+"] = 62, 
    ["-"] = 62, 
    [62] = "+", 
    ["/"] = 63, 
    _ = 63, 
    [63] = "/", 
    ["="] = -1, 
    ["."] = -1, 
    [-1] = "="
};
local v429 = 0;
for _, v431 in l_ipairs_0({
    "AZ", 
    "az", 
    "09"
}) do
    for v432 = string.byte(v431), string.byte(v431, 2) do
        local v433 = string.char(v432);
        v428[v433] = v429;
        v428[v429] = v433;
        v429 = v429 + 1;
    end;
end;
local function v443(v434) --[[ Line: 1376 ]] --[[ Name: bin2base64 ]]
    local v435 = #v434;
    local v436 = table.create((math.ceil(v435 / 3)));
    local v437 = 0;
    for v438 = 1, #v434, 3 do
        local v439, v440, v441, v442 = string.byte(string.sub(v434, v438, v438 + 2) .. "\000", 1, -1);
        v437 = v437 + 1;
        v436[v437] = v428[math.floor(v439 / 4)] .. v428[v439 % 4 * 16 + math.floor(v440 / 16)] .. v428[v441 and v440 % 16 * 4 + math.floor(v441 / 64) or -1] .. v428[v442 and v441 % 64 or -1];
    end;
    return table.concat(v436);
end;
local function v454(v444) --[[ Line: 1393 ]] --[[ Name: base642bin ]]
    local v445 = {};
    local v446 = 3;
    for v447, v448 in string.gmatch(string.gsub(v444, "%s+", ""), "()(.)") do
        local v449 = v428[v448];
        if v449 < 0 then
            v446 = v446 - 1;
            v449 = 0;
        end;
        local v450 = v447 % 4;
        if v450 > 0 then
            v445[-v450] = v449;
        else
            local v451 = v445[-1] * 4 + math.floor(v445[-2] / 16);
            local v452 = v445[-2] % 16 * 16 + math.floor(v445[-3] / 4);
            local v453 = v445[-3] % 4 * 64 + v449;
            v445[#v445 + 1] = string.sub(string.char(v451, v452, v453), 1, v446);
        end;
    end;
    return table.concat(v445);
end;
local v455 = nil;
local v456 = {};
for v457 = 0, 255 do
    v456[string.format("%02x", v457)] = string.char(v457);
end;
local function v471(v458, v459, v460, v461) --[[ Line: 1430 ]] --[[ Name: hmac ]]
    local v462 = v455[v458];
    if not v462 then
        error("Unknown hash function", 2);
    end;
    local v463 = #v459;
    if v462 < v463 then
        v459 = string.gsub(v458(v459), "%x%x", l_v12_0);
        v463 = #v459;
    end;
    local v465 = v458()(string.gsub(v459, ".", function(v464) --[[ Line: 1443 ]]
        return (string.char((l_bxor_0(string.byte(v464), 54))));
    end) .. string.rep("6", v462 - v463));
    local v466 = nil;
    local function v467(v468) --[[ Line: 1449 ]] --[[ Name: partial ]]
        if not v468 then
            v466 = v466 or v458(string.gsub(v459, ".", function(v469) --[[ Line: 1453 ]]
                return (string.char((l_bxor_0(string.byte(v469), 92))));
            end) .. string.rep("\\", v462 - v463) .. string.gsub(v465(), "%x%x", l_v12_0));
            return v466;
        elseif v466 then
            error("Adding more chunks is not allowed after receiving the result", 2);
            return;
        else
            v465(v468);
            return v467;
        end;
    end;
    if v460 then
        local v470 = v467(v460)();
        return v461 and string.gsub(v470, "%x%x", v456) or v470;
    else
        return v467;
    end;
end;
local v486 = {
    md5 = v292, 
    sha1 = v293, 
    sha224 = function(v472) --[[ Line: 1484 ]] --[[ Name: sha224 ]]
        return v290(224, v472);
    end, 
    sha256 = function(v473) --[[ Line: 1488 ]] --[[ Name: sha256 ]]
        return v290(256, v473);
    end, 
    sha512_224 = function(v474) --[[ Line: 1492 ]] --[[ Name: sha512_224 ]]
        return v291(224, v474);
    end, 
    sha512_256 = function(v475) --[[ Line: 1496 ]] --[[ Name: sha512_256 ]]
        return v291(256, v475);
    end, 
    sha384 = function(v476) --[[ Line: 1500 ]] --[[ Name: sha384 ]]
        return v291(384, v476);
    end, 
    sha512 = function(v477) --[[ Line: 1504 ]] --[[ Name: sha512 ]]
        return v291(512, v477);
    end, 
    sha3_224 = function(v478) --[[ Line: 1509 ]] --[[ Name: sha3_224 ]]
        return v294(144, 28, false, v478);
    end, 
    sha3_256 = function(v479) --[[ Line: 1513 ]] --[[ Name: sha3_256 ]]
        return v294(136, 32, false, v479);
    end, 
    sha3_384 = function(v480) --[[ Line: 1517 ]] --[[ Name: sha3_384 ]]
        return v294(104, 48, false, v480);
    end, 
    sha3_512 = function(v481) --[[ Line: 1521 ]] --[[ Name: sha3_512 ]]
        return v294(72, 64, false, v481);
    end, 
    shake128 = function(v482, v483) --[[ Line: 1525 ]] --[[ Name: shake128 ]]
        return v294(168, v483, true, v482);
    end, 
    shake256 = function(v484, v485) --[[ Line: 1529 ]] --[[ Name: shake256 ]]
        return v294(136, v485, true, v484);
    end, 
    hmac = v471, 
    hex_to_bin = l_v11_0, 
    base64_to_bin = v454, 
    bin_to_base64 = v443, 
    base64_encode = v0.Encode, 
    base64_decode = v0.Decode
};
v455 = {
    [v486.md5] = 64, 
    [v486.sha1] = 64, 
    [v486.sha224] = 64, 
    [v486.sha256] = 64, 
    [v486.sha512_224] = 128, 
    [v486.sha512_256] = 128, 
    [v486.sha384] = 128, 
    [v486.sha512] = 128, 
    [v486.sha3_224] = 144, 
    [v486.sha3_256] = 136, 
    [v486.sha3_384] = 104, 
    [v486.sha3_512] = 72
};
return v486;