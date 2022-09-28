# A Marketing Campaign Evaluation
## 1. Introduction
Hello! This is my very first experience and practice as a data analyst with Python, SQL, and Power BI.

**Therefore, if there is any issues, please kindly contact me. All of my repository will be opened for learning/practicing purpose and discussion.**

## 2. About the dataset
The dataset indicates a result of the company's marketing campaign after finishing the 6th wave in 2 years. The mission is to evaluate how the campaign was, and what is the recommendation for the next move.

## 3. Essentials
### Python
- ProfileReport from Pandas-Profiling: for preliminary findings, I used the package from /ydataai (I'm your fan, YData <3 ), how to:
```
pip install pandas-profiling http://github.com/pandas-profiling/pandas-profiling/archive/master.zip
from pandas_profiling import ProfileReport
```
- Opendatasets: for downloading the dataset from Kaggle
```
import opendatasets as od
od.download("https://www.kaggle.com/datasets/rodsaldanha/arketing-campaign")
```
*Notice: if you haven't installed opendatasets:*
```
pip install opendatasets
```
- Other packages: pandas, matplotlib, seaborn, numpy.
### SQL
Some basics: CTES, Windows Functions, Aggregate Functions, and CASE-WHEN statement.
### Power BI
- DAX filters.
- Power Query editer: Unpivot feature.
### Kaggle API
Make sure you may know how to create your own token on Kaggle. See here: https://www.kaggle.com/docs/api.

### Especially, I would like to say thank you to Lam Nguyen, who is my data mentor, has coached and fully guided me during the time I started learning and being familiar with these tools. ###  
