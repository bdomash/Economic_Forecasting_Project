clear all
freduse USMINE DNRGRC1M027SBEA IPB50089S IPB53320S WPSFD4122
rename DNRGRC1M027SBEA PCEENERGY
rename IPB50089S IPENERGYMAT
rename IPENERGYMAT IPENERGYTOT
rename IPB53320S IPCONVFUEL
rename WPSFD4122 PPIGOVT
tsmktim time, start(1939m1)
tsset time
reg USMINE L(1/12).PCEENERGY L(1/12).USMINE, r
testparm L(1/12).PCEENERGY
reg USMINE L(1/12).IPENERGYTOT L(1/12).USMINE, r
testparm L(1/12).IPENERGYTOT
reg USMINE L(1/12).IPCONVFUEL L(1/12).USMINE, r
testparm L(1/12).IPCONVFUEL
reg USMINE L(1/12).PPIGOVT L(1/12).USMINE, r
testparm L(1/12).PPIGOVT
gen cUSMINE = USMINE - L.USMINE
gen cPCEENERGY = PCEENERGY - L.PCEENERGY
dfuller PCEENERGY, lags(12)
dfuller PCEENERGY, lags(12)
dfuller cPCEENERGY, lags(12)
dfuller IPENERGYTOT, lags(12)
gen cIPENERGYTOT = IPENERGYTOT - L.IPENERGYTOT
dfuller cIPENERGYTOT , lags(12)
dfuller IPCONVFUEL, lag(12)
gen cIPCONVFUEL = IPCONVFUEL - L.IPCONVFUEL
dfuller cIPCONVFUEL, lag(12)
dfuller PPIGOVT, lag(12)
gen cPPIGOVT = PPIGOVT - L.PPIGOVT
dfuller cPPIGOVT, lag(12)
reg cUSMINE L(1/12).cPCEENERGY L(1/12).cUSMINE, r
testparm L(1/12).cPCEENERGY
reg cUSMINE L(1/12).cIPENERGYTOT L(1/12).cUSMINE, r
testparm L(1/12).cIPENERGYTOT
reg cUSMINE L(1/12).cIPCONVFUEL L(1/12).cUSMINE, r
testparm L(1/12).cIPCONVFUEL
reg cUSMINE cIPCONVFUEL if time>tm(1959m2)
rvfplot
predict y, residuals
tsline y
predict res1, residual
tsline res1

drop y
drop res1
predict y
tsline y USMINE
tsline y cUSMINE
reg cUSMINE cPCEENERGY
drop y
predict y
tsline y cUSMINE
reg cUSMINE L(1/12).cPCEENERGY L(1/12).cUSMINE
drop y
predict y
tsline y cUSMINE
rvfplot
gen res = cUSMINE - y
reg res time
tsline res time
tsline
reg time res
tsline
reg cUSMINE L(1/12).cPCEENERGY L(1/12).cUSMIN
reg cUSMINE cPCEENERGY
reg cUSMINE L(1/12).cUSMINE L(1/12).cPCEENERGY
testparm L(1/12).cPCEENERGY
 reg cUSMINE L(1/12).cPCEENERGY L(1/12).cUSM, r
testparm L(1/12).cPCEENERGY
 reg cUSMINE L(1/12).cPCEENERGY L(1/12).cUSM, r
