criticNet = getModel(getCritic(agentObj));
%exportONNXNetwork(criticNet,"policy.onnx")
