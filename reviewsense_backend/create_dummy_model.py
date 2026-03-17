import lightgbm as lgb
import numpy as np
import os

X = np.random.rand(100, 8)
y = np.random.randint(0, 2, 100)
train_data = lgb.Dataset(X, label=y)
params = {'objective': 'binary', 'metric': 'binary_logloss', 'verbose': -1}
model = lgb.train(params, train_data, num_boost_round=10)

os.makedirs('models', exist_ok=True)
model.save_model('models/authenticity_model.txt')
print("Dummy model created.")