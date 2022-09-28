#Make sure opendatasets and kaggle already installed on your Python

import opendatasets as od
import pandas

#Kaggle's requirement about API token, you need to create an account on Kaggle then create them in profile settings  
od.download(
    "https://www.kaggle.com/datasets/rodsaldanha/arketing-campaign"
)

#I usually use ProfileReport from pandas-profiling by ydataai, that's very useful, you can get a brief report real quick
pip install http://github.com/pandas-profiling/pandas-profiling/archive/master.zip

import pandas as pd
df = pd.read_excel('/content/arketing-campaign/marketing_campaign.xlsx')
#The dir may depend on your local host, for me it'll be /content/...

from pandas_profiling import ProfileReport
profile = ProfileReport(
    df, title="Pandas Profiling Report dataset"
)

#Try typing "profile" at the end, a html file will appear
