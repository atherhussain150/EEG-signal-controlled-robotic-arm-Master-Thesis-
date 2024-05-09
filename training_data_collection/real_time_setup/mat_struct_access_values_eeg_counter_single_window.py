import scipy.io as sio
import numpy
from numpy import savetxt 
from sklearn.decomposition import PCA
from tensorflow.random import set_seed
from numpy.random import seed
from sklearn.preprocessing import RobustScaler
from os import listdir

def _check_keys( dict):
	"""
	checks if entries in dictionary are mat-objects. If yes
	todict is called to change them to nested dictionaries
	"""
	for key in dict:
    		if isinstance(dict[key], sio.matlab.mio5_params.mat_struct):
        		dict[key] = _todict(dict[key])
	return dict


def _todict(matobj):
    """
    A recursive function which constructs from matobjects nested dictionaries
    """
    dict = {}
    for strg in matobj._fieldnames:
        elem = matobj.__dict__[strg]
        if isinstance(elem, sio.matlab.mio5_params.mat_struct):
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

labelZero = numpy.zeros((50, 1))
epochs = numpy.empty((0, 64))
my_input_data = numpy.empty((0, 64))
input_data = numpy.empty((0, 64))
final_input_data = numpy.empty((0, 32000))
input_to_nn = numpy.empty((0, 32000))

for file in [f for f in listdir("Nothing")]:
	myKeys = loadmat("Nothing\\" + file)
	print(myKeys)
	eegData = myKeys['eeg_re'][0:1024,0:64]
	print(eegData.shape)

	for k in range (0, 1000, 2):
		epochs = eegData[k]
		my_input_data = numpy.append(my_input_data, epochs.reshape(1, 64), axis=0)
	print(my_input_data.shape)   #500 x 64 						

	input_data = rScaler.fit_transform(my_input_data)	
	input_data = input_data.transpose()
	input_to_nn = input_data.flatten().reshape(1, 32000)
	final_input_data = numpy.append(final_input_data, input_to_nn, axis=0)
	my_input_data = numpy.empty((0, 64))

final_input_data_with_labels_0_win_1 = numpy.append(final_input_data, labelZero, axis=1)
final_input_data = numpy.empty((0, 32000))


#==================================== LABEL 0 =========================================

labelOne = numpy.ones((50, 1))
final_input_data = numpy.empty((0, 32000))

for file in [f for f in listdir("Pull")]:
	myKeys = loadmat("Pull\\" + file)
	print(myKeys)
	eegData = myKeys['eeg_re'][0:1024,0:64]
	print(eegData.shape)

	for k in range (0, 1000, 2):
		epochs = eegData[k]
		my_input_data = numpy.append(my_input_data, epochs.reshape(1, 64), axis=0)
	print(my_input_data.shape)						

	input_data = rScaler.fit_transform(my_input_data)	
	input_data = input_data.transpose()
	input_to_nn = input_data.flatten().reshape(1, 32000)
	final_input_data = numpy.append(final_input_data, input_to_nn, axis=0)
	my_input_data = numpy.empty((0, 64))

final_input_data_with_labels_1_win_1 = numpy.append(final_input_data, labelOne, axis=1)
final_input_data = numpy.empty((0, 32000))


#==================================== LABEL 1 =========================================

labelTwo = numpy.ones((50, 1)) * 2
final_input_data = numpy.empty((0, 32000))

for file in [f for f in listdir("Push")]:
	myKeys = loadmat("Push\\" + file)
	print(myKeys)
	eegData = myKeys['eeg_re'][0:1024,0:64]
	print(eegData.shape)

	for k in range (0, 1000, 2):
		epochs = eegData[k]
		my_input_data = numpy.append(my_input_data, epochs.reshape(1, 64), axis=0)
	print(my_input_data.shape)						

	input_data = rScaler.fit_transform(my_input_data)	
	input_data = input_data.transpose()
	input_to_nn = input_data.flatten().reshape(1, 32000)
	final_input_data = numpy.append(final_input_data, input_to_nn, axis=0)
	my_input_data = numpy.empty((0, 64))

final_input_data_with_labels_2_win_1 = numpy.append(final_input_data, labelTwo, axis=1)
final_input_data = numpy.empty((0, 32000))


#==================================== LABEL 2 =========================================

total_input_data_with_labels = numpy.concatenate((final_input_data_with_labels_0_win_1, final_input_data_with_labels_1_win_1, final_input_data_with_labels_2_win_1), axis=0)	

savetxt('single_window_with_labels_RT-2.csv', total_input_data_with_labels, delimiter=',')


