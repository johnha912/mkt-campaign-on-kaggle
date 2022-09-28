import pandas as pd
import numpy as np

df = pd.read_csv(r'mkt_campaign_query.csv')
df

#1.Descriptive Analysis
df.describe()

#2.Check if there is any null/NaN data (we've already seen income column have missing value), so I decided to eliminate them   
df.isnull().sum()

#3a.Let's investigate some correlation coefficient
df.corr()

#3b. Visuallize them with Seaborn and matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
corr = df.corr()
# Generate a mask for the upper triangle
mask = np.triu(np.ones_like(corr, dtype=np.bool))
plt.figure(figsize=(11,9))
cmap = sns.diverging_palette(5, 250, as_cmap=True)
# Draw the heatmap with the mask and correct aspect ratio
sns.heatmap(corr, mask=mask, cmap=cmap, vmax=.6, vmin=-.6, center=0,
            square=True, linewidths=.5, cbar_kws={"shrink": .5})
plt.title("Numerical features correlation matrix", fontsize=16)
plt.show()

#4. Elbow method - k-Mean for deciding groups of clustering
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline 
from sklearn.cluster import KMeans
from sklearn import datasets

query = pd.read_csv(r'mkt_campaign_query.csv')

dfquery = pd.DataFrame(query['Monetary'])
print(dfquery.head())

distortions = []
K = range(1,10)
for k in K:
    kmeanModel = KMeans(n_clusters=k)
    kmeanModel.fit(dfquery)
    distortions.append(kmeanModel.inertia_)


plt.figure(figsize=(16,8))
plt.plot(K, distortions, 'bx-')
plt.xlabel('k')
plt.ylabel('Distortion')
plt.title('The Elbow Method showing the optimal k')
plt.show()
