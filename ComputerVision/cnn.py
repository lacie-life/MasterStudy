# -*- coding: utf-8 -*-
"""vd_CNN.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/12v8_N6kGq8cwYuo0rd4ezQv6L72jxFpH
"""

import keras
import numpy as np

import tensorflow.keras as tk
mnist = tk.datasets.mnist
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = x_train.reshape(60000, 784).astype("float32") / 255
x_test = x_test.reshape(10000, 784).astype("float32") / 255

import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# define model :
#input-->[dense 64]--->x--->[dense64]-->x===> [dense10]==> output

inputs = keras.Input(shape=(784,))
dense = layers.Dense(32, activation="relu")
x = dense(inputs)
x = layers.Dense(32, activation="relu")(x)
outputs = layers.Dense(10)(x)
model = keras.Model(inputs=inputs, outputs=outputs, name="mnist_model")
model.summary()

# Training model:
model.compile(
    loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True),
    optimizer=keras.optimizers.RMSprop(),
    metrics=["accuracy"],
)

history = model.fit(x_train, y_train, batch_size=64, epochs=10, validation_split=0.2)

test_scores = model.evaluate(x_test, y_test, verbose=2)
print("Test loss:", test_scores[0])
print("Test accuracy:", test_scores[1])

### thử với dữ liệu vuông tròn tam giác:
import os
import cv2

training_dir = '/content/drive/MyDrive/3.Training/Course_BasicPython/deep_learning/TrainingDataset/'
testing_dir ='/content/drive/MyDrive/3.Training/Course_BasicPython/deep_learning/TestingDataset/'

class_name= os.listdir(training_dir)
class_name.sort()
training_data_matrix =[]
count=0 # id_label
training_label=[]
for obj_class in class_name:
  files =os.listdir(training_dir + obj_class )
  for image_name in files:
    image_path = training_dir + obj_class +'/' + image_name
    im_rgb= cv2.cvtColor (cv2.imread(image_path), cv2.COLOR_BGR2RGB)
    im_rgb =cv2.resize(im_rgb, (256,256))
    training_data_matrix.append(im_rgb) 
    training_label.append(count)
  count= count+1

training_data_matrix = np.array(training_data_matrix)/255
training_label= np.array(training_label)

np.shape(training_data_matrix)

np.shape(training_label)



testing_dir ='/content/drive/MyDrive/3.Training/Course_BasicPython/deep_learning/TestingDataset/'

class_name= os.listdir(testing_dir)
class_name.sort()
testing_data_matrix =[]
count=0 # id_label
testing_label=[]
for obj_class in class_name:
  files =os.listdir(testing_dir + obj_class )
  for image_name in files:
    image_path = testing_dir + obj_class +'/' + image_name
    im_rgb= cv2.cvtColor (cv2.imread(image_path), cv2.COLOR_BGR2RGB)
    im_rgb =cv2.resize(im_rgb, (256,256))
    testing_data_matrix.append(im_rgb) 
    testing_label.append(count)
  count= count+1

testing_data_matrix = np.array(testing_data_matrix)/255
testing_label= np.array(testing_label)

# define model :
#input-->[dense 64]--->x--->[dense64]-->x===> [dense10]==> output

inputs = keras.Input(shape=(256,256,3))
dense = layers.Dense(64, activation="relu")
x = dense(inputs)
x = layers.Dense(64, activation="relu")(x)
x = layers.MaxPooling2D((2, 2), padding='same')(x)
x = layers.Dropout(0.5)(x)
x = layers.Dense(16, activation="relu")(x)
x = layers.MaxPooling2D((2, 2), padding='same')(x)
x = layers.Dropout(0.5)(x)
flatten_layer = layers.Flatten()  # instantiate the layer
x = flatten_layer(x)       # call it on the given tensor
outputs = layers.Dense(3)(x)
model_1 = keras.Model(inputs=inputs, outputs=outputs, name="shape_model")
model_1.summary()



# Training model:
model_1.compile(
    loss=keras.losses.SparseCategoricalCrossentropy(from_logits=True),
    optimizer=keras.optimizers.RMSprop(),
    metrics=["accuracy"],
)

history = model_1.fit(training_data_matrix, training_label, batch_size=4, epochs=20, validation_split=0.2)

test_scores = model_1.evaluate(testing_data_matrix, testing_label, verbose=2)
print("Test loss:", test_scores[0])
print("Test accuracy:", test_scores[1])