rvfplot
reg cUSMINE if time>=tm(1960m2)
estimates store model00
reg cUSMINE L.cUSMINE if time>=tm(1960m2)
estimates store model10
reg cUSMINE L(1/3).cUSMINE if time>=tm(1960m2)
estimates store model30
reg cUSMINE L(1/6).cUSMINE if time>=tm(1960m2)
estimates store model60
reg cUSMINE L(1/12).cUSMINE if time>=tm(1960m2)
estimates store model120
reg cUSMINE L.cPCEENERGY if time>=tm(1960m2)
estimates store model01
reg cUSMINE L.cUSMINE L.cPCEENERGY if time>=tm(1960m2)
estimates store model11
reg cUSMINE L(1/3).cUSMINE L.cPCEENERGY if time>=tm(1960m2)
estimates store model31
reg cUSMINE L(1/6).cUSMINE L.cPCEENERGY if time>=tm(1960m2)
estimates store model61
reg cUSMINE L(1/12).cUSMINE L.cPCEENERGY if time>=tm(1960m2)
estimates store model121
reg cUSMINE L(1/3).cPCEENERGY if time>=tm(1960m2)
estimates store model03
reg cUSMINE L.cUSMINE L(1/3).cPCEENERGY if time>=tm(1960m2)
estimates store model13
reg cUSMINE L(1/3).cUSMINE L(1/3).cPCEENERGY if time>=tm(1960m2)
estimates store model33
reg cUSMINE L(1/6).cUSMINE L(1/3).cPCEENERGY if time>=tm(1960m2)
estimates store model63
reg cUSMINE L(1/12).cUSMINE L(1/3).cPCEENERGY if time>=tm(1960m2)
estimates store model123
reg cUSMINE L(1/6).cPCEENERGY if time>=tm(1960m2)
estimates store model06
reg cUSMINE L.cUSMINE L(1/6).cPCEENERGY if time>=tm(1960m2)
estimates store model16
reg cUSMINE L(1/3).cUSMINE L(1/6).cPCEENERGY if time>=tm(1960m2)
estimates store model36
reg cUSMINE L(1/6).cUSMINE L(1/6).cPCEENERGY if time>=tm(1960m2)
estimates store model66
reg cUSMINE L(1/12).cUSMINE L(1/6).cPCEENERGY if time>=tm(1960m2)
estimates store model126
reg cUSMINE L(1/12).cPCEENERGY if time>=tm(1960m2)
estimates store model012
reg cUSMINE L.cUSMINE L(1/12).cPCEENERGY if time>=tm(1960m2)
estimates store model112
reg cUSMINE L(1/3).cUSMINE L(1/12).cPCEENERGY if time>=tm(1960m2)
estimates store model312
reg cUSMINE L(1/6).cUSMINE L(1/12).cPCEENERGY if time>=tm(1960m2)
estimates store model612
reg cUSMINE L(1/12).cUSMINE L(1/12).cPCEENERGY if time>=tm(1960m2)
estimates store model1212
estimates stats model00 model10 model30 model60 model120 model01 model11 model31 model61 model121 model06 model16 model36 model66 model126 model012 model112 model312 model612 model1212
estimates replay model60
constraint 1 =  model00 + model10 + model30 + model60 + model120 + model01 + model11 + model31 + model61 + model121 + model06 + model16 + model36 + model66 + model126 +
>  model012 + model112 + model312 + model612 + model1212
reg cUSMINE  model00 model10 model30 model60 model120 model01 model11 model31 model61 model121 model06 model16 model36 model66 model126
>  model012 model112 model312 model612 model1212, nonconstant
 model00 model10 model30 model60 model120 model01 model11 model31 model61 model121 model06 model16 model36 model66 model126 model012 model112 model312 model612 model1212
