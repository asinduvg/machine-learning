% R represents the reward table
R = [
    -inf 0 -inf 0 -inf -inf -inf;
    0 -inf 0 0 0 -inf -inf;
    -inf 0 -inf -inf -inf 0 100;
    0 0 -inf -inf -inf -inf 100;
    -inf 0 -inf -inf -inf 0 -inf;
    -inf -inf 0 -inf 0 -inf -inf;
    -inf -inf 0 0 -inf -inf 100;
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
            i = randperm(size(actions, 2)); # i = 2 1
            action = actions(i(1)); # action = 2
        end

        % return a column vector with the max values of each Row
        qMax = max(q, [], 2);

        # qMax =
        # 0
        # 0
        # 100
        # 100
        # 0
        # 0
        # 100

        % compute the q value
        q(state, action) = R(state, action) + gamma * qMax(action);

        % transition to the next state
        state = action;
    end
end

disp(q);
