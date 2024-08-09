CREATE TABLE as_s_task_states (
    task_state_id NUMBER , -- Unique identifier for each task state
    state_name VARCHAR2(50),                               -- Name of the task state (e.g., pending, in progress, completed)
    PRIMARY KEY (task_state_id)
);
