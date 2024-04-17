function tests = test_and_gate_model()
    tests = functiontests(localfunctions);
end

function setupOnce(testCase)
    % Load the Simulink model
    load_system('and_gate_model.slx');
end

function teardownOnce(testCase)
    % No teardown required
end



%% Test Functions
function testAND_TrueTrue(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '1');
    set_param('and_gate_model/Constant1', 'Value', '1');
    % Run the simulation
    sim('and_gate_model.slx');
    % Get the output from the Display block
    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    % Assert the output
    testCase.verifyEqual(double(a), 1)
    clear ans
end
function testAND_TrueFalse(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '1');
    set_param('and_gate_model/Constant1', 'Value', '0');
    % Run the simulation
    sim('and_gate_model.slx');
    % Get the output from the Display block
    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    % Assert the output
    testCase.verifyEqual(double(a), 0)
    clear ans
end
function testAND_FalseTrue(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '0');
    set_param('and_gate_model/Constant1', 'Value', '1');
    % Run the simulation
    sim('and_gate_model.slx');
    % Get the output from the Display block
    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    % Assert the output
    testCase.verifyEqual(double(a), 0)
    clear ans
end
function testAND_FalseFalse(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '0');
    set_param('and_gate_model/Constant1', 'Value', '0');
    % Run the simulation
    sim('and_gate_model.slx');
    % Get the output from the Display block
    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    % Assert the output
    testCase.verifyEqual(double(a), 0)
    clear ans
end
