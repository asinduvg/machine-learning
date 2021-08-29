% R represents the reward table

R = [
    -inf 0 -inf -inf -inf -inf -inf 0 -inf -inf -inf -inf -inf -inf -inf;
    0 -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf;
    -inf -inf -inf 0 -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf;
    -inf -inf 0 -inf 0 -inf -inf -inf 0 -inf -inf -inf -inf -inf -inf;
    -inf -inf -inf 0 -inf 0 -inf -inf -inf 0 -inf -inf -inf -inf -inf;
    -inf -inf -inf -inf 0 -inf 100 -inf -inf -inf 0 -inf -inf -inf -inf;
    -inf -inf -inf -inf -inf 0 -inf -inf -inf -inf -inf -inf -inf -inf -inf;
    0 -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf 0 -inf -inf;
    -inf -inf -inf 0 -inf -inf -inf 0 -inf 0 -inf -inf -inf 0 -inf;
    -inf -inf -inf -inf 0 -inf -inf -inf 0 -inf 0 -inf -inf -inf -inf;
    -inf -inf -inf -inf -inf 0 -inf -inf -inf 0 -inf 0 -inf -inf -inf;
    -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf 0 -inf -inf -inf 0;
    -inf -inf -inf -inf -inf -inf -inf 0 -inf -inf -inf -inf -inf 0 -inf;
    -inf -inf -inf -inf -inf -inf -inf -inf 0 -inf -inf -inf 0 -inf -inf;
    -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf -inf 0 -inf -inf -inf;
    ];

gamma = 0.7; % the learning rate
goal_state = 7;
q = zeros(size(R));

for episode = 1:1000
    % select a random initial state
    y = randperm(size(R, 1));
    state = y(1);

    while state ~= goal_state
        % find all possible actions from the state
        actions = find(R(state, :) >= 0);

        if (size(actions, 2) > 0)
            % select one action randomly
            i = randperm(size(actions, 2));
            action = actions(i(1));
        end

        % return a column vector with the max values of each Row
        qMax = max(q, [], 2);

        % compute the q value
        q(state, action) = R(state, action) + gamma * qMax(action);

        % transition to the next state
        state = action;
    end

end

% find the path
initial_state = input("Enter initial state: ");
state = initial_state;
best_path = num2str(state);

while state ~= goal_state
    [max_action, max_index] = max(q(state, :));
    state = max_index;
    best_path = strcat(best_path, "->", num2str(state));
end

disp(best_path);

clear;