reg cUSMINE model00 model10 model30 model60 model120 model01 model11 model31 model61 model121 model06 model16 model36 model66 model126 model012 model112 model312 model612 model1212, noconstant
reg cUSMINE if tin(1960m2,2005m2)
predict e00 if time>=tm(2005m3), residuals
predict y00 if time>=tm(2005m3)
reg cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e01 if time>=tm(2005m3), residuals
predict y01 if time>=tm(2005m3)
reg cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e03 if time>=tm(2005m3), residuals
predict y03 if time>=tm(2005m3)
reg cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e06 if time>=tm(2005m3), residuals
predict y06 if time>=tm(2005m3)
reg cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e012 if time>=tm(2005m3), residuals
predict y012 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE if tin(1960m2,2005m2)
predict e10 if time>=tm(2005m3), residuals
predict y10 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e11 if time>=tm(2005m3), residuals
predict y11 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e13 if time>=tm(2005m3), residuals
predict y13 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e16 if time>=tm(2005m3), residuals
predict y16 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e112 if time>=tm(2005m3), residuals
predict y112 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE if tin(1960m2,2005m2)
predict e30 if time>=tm(2005m3), residuals
predict y30 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e31 if time>=tm(2005m3), residuals
predict y31 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e33 if time>=tm(2005m3), residuals
predict y33 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e36 if time>=tm(2005m3), residuals
predict y36 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e312 if time>=tm(2005m3), residuals
predict y312 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE if tin(1960m2,2005m2)
predict e60 if time>=tm(2005m3), residuals
predict y60 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e61 if time>=tm(2005m3), residuals
predict y61 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e63 if time>=tm(2005m3), residuals
predict y63 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e66 if time>=tm(2005m3), residuals
predict y66 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e612 if time>=tm(2005m3), residuals
predict y612 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE if tin(1960m2,2005m2)
predict e10 if time>=tm(2005m3), residuals
predict y10 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e121 if time>=tm(2005m3), residuals
predict y121 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e123 if time>=tm(2005m3), residuals
predict y123 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e126 if time>=tm(2005m3), residuals
predict y126 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e1212 if time>=tm(2005m3), residuals
predict y1212 if time>=tm(2005m3)
reg cUSMINE y00 y10 y20 y30 y01 y11 y21 y31 y02 y12 y22 y32 y03 y13 y23 y33, noconstant
predict y10 if time>=tm(2005m3)
drop y10
predict y10 if time>=tm(2005m3)
drop y20
predict e10 if time>=tm(2005m3), residuals
drop y10
drop e1212
drop y1212
drop y10 y11
drop e63 e66
drop y00 y01 y03 y06 y012 y10 y11 y13 y16 y112 y30 y31 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212
drop e00 e01 e03 e06 e012 e10 e11 e13 e16 e112 e30 e31 e33 e36 e312 e60 e61 e63 e66 e612 e120 e121 e123 e126 e1212
reg cUSMINE if tin(1960m2,2005m2)
predict e00 if time>=tm(2005m3), residuals
predict y00 if time>=tm(2005m3)
reg cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e01 if time>=tm(2005m3), residuals
predict y01 if time>=tm(2005m3)
reg cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e03 if time>=tm(2005m3), residuals
predict y03 if time>=tm(2005m3)
reg cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e06 if time>=tm(2005m3), residuals
predict y06 if time>=tm(2005m3)
reg cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e012 if time>=tm(2005m3), residuals
predict y012 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE if tin(1960m2,2005m2)
predict e10 if time>=tm(2005m3), residuals
predict y10 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e11 if time>=tm(2005m3), residuals
predict y11 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e13 if time>=tm(2005m3), residuals
predict y13 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e16 if time>=tm(2005m3), residuals
predict y16 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e112 if time>=tm(2005m3), residuals
predict y112 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE if tin(1960m2,2005m2)
predict e30 if time>=tm(2005m3), residuals
predict y30 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e31 if time>=tm(2005m3), residuals
predict y31 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e33 if time>=tm(2005m3), residuals
predict y33 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e36 if time>=tm(2005m3), residuals
predict y36 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e312 if time>=tm(2005m3), residuals
predict y312 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE if tin(1960m2,2005m2)
predict e60 if time>=tm(2005m3), residuals
predict y60 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e61 if time>=tm(2005m3), residuals
predict y61 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e63 if time>=tm(2005m3), residuals
predict y63 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e66 if time>=tm(2005m3), residuals
predict y66 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e612 if time>=tm(2005m3), residuals
predict y612 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE if tin(1960m2,2005m2)
predict e120 if time>=tm(2005m3), residuals
predict y120 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e121 if time>=tm(2005m3), residuals
predict y121 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e123 if time>=tm(2005m3), residuals
predict y123 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e126 if time>=tm(2005m3), residuals
predict y126 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e1212 if time>=tm(2005m3), residuals
predict y1212 if time>=tm(2005m3)
reg cUSMINE y00 y01 y03 y06 y012 y10 y11 y13 y16 y112 y30 y31 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212, noconstant
drop y00 y01 y03 y06 y012 y10 y11 y13 y16 y112 y30 y31 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212
drop y00 y01 y03 y06 y012 y10 y11 y13 y16 y112 y30 y31 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212
drop e00 e01 e03 e06 e012 e10 e11 e13 e16 e112 e30 e31 e33 e36 e312 e60 e61 e63 e66 e612 e120 e121 e123 e126 e1212
reg cUSMINE if tin(1960m2,2005m2)
predict e00 if time>=tm(2005m3), residuals
predict y00 if time>=tm(2005m3)
reg cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e01 if time>=tm(2005m3), residuals
predict y01 if time>=tm(2005m3)
reg cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e03 if time>=tm(2005m3), residuals
predict y03 if time>=tm(2005m3)
reg cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e06 if time>=tm(2005m3), residuals
predict y06 if time>=tm(2005m3)
reg cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e012 if time>=tm(2005m3), residuals
predict y012 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE if tin(1960m2,2005m2)
predict e10 if time>=tm(2005m3), residuals
predict y10 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e11 if time>=tm(2005m3), residuals
predict y11 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e13 if time>=tm(2005m3), residuals
predict y13 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e16 if time>=tm(2005m3), residuals
predict y16 if time>=tm(2005m3)
reg cUSMINE L(1/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e112 if time>=tm(2005m3), residuals
predict y112 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE if tin(1960m2,2005m2)
predict e30 if time>=tm(2005m3), residuals
predict y30 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e31 if time>=tm(2005m3), residuals
predict y31 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e33 if time>=tm(2005m3), residuals
predict y33 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e36 if time>=tm(2005m3), residuals
predict y36 if time>=tm(2005m3)
reg cUSMINE L(3/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e312 if time>=tm(2005m3), residuals
predict y312 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE if tin(1960m2,2005m2)
predict e60 if time>=tm(2005m3), residuals
predict y60 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e61 if time>=tm(2005m3), residuals
predict y61 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e63 if time>=tm(2005m3), residuals
predict y63 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e66 if time>=tm(2005m3), residuals
predict y66 if time>=tm(2005m3)
reg cUSMINE L(6/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e612 if time>=tm(2005m3), residuals
predict y612 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE if tin(1960m2,2005m2)
predict e120 if time>=tm(2005m3), residuals
predict y120 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/1).cPCEENERGY if tin(1960m2,2005m2)
predict e121 if time>=tm(2005m3), residuals
predict y121 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/3).cPCEENERGY if tin(1960m2,2005m2)
predict e123 if time>=tm(2005m3), residuals
predict y123 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/6).cPCEENERGY if tin(1960m2,2005m2)
predict e126 if time>=tm(2005m3), residuals
predict y126 if time>=tm(2005m3)
reg cUSMINE L(12/1).cUSMINE L(1/12).cPCEENERGY if tin(1960m2,2005m2)
predict e1212 if time>=tm(2005m3), residuals
predict y1212 if time>=tm(2005m3)
reg cUSMINE y00 y01 y03 y06 y012 y10 y11 y13 y16 y112 y30 y31 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212, noconstant
constraint 1 y00 + y03 + y06 + y012 + y13 + y16 + y112 + y30 + y33 + y36 + y312 + y60 + y61 + y63 + y66 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE  y00 y03 y06 y012 y13 y16 y112 y30 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212, constraints(1) noconstant
constraint 1 y00 + y03 + y06 + y012 + y13 + y16 + y112 + y30 + y33 + y36 + y312 + y60 + y63 + y66 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE  y00 y03 y06 y012 y13 y16 y112 y30 y33 y36 y312 y60 y61 y63 y66 y612 y120 y121 y123 y126 y1212, constraints(1) noconstant
cnsreg cUSMINE  y00 y03 y06 y012 y13 y16 y112 y30 y33 y36 y312 y60 y63 y66 y612 y120 y121 y123 y126 y1212, constraints(1) noconstant
constraint 2 y00 + y03 + y06 + y012 + y13 + y16 + y112 + y30 + y33 + y36 + y312 + y63 + y66 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE  y00 y03 y06 y012 y13 y16 y112 y30 y33 y36 y312 y63 y66 y612 y120 y121 y123 y126 y1212, constraints(2) noconstant
constraint 3 y00 + y03 + y06 + y012 + y13 + y16 + y112 + y30 + y33 + y36 + y312 + y63 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE  y00 y03 y06 y012 y13 y16 y112 y30 y33 y36 y312 y63 y612 y120 y121 y123 y126 y1212, constraints(3) noconstant
constraint 4  y06 + y012 + y13 + y16 + y112 + y30 + y33 + y36 + y312 + y63 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE  y06 y012 y13 y16 y112 y30 y33 y36 y312 y63 y612 y120 y121 y123 y126 y1212, constraints(4) noconstant
constraint 5  y06 + y012 + y13 + y16 + y112 + y30 + y33 + y312 + y63 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE  y06 y012 y13 y16 y112 y30 y33 y312 y63 y612 y120 y121 y123 y126 y1212, constraints(5) noconstant
constraint 6 y012 + y13 + y16 + y112 + y30 + y33 + y312 + y63 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE y012 y13 y16 y112 y30 y33 y312 y63 y612 y120 y121 y123 y126 y1212, constraints(6) noconstant
constraint 7 y012 + y13 + y16 + y112 + y30 + y312 + y63 + y612 + y120 + y121 + y123 + y126 +y1212 = 1
cnsreg cUSMINE y012 y13 y16 y112 y30 y312 y63 y612 y120 y121 y123 y126 y1212, constraints(7) noconstant
constraint 8 y012 + y13 + y16 + y112 + y30 + y312 + y63 + y612 + y120 + y121 + y126 +y1212 = 1
cnsreg cUSMINE y012 y13 y16 y112 y30 y312 y63 y612 y120 y121 y126 y1212, constraints(8) noconstant
constraint 8 y012 + y13 + y16 + y112 + y30 + y312 + y612 + y120 + y121 + y126 +y1212 = 1
cnsreg cUSMINE y012 y13 y16 y112 y30 y312 y612 y120 y121 y126 y1212, constraints(8) noconstant
constraint 8 y012 + y13 + y112 + y30 + y312 + y612 + y120 + y121 + y126 +y1212 = 1
cnsreg cUSMINE y012 y13 y112 y30 y312 y612 y120 y121 y126 y1212, constraints(8) noconstant
cnsreg cUSMINE y13 y112 y30 y312 y612 y120 y121 y126 y1212, constraints(8) noconstant
constraint 8 y13 + y112 + y30 + y312 + y612 + y120 + y121 + y126 +y1212 = 1
cnsreg cUSMINE y13 y112 y30 y312 y612 y120 y121 y126 y1212, constraints(8) noconstant
constraint 8 y13 + y112 + y30 + y312 + y612 + y120 + y121 + y126 = 1
cnsreg cUSMINE y13 y112 y30 y312 y612 y120 y121 y126, constraints(8) noconstant
constraint 8 y13 + y112 + y30 + y612 + y120 + y121 + y126 = 1
cnsreg cUSMINE y13 y112 y30 y612 y120 y121 y126, constraints(8) noconstant
constraint 8 y13 + y112 + y30 + y120 + y121 + y126 = 1
cnsreg cUSMINE y13 y112 y30 y120 y121 y126, constraints(8) noconstant
constraint 8 y13 + y112 + y30 + y120 + y126 = 1
cnsreg cUSMINE y13 y112 y30 y120 y126, constraints(8) noconstant
constraint 8 y112 + y30 + y120 + y126 = 1
cnsreg cUSMINE y112 y30 y120 y126, constraints(8) noconstant
constraint 8 y112 + y120 + y126 = 1
cnsreg cUSMINE y112 y120 y126, constraints(8) noconstant
tsline cUSMINE
drop y11
drop e00-y1212
tsappend, add(12)
reg cUSMINE L.cUSMINE L(1/12).cPCEENERGY
predict y11
predict sf11,stdf
reg cUSMINE L2.cUSMINE L(2/13).cPCEENERGY
predict y12
predict sf12,stdf
reg cUSMINE L3.cUSMINE L(3/14).cPCEENERGY
predict y13
predict sf13,stdf
reg cUSMINE L4.cUSMINE L(4/15).cPCEENERGY
predict y14
predict sf14,stdf
reg cUSMINE L5.cUSMINE L(5/16).cPCEENERGY
predict y15
predict sf15,stdf
reg cUSMINE L6.cUSMINE L(6/17).cPCEENERGY
predict y16
predict sf16,stdf
reg cUSMINE L7.cUSMINE L(7/18).cPCEENERGY
predict y17
predict sf17,stdf
reg cUSMINE L8.cUSMINE L(8/19).cPCEENERGY
predict y18
predict sf18,stdf
reg cUSMINE L9.cUSMINE L(9/20).cPCEENERGY
predict y19
predict sf19,stdf
reg cUSMINE L10.cUSMINE L(10/21).cPCEENERGY
predict y110
predict sf110,stdf
reg cUSMINE L11.cUSMINE L(11/22).cPCEENERGY
predict y111
predict sf111,stdf
reg cUSMINE L12.cUSMINE L(12/23).cPCEENERGY
predict y112
predict sf112,stdf
egen p1 =rowfirst(y11 y12 y13 y14 y15 y16 y17 y18 y19 y110 y111 y112) if t>=tm(2018m11)
egen se1 = rowfirst(sf11 sf12 sf13 sf14 sf15 sf16 sf17 sf18 sf19 sf110 sf111 sf112) if t>=tm(2018m11)
tsline USMINE
tsline cUSMINE
tsline USMINE
tsline
tsline cUSEMINE
tsline cUSMINE
tsline cUSMINE if time>tm(1960m2)
 tsline USMINE if time>tm(2010m1)
