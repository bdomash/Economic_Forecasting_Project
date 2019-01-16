
* AIC selection analysis for 3-month rate
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
