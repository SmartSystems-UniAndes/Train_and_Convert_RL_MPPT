# Train_RL_MPPT
This repository was created for training reinforcement learning agents applied to the problem of maximum power point tracking. It includes the procedure used in order to convert the model to a tensorflowlite agent.  It also includes the schematics of the Buck Converter used to carry out the training process.

## Train_Agent Folder

The Train_Agent folder contains matlab and simulink files that are meant to be used with Matlab2022b. EnvDQN.mlx is a file in which the training parameters are set and the training process can be carried out there. SIM300kW_3paneles.slx is a simulink file that contains the environment used to train the RL model. VariablesBuck_paneles.mlx is a file that contains values for the capacitances and inductances used in the environment. It needs to be run before training the agent and it is excecuted at EnvDQN.mlx. localResetFcn_3paneles.m is a matlab file that resets the environment for each new episode generated. createDQNNetworks.m is the file in which the neural network used to train the DQN agent can be modified. At last, PandOAlgorithm.slx is a file that contains an environment where the Perturb and Observe algorithm can be tested.

## Convert_Agent_To_TFlite Folder
The Convert_Agent_To_TFlite folder contains a matlab script, called convert_script_onnx.m, that converts the agent created into a onnx file. The convert_onnx_to_tflite.ipynb file is intended to be used in google colab. This file allows the user to convert their onnx file to the tensorflow lite framework. The policy.onnx file created must be uploaded to colab to create the tflite model which can be downloaded once created.

## EAGLE_PCB_FILES/Buck300W_with_diode Folder
This folder contains the schematic and layout used to create the 300W Buck converter to test the models created in real experimental scenarios. It is possible to make it a synchronous  or non-synchronous if a MOSFET or a Diode is added to the low side of the converter. ADD JUST ONE OF THE TWO AT THE LOW SIDE, THE DIODE OR THE MOSFET. If you are using a raspberry pi with this circuit, DO NOT SUPPLY the SD pin of the IR2104 Driver (pin 3) with the 5V of the raspberry PI, this led to undesearable operations in our experiments.

To continue deploying the model into the raspberry pi, the next step would be to follow the steps presented in the next repository:
https://github.com/jfgf11/Reinforcement_Learning_MPPT

## Licenses

### Software
The software is licensed under an [MIT License](https://opensource.org/licenses/MIT). A copy of the license has been included in the repository and can be found [here](https://github.com/jfgf11/Reinforcement_Learning_MPPT/blob/main/LICENSE-MIT.txt).

### Hardware
The hardware design files are licensed under a CERN Open Source Hardware license version 2 CERN-OHL-P. Details of the license can be found [here](https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2) and a copy of the license has been included [here](https://github.com/jfgf11/Reinforcement_Learning_MPPT_RaspberryPi_Deploy/blob/main/LICENSE-CERN-OHL-P.txt).

### Documentation
![image](https://user-images.githubusercontent.com/49125155/205604437-01cdbdd8-6366-4861-b0d8-b9e25aec0f39.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
