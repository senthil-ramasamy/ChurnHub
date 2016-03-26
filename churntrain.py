import pandas as pd
import numpy as np
import statsmodels.api as sm
import pylab as pl
import sys

df = pd.read_csv(sys.argv[1])

colnames=df.columns.tolist()

churnresult=df['Churn']

y=np.where(churnresult=='Yes',1,0)

churnspace=df

churnspace=churnspace.replace(['Yes','No','No internet service','No phone service'],[1,0,0,0])

churnspace=churnspace.replace(['Bank transfer (automatic)','Credit card (automatic)','Electronic check','Mailed check'],[1,2,3,4])

churnspace=churnspace.replace(['DSL','Fiber optic','Male','Female'],[1,2,1,0])

churnspace=churnspace.replace(['Month-to-month','One year','Two year'],[1,2,3])

#print churnspace.head(5)

#print "Unique target labels :",np.unique(y)

#print np.unique(churnspace['PaymentMethod'])

#print np.unique(churnspace['InternetService'])

#print np.unique(churnspace['Contract'])

#print churnspace.describe()

#print churnspace.std()

#churnspace.hist()

#pl.show()

dummy_pm=pd.get_dummies(churnspace['PaymentMethod'],prefix='PaymentMethod')

#print dummy_pm.head()

dummy_is=pd.get_dummies(churnspace['InternetService'],prefix='InternetService')

#print dummy_is.head()

dummy_c=pd.get_dummies(churnspace['Contract'],prefix='Contract')

#print dummy_c.head()

coltokeep=["customerID","gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","PaperlessBilling","MonthlyCharges","TotalCharges","Churn"]

data=churnspace[coltokeep].join(dummy_pm.ix[:,'PaymentMethod_1':])

data=data.join(dummy_c.ix[:,'Contract_1':])

data=data.join(dummy_is.ix[:,'InternetService_0':])

#print data.head()

data['intercept']=1.0

x=data['TotalCharges']

x=x.convert_objects(convert_numeric=True)

#print x

todrop=['TotalCharges','Churn']

t=data.drop(todrop,axis=1)

#print t.dtypes

t=pd.concat([t,x],axis=1)

print t.dtypes

print t.head(9)

todrop=['TotalCharges','MonthlyCharges']

t=t.drop(todrop,axis=1)

print t.dtypes

cols=t.columns

print cols
'''

t[cols]=t[cols].astype(int)'''

print t.dtypes

print data.dtypes

tcols=['gender','SeniorCitizen','Partner','Dependents','tenure','PhoneService','MultipleLines','OnlineSecurity','OnlineBackup','DeviceProtection','TechSupport','StreamingTV','StreamingMovies','PaperlessBilling','MonthlyCharges','intercept']

m=data[tcols]

print m

logit=sm.Logit(data['Churn'],m)

result=logit.fit()

print result.summary()

print result.conf_int()

print np.exp(result.params)

# odds ratios and 95% CI

params=result.params

conf=result.conf_int()

conf['OR']=params

conf.columns=['2.5%','97.5%','OR']

print np.exp(conf)

ten = np.linspace(data['tenure'].min(), data['tenure'].max(), 10)

ten=ten.astype(int);

print ten

mc = np.linspace(data['MonthlyCharges'].min(), data['MonthlyCharges'].max(), 10)

print mc

a=[1,0]



def cartesian(arrays, out=None):

    arrays = [np.asarray(x) for x in arrays]
    dtype = arrays[0].dtype

    n = np.prod([x.size for x in arrays])
    if out is None:
        out = np.zeros([n, len(arrays)], dtype=dtype)

    m = n / arrays[0].size
    out[:,0] = np.repeat(arrays[0], m)
    if arrays[1:]:
        cartesian(arrays[1:], out=out[0:m,1:])
        for j in xrange(1, arrays[0].size):
            out[j*m:(j+1)*m,1:] = out[0:m,1:]

    return out


combos=pd.DataFrame(cartesian([a,a,a,a,ten,a,a,a,a,a,a,a,a,a,mc,[1.]]))

combos.columns=['gender','SeniorCitizen','Partner','Dependents','tenure','PhoneService','MultipleLines','OnlineSecurity','OnlineBackup','DeviceProtection','TechSupport','StreamingTV','StreamingMovies','PaperlessBilling','MonthlyCharges','intercept']

combos['admit_pred']=result.predict(combos[tcols])

print combos.head()

def isolate_and_plot(variable):
    # isolate gre and class rank
    grouped = pd.pivot_table(combos, values=['admit_pred'], index=[variable, 'gender'],
                            aggfunc=np.mean)

    # in case you're curious as to what this looks like
    # print grouped.head()
    #                      admit_pred
    # gre        prestige
    # 220.000000 1           0.282462
    #            2           0.169987
    #            3           0.096544
    #            4           0.079859
    # 284.444444 1           0.311718

    # make a plot
    colors = 'rbgyrbgy'
    for col in combos.gender.unique():
        plt_data = grouped.ix[grouped.index.get_level_values(1)==col]
        pl.plot(plt_data.index.get_level_values(0), plt_data['admit_pred'],
                color=colors[int(col)])

    pl.xlabel(variable)
    pl.ylabel("P(admit=1)")
    pl.legend(['1', '2', '3', '4'], loc='upper left', title='gender')
    pl.title("Prob(admit=1) isolating " + variable + " and gender")
    pl.show()

# @suresh in the tutorial they have isolated and plotted against rank i.e, prestige, here in i have tried it with gender and some plot is gtting done, we need to fine tune this !

#isolate_and_plot('MonthlyCharges')


