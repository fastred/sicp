;101:	P1 sets x to 100 and then P2 increments x to 101.
;121:	P2 increments x to 11 and then P1 sets x to x times x.
;110:	P2 changes x from 10 to 11 between the two times that P1 accesses the value of x during the evaluation of (* x x).
;100:	P1 accesses x (twice), then P2 sets x to 11, then P1 sets x.
