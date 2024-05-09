import numpy
from tensorflow.random import set_seed
from numpy.random import seed
import os

# setting the seed
seed(1)
set_seed(1)

os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\23.04.05_R")
loaded_complete_data_1 = numpy.loadtxt('window_1536_with_labels_23_04_05.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\23.04.12_R")
loaded_complete_data_2 = numpy.loadtxt('window_1536_with_labels_23_04_12.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\23.04.14_R")
loaded_complete_data_3 = numpy.loadtxt('window_1536_with_labels_23_04_14.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\23.04.19_R")
loaded_complete_data_4 = numpy.loadtxt('window_1536_with_labels_23_04_19.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\23.04.20_R")
loaded_complete_data_5 = numpy.loadtxt('window_1536_with_labels_23_04_20.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\23.05.05_R")
loaded_complete_data_6 = numpy.loadtxt('window_1536_with_labels_23_05_05.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\RT-Training_Data\RT-1")
loaded_complete_data_7 = numpy.loadtxt('single_window_with_labels_RT-1.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\RT-Training_Data\RT-2")
loaded_complete_data_8 = numpy.loadtxt('single_window_with_labels_RT-2.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\RT-Training_Data\RT-3")
loaded_complete_data_9 = numpy.loadtxt('single_window_with_labels_RT-3.csv', delimiter=',')
os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\RT-Training_Data\RT-4")
loaded_complete_data_10 = numpy.loadtxt('single_window_with_labels_RT-4.csv', delimiter=',')


os.chdir(r"C:\Users\Laboratory\Desktop\Ather\specialization\model")

loaded_complete_data = numpy.concatenate((loaded_complete_data_1, loaded_complete_data_2, loaded_complete_data_3, loaded_complete_data_4, loaded_complete_data_5, loaded_complete_data_6, loaded_complete_data_7, loaded_complete_data_8, loaded_complete_data_9, loaded_complete_data_10), axis=0)	

print(loaded_complete_data.shape)

numpy.savetxt('my_1536_window_RT_falvor_specialization_0_1000.csv', loaded_complete_data, delimiter=',')	

#transposed_data = numpy.transpose(loaded_complete_data)
#numpy.savetxt('transposed_data.csv', transposed_data, delimiter=',')