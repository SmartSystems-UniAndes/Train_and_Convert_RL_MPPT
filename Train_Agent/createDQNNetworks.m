%% Critic Network
% this is the path of the state values in the NN
statePath = [
    imageInputLayer([numObs 1 1],'Normalization','none','Name', 'observation')
    fullyConnectedLayer(100,'Name','CriticStateFC1')
    reluLayer('Name','CriticRelu1')
    fullyConnectedLayer(100,'Name','CriticStateFC2')
    reluLayer('Name','CriticRelu2')
    fullyConnectedLayer(100,'Name','CriticStateFC3')
    reluLayer('Name','CriticRelu3')
    fullyConnectedLayer(100,'Name','CriticStateFC4')
    reluLayer('Name','CriticRelu4')
    fullyConnectedLayer(100,'Name','CriticStateFC5')
    ];

% this is the path of the action value in the NN

actionPath = [
    imageInputLayer([1 1 1],'Normalization','none','Name','action')
    fullyConnectedLayer(100,'Name','CriticActionFC1')
];

% Here is the connection path between the two paths

commonPath = [
    additionLayer(2,'Name','add')
    reluLayer('Name','CriticCommonRelu_1')
    fullyConnectedLayer(100,'Name', 'CriticCommon')
    reluLayer('Name','CriticCommonRelu_2')
    fullyConnectedLayer(1,'Name','output')];

% Connect the layer graph

criticNetwork = layerGraph();
criticNetwork = addLayers(criticNetwork,statePath);
criticNetwork = addLayers(criticNetwork,actionPath);
criticNetwork = addLayers(criticNetwork,commonPath);
criticNetwork = connectLayers(criticNetwork,'CriticStateFC5','add/in1');
criticNetwork = connectLayers(criticNetwork,'CriticActionFC1','add/in2');












