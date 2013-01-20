(define p1 0.01)
(define p2 0.01)
(define c1 2)
(define c2 3)
(define a (make-center-percent c1 p1))
(define b (make-center-percent c2 p2))

Evaluation of (mul-interval a b) will produce these values of p1-p4:

p1 = (c1 - (c1 * p1)) * (c2 - (c2 * p2)) = (c1 - c1*p1) * (c2 - c2*p2)
                                         = (c1*c2 - c1*c2*p2 - c2*c1*p1 + c1*c2*p1*p2)
p2 = (c1 - (c1 * p1)) * (c2 + (c2 * p2)) = (c1 - c1*p1) * (c2 + c2*p2)
                                         = (c1*c2 + c1*c2*p2 - c2*c1*p1 - c1*c2*p1*p2)
p3 = (c1 + (c1 * p1)) * (c2 - (c2 * p2)) = (c1 + c1*p1) * (c2 - c2*p2)
                                         = (c1*c2 - c1*c2*p2 + c2*c1*p1 - c1*c2*p1*p2)
p4 = (c1 + (c1 * p1)) * (c2 + (c2 * p2)) = (c1 + c1*p1) * (c2 + c2*p2)
                                         = (c1*c2 + c1*c2*p2 + c2*c1*p1 + c1*c2*p1*p2)

Assuming intervals are positive the resulting interval will span points p1 and p4.

Now we can calculate properties of resulting interval:
width of result = (p4 - p1)/2 = (2*c1*c2*p2 + 2*c1*c2*p1)/2 = c1*c2*(p1 + p2)
center of result = (p1 + p4)/2 = (2*c1*c2 + 2*c1*c2*p1*p2)/2 = c1*c2 + c1*c2*p1*p2 = c1*c2*(1 + p1*p2)
percentage error of result = (width of result) / (center of result) =
c1*c2*(p1 + p2)/(c1*c2*(1 + p1*p2)) = (p1 + p2)/(1 + p1*p2)

p1*p2 will be really small, so we can approximate resulting percentage tolerance to: p1 + p2

