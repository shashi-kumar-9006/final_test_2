function tests = test_and_gate_model()
    tests = functiontests(localfunctions);
end
 
function setupOnce(testCase)
    % Setup code that runs once for all tests
    % Load the Simulink model
    load_system('and_gate_model.slx');
end
 
function teardownOnce(testCase)
    % Teardown code that runs once after all tests
end
 
%% Test Functions
function testAND_TrueTrue(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '1');
    set_param('and_gate_model/Constant1', 'Value', '1');
    % Run the simulation
    sim('and_gate_model.slx');
    % Get the output from the Display block
    output = get_param('and_gate_model/Display', 'Values');
    % Assert the output
    testCase.verifyEqual(output.Values(end), 1);
end
 
function testAND_TrueFalse(testCase)
    % Test case: a = 1, b = 0
    set_param('and_gate_model/Constant', 'Value', '1');
    set_param('and_gate_model/Constant1', 'Value', '0');
    % Run the simulation
    sim('and_gate_model.slx');
    % Get the output from the Display block
    output = get_param('and_gate_model/Display', 'Values');
    % Assert the output
    testCase.verifyEqual(output.Values(end), 0);
end
 
% Add more test cases for other input combinations
