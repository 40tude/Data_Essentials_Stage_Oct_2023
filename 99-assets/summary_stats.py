#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 11 12:29:01 2017

@author: antoinekrainc
"""
# Import most popular libraries
import pandas as pd
import numpy as np
from sklearn import datasets
from sklearn import metrics
import matplotlib.pyplot as plt

# Create Dataset: Age of People sorted by their way to go to work

df = pd.DataFrame(
    {'bike' : [21, 30, 17, 30, 24, 16, 29, 18], 
     'bus' : [75, 87, 49, 68, 75, 33, 60, 30], 
     'car' : [55, 34, 38, 66, 56, 66, 44, 40],
     'uber' : [22, 34, 38, 66, 56, 33, 44, 30]
    }
)

# Calculation of Mean
df.mean()

# Calculation of Median
df.median()

# Calculation of Mode
df.mode()

# Calculation of Max & Min
df.max()
df.min()


# Calculation of Quartile
print ("show the 25% Quartile")
df.quantile(.25)

# Show Box Plot
df["bike"].plot(kind="box")
df["bus"].plot(kind="box")
df["car"].plot(kind="box")
df["uber"].plot(kind="box")

# Calculate the mean of 1 column
mean = df["bike"].mean()

# Calculate the number of rows in a column
n = df["bike"].count()

# Calculate Standard Deviation
standard_deviation = df["bike"].std()

# Describe all statistics calculations at once 
df.describe()