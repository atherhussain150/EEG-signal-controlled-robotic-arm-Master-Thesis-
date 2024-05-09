from numpy import loadtxt
import numpy
from keras.models import load_model
from sklearn.metrics import confusion_matrix
from numpy import savetxt
import tensorflow
from numpy import mean
from sklearn.preprocessing import RobustScaler
from sklearn.preprocessing import minmax_scale
from numpy.random import seed
from tensorflow.random import set_seed
import scipy.io as sio
from os import listdir
import os

def _check_keys( dict):
	"""
	checks if entries in dictionary are mat-objects. If yes
	todict is called to change them to nested dictionaries
	"""
	for key in dict:
    		if isinstance(dict[key], sio.matlab.mat_struct):
        		dict[key] = _todict(dict[key])
	return dict


def _todict(matobj):
    """
    A recursive function which constructs from matobjects nested dictionaries
    """
    dict = {}
    for strg in matobj._fieldnames:
        elem = matobj.__dict__[strg]
        if isinstance(elem, sio.mat_struct):
            dict[strg] = _todict(elem)
        else:
            dict[strg] = elem
    return dict


def loadmat(filename):
	"""
	this function should be called instead of direct scipy.io .loadmat
	as it cures the problem of not properly recovering python dictionaries
	from mat files. It calls the function check keys to cure all entries
	which are still mat-objects
	"""
	data = sio.loadmat(filename, struct_as_record=False, squeeze_me=True)
	return _check_keys(data)

# setting the seed
seed(1)
set_seed(1)

# create the robust scaler for the data
rScaler = RobustScaler(with_centering=True, with_scaling=True, quantile_range=(20, 100-20), unit_variance=True)

Pull = 0
Push = 0
Nothing = 0

Corr_Push = 0
Corr_Pull = 0
Corr_Nothing = 0

Total_Samples = 0

os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\RT-Testing_Data\RT1")

#PUSH
for file in [f for f in listdir("Push")]:
	myKeys = loadmat("Push\\" + file)

	eegData = myKeys['eeg_re'] 
	eegData = eegData[0:1024,0:64] 

	my_input_data = numpy.empty((0, 64))
	input_data = numpy.empty((0, 64))
	input_to_nn = numpy.empty((0, 32000))

################################################


	for k in range (0, len(eegData), 2):
		epochs = eegData[k]
		my_input_data = numpy.append(my_input_data, epochs.reshape(1, 64), axis=0)
	#print(my_input_data.shape)   #512 x 64 						

	input_data = rScaler.fit_transform(my_input_data[0:500,:])	
	input_data = input_data.transpose()
	input_to_nn = input_data.flatten().reshape(1, 32000)

################################################

# transform the data in the format which the model wants
	final_input = input_to_nn.reshape(1, 64, 500)
	single_input = final_input.transpose(0, 2, 1)


# load the model
	model = load_model("..\\..\\model\\best_model.h5")

# get the "predicted class" outcome
	y_hat = model.predict(single_input) 
	y_pred = numpy.argmax(y_hat,axis=-1)
	
	if(y_pred[0] == 0):
		Nothing += 1
	if(y_pred[0] == 1):
		Pull += 1
	if(y_pred[0] == 2):
		Push += 1

Corr_Push = Push
Total_Samples += (Push + Pull + Nothing)
print("Nothing predictions: ", Nothing)
print("Push predictions: ", Push)
print("Pull predictions: ", Pull)



#========================================================

Pull = 0
Push = 0
Nothing = 0

#PULL
for file in [f for f in listdir("Pull")]:
	myKeys = loadmat("Pull\\" + file)

	eegData = myKeys['eeg_re'] 
	eegData = eegData[0:1024,0:64] 
	#print(eegData.shape) # 1024 x 64

	my_input_data = numpy.empty((0, 64))
	input_data = numpy.empty((0, 64))
	input_to_nn = numpy.empty((0, 32000))




################################################


	for k in range (0, len(eegData), 2):
		epochs = eegData[k]
		my_input_data = numpy.append(my_input_data, epochs.reshape(1, 64), axis=0)
	#print(my_input_data.shape)   #512 x 64 						

	input_data = rScaler.fit_transform(my_input_data[0:500,:])	
	input_data = input_data.transpose()
	input_to_nn = input_data.flatten().reshape(1, 32000)


################################################

# transform the data in the format which the model wants
	final_input = input_to_nn.reshape(1, 64, 500)
	single_input = final_input.transpose(0, 2, 1)


# load the model
	model = load_model("..\\..\\model\\best_model.h5")

# get the "predicted class" outcome
	y_hat = model.predict(single_input) 
	y_pred = numpy.argmax(y_hat,axis=-1)
	
	if(y_pred[0] == 0):
		Nothing += 1
	if(y_pred[0] == 1):
		Pull += 1
	if(y_pred[0] == 2):
		Push += 1

Corr_Pull = Pull
Total_Samples += (Push + Pull + Nothing)
print("Nothing predictions: ", Nothing)
print("Push predictions: ", Push)
print("Pull predictions: ", Pull)

#=======================================================

Pull = 0
Push = 0
Nothing = 0

#PUSH
for file in [f for f in listdir("Nothing")]:
	myKeys = loadmat("Nothing\\" + file)

	eegData = myKeys['eeg_re'] 
	eegData = eegData[0:1024,0:64] 
	#print(eegData.shape) # 1024 x 64

	my_input_data = numpy.empty((0, 64))
	input_data = numpy.empty((0, 64))
	input_to_nn = numpy.empty((0, 32000))




################################################


	for k in range (0, len(eegData), 2):
		epochs = eegData[k]
		my_input_data = numpy.append(my_input_data, epochs.reshape(1, 64), axis=0)
	#print(my_input_data.shape)   #512 x 64 						

	input_data = rScaler.fit_transform(my_input_data[0:500,:])	
	input_data = input_data.transpose()
	input_to_nn = input_data.flatten().reshape(1, 32000)


################################################

# transform the data in the format which the model wants
	final_input = input_to_nn.reshape(1, 64, 500)
	single_input = final_input.transpose(0, 2, 1)


# load the model
	model = load_model("..\\..\\model\\best_model.h5")

# get the "predicted class" outcome
	y_hat = model.predict(single_input) 
	y_pred = numpy.argmax(y_hat,axis=-1)
	
	if(y_pred[0] == 0):
		Nothing += 1
	if(y_pred[0] == 1):
		Pull += 1
	if(y_pred[0] == 2):
		Push += 1

Corr_Nothing = Nothing
Total_Samples += (Push + Pull + Nothing)
print("Nothing predictions: ", Nothing)
print("Push predictions: ", Push)
print("Pull predictions: ", Pull)
perc = "%"

total_correct_pred = Corr_Push + Corr_Pull + Corr_Nothing

Accuracy = (Corr_Push + Corr_Pull + Corr_Nothing) / Total_Samples
print("Total Samples: ", Total_Samples)
print("Accuracy:", format(Accuracy * 100,".2f"))