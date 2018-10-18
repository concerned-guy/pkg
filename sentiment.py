#!/usr/bin/env python2
from __future__ import print_function
import re
import csv
import numpy as np 
import matplotlib.pyplot as plt 
from nltk.stem.porter import PorterStemmer
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import f1_score
from wordcloud import WordCloud

def read_data():
    data = []
    with open("train.csv", "rb") as csv_file:
        tweet_reader = csv.reader(csv_file)
        for tweet in tweet_reader:
            data.append([tweet[0], tweet[-1]])
    return data

def clean_data(data):
    stemmer = PorterStemmer()
    label = []
    text = []
    for l, t in data:
        t = re.sub(r"@[\w]*", "", t)
        t = re.sub(r"https?://[^ ]*", "", t)
        t = re.sub(r"[^a-zA-Z#]", " ", t)
        tokens = [stemmer.stem(w) for w in t.lower().split() if len(w) > 3]
        label.append(0 if l == "0" else 1)
        text.append(' '.join(tokens))
    return label, text

label, text = clean_data(read_data())

# all_words = ' '.join(text)
# wordcloud = WordCloud(width=800, height=500).generate(all_words)
# plt.imshow(wordcloud, interpolation="bilinear")
# plt.axis('off')
# plt.show()

bow_vectorizer = CountVectorizer(max_df=0.90, min_df=2,
                                 max_features=1000, stop_words='english')
# bag-of-words feature matrix
bow = bow_vectorizer.fit_transform(text)

cutoff = len(text)*85/100
train_bow, test_bow = bow[:cutoff,:], bow[cutoff:,:]
train_label, test_label = label[:cutoff], label[cutoff:]

lreg = LogisticRegression()
lreg.fit(train_bow, train_label) # training the model

test_pred = lreg.predict_proba(test_bow)
test_pred_int = test_pred[:,1] >= 0.3
test_pred_int = test_pred_int.astype(np.int)

print(f1_score(test_label, test_pred_int)) # calculating f1 score
