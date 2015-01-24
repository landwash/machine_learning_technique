from svmutil import *
import math
import random

trainfile = open('features.train');
lines = trainfile.readlines()
dlist = [line.strip().split() for line in lines]

x= [{1:eval(d[1]),2:eval(d[2])} for d in dlist]
yo= [eval(d[0]) for d in dlist]
y= [1 if yo[i] == 0 else -1 for i in range(len(yo))]

#question

m = svm_train(y, x, '-t 2  -g 10000 -c 0.1')
#m = svm_train(y, x, '-t 0 -c 0.01')

#Question 20
for i in range(100):
    r_list=range(len(x))
    rand_indx=random.sample(r_list, 1000)
    
    x= [{1:eval(d[1]),2:eval(d[2])} for d in dlist]
    yo= [eval(d[0]) for d in dlist]
    y= [1 if yo[i] == 0 else -1 for i in range(len(yo))]
    for k in range(1000)
    x_validate=[]; y_validate=[]
    x_validate.append(x.pop(rand_indx(k)))
    y_validate.append(y.pop(rand_indx(k)))

    
    


#calculate the coefficient w
##svs= m.get_SV()
##sv_coef = m.get_sv_coef()
##w=[0,0]
##for i in range(len(svs)):
##	w[0] = w[0] + svs[i][1]*sv_coef[i][0]
##for i in range(len(svs)):
##	w[1] = w[1] + svs[i][2]*sv_coef[i][0]
##w_abs=math.sqrt(w[0]*w[0]+w[1]*w[1])

###calculate sum(\alpha_n)
##sc=[abs(sv_coef[i][0]) for i in range(len(sv_coef))]
##print sum(sc)

# Question 18
print m.get_nr_sv()

trainfile = open('features.test');
lines = trainfile.readlines()
dtlist = [line.strip().split() for line in lines]

xt= [{1:eval(d[1]),2:eval(d[2])} for d in dtlist]
yto= [eval(d[0]) for d in dtlist]
yt= [1 if yto[i] == 0 else -1 for i in range(len(yto))]
p_label, p_acc, p_val = svm_predict(yt, xt, m)