tsline USMINE
tsline USMINE if time>tm(1960m2)
 tsline USMINE
tsline cUSMINE if time>tm(1960m2)
tsline USMINE if time>tm(2010m1)
reg cUSMINE L(1/12).cUSMINE
predict y21
predict sf21,stdf
reg cUSMINE L(2/13).cUSMINE
predict y22
predict sf22,stdf
reg cUSMINE L(3/14).cUSMINE
predict y23
predict sf23,stdf
reg cUSMINE L(4/15).cUSMINE
predict y24
predict sf24,stdf
reg cUSMINE L(5/16).cUSMINE
predict y25
predict sf25,stdf
reg cUSMINE L(6/17).cUSMINE
predict y26
predict sf26,stdf
reg cUSMINE L(7/18).cUSMINE
predict y27
predict sf27,stdf
reg cUSMINE L(8/19).cUSMINE
predict y28
predict sf28,stdf
reg cUSMINE L(9/20).cUSMINE
predict y29
predict sf29,stdf
reg cUSMINE L(10/21).cUSMINE
predict y210
predict sf210,stdf
reg cUSMINE L(11/22).cUSMINE
predict y211
predict sf211,stdf
reg cUSMINE L(12/23).cUSMINE
predict y212
predict sf212,stdf
egen p2 =rowfirst(y21 y22 y23 y24 y25 y26 y27 y28 y29 y210 y211 y212) if t>=tm(2018m11)
egen se2 = rowfirst(sf21 sf22 sf23 sf24 sf25 sf26 sf27 sf28 sf29 sf210 sf211 sf212) if t>=tm(2018m11)
reg cUSMINE L(1/12).cUSMINE L(1/6).cPCEENERGY
predict y31
predict sf31,stdf
reg cUSMINE L(2/13).cUSMINE L(2/7).cPCEENERGY
predict y32
predict sf32,stdf
reg cUSMINE L(3/14).cUSMINE L(3/8).cPCEENERGY
predict y33
predict sf33,stdf
reg cUSMINE L(4/15).cUSMINE L(4/9).cPCEENERGY
predict y34
predict sf34,stdf
reg cUSMINE L(5/16).cUSMINE L(5/10).cPCEENERGY
predict y35
predict sf35,stdf
reg cUSMINE L(6/17).cUSMINE L(6/11).cPCEENERGY
predict y36
predict sf36,stdf
reg cUSMINE L(7/18).cUSMINE L(7/12).cPCEENERGY
predict y37
predict sf37,stdf
reg cUSMINE L(8/19).cUSMINE L(8/13).cPCEENERGY
predict y38
predict sf38,stdf
reg cUSMINE L(9/20).cUSMINE L(9/14).cPCEENERGY
predict y39
predict sf39,stdf
reg cUSMINE L(10/21).cUSMINE L(10/15).cPCEENERGY
predict y310
predict sf310,stdf
reg cUSMINE L(11/22).cUSMINE L(11/16).cPCEENERGY
predict y311
predict sf311,stdf
reg cUSMINE L(12/23).cUSMINE L(12/17).cPCEENERGY
predict y312
predict sf312,stdf
egen p3 =rowfirst(y31 y32 y33 y34 y35 y36 y37 y38 y39 y310 y311 y312) if t>=tm(2018m11)
egen se3 = rowfirst(sf31 sf32 sf33 sf34 sf35 sf36 sf37 sf38 sf39 sf310 sf311 sf312) if t>=tm(2018m11)
gen p4 = .5739*p1 + .3824*p2 + .0437*p3
gen sf4 = .5739*sf1 + .3824*sf2 + .0437*sf3
gen se4 = .5739*se1 + .3824*se2 + .0437*se3
gen y4L = p4-1.645*se4
gen y4U = p4+1.645*se4
tsline cUSMINE p4 y4L y4U if time>=tm(2010m1)
tsline cUSMINE p4 y4L y4U if time>=tm(100000000000000m1)
tsline cUSMINE p4 y4L y4U if time>=tm(2000m1)
tsline cUSMINE p4 y4L y4U if time>=tm(19500m1)
tsline cUSMINE p4 y4L y4U if time>=tm(1950m1)
tsline cUSMINE p4 y4L y4U if time>=tm(1950m1)
graph save Graph "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\Final Project Graph1.gph"
tsline cUSMINE p4 y4L y4U if time>=tm(2000m1)
graph save Graph "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\Final Project Graph2.gph"
save "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\megafile.dta"
rename var124 p
rename var125 l
rename l lower
rename var126 upper
tsline USMINE p lower upper
graph save Graph "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\BITCH!@.gph"
tsline USMINE p lower upper if time>=tm(2000m1)
graph save Graph "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\K.gph"
save "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\megafile.dta", replace
save "C:\Users\John\Documents\Senior Year Fall Semester\Econ 460\megafile.dta", replace
