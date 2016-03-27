import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import csv



df=pd.read_csv("FinalResult2.csv")

print df.head()

df=df[df.churn_prob>0.9]

print df

wmin=df['customer_worth'].min()

wmax=df['customer_worth'].max()

print wmin

inc=(wmax-wmin)/3

catg1=wmin+inc

catg2=wmin+(2*inc)

print catg1

print catg2

pro1=sys.argv[1]

pro2=sys.argv[2]

pro3=sys.argv[3]

df['promocode']=pro1

df['promocode'][df['customer_worth']<catg2]=pro2

df['promocode'][df['customer_worth']<catg1]=pro3

print df.head()

df=df.drop(df.columns[1:3],axis=1)

print df.head()

df.to_csv("maildataset.csv")


