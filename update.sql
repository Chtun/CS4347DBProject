-- INSERT INTO PerformanceVideos (UserID, ExerciseID, Timestamp, VideoURL, Score) VALUES
-- (898666, 1, '2024-04-03 15:30:00', 'https://example.com/squats-video', 69),
-- (898667, 2, '2026-11-23 15:30:00', 'https://example.com/burpees-video', 78),
-- (898668, 3, '2014-05-03 15:30:00', 'https://example.com/pushups-video', 95),
-- (898669, 4, '2023-02-13 15:30:00', 'https://example.com/downward-dog-video', 100);


-- INSERT INTO User (UserID, Email, Password, Name) VALUES
-- (898666, 'email1@database.com', 'chrome', 'Chitsein Htun'),
-- (898667, 'email2@database.com', 'chitsein', 'Prakul Singh'),
-- (898668, 'email3@database.com', 'prakul99', 'Matthew Hui'),
-- (898669, 'email4@database.com', 'JalalOmer21', 'Prateek Mishra'),
-- (898670, 'email5@database.com', 'ChocolateCake100', 'Red One'),
-- (898671, 'email6@database.com', 'Prateek420691728', 'Google Chrome');

-- INSERT INTO Exercises (ExerciseID, Name, Description, DifficultyLevel) VALUES
-- (1, 'Squat', 'Vertical, lower body bending motion', 'Hard'),
-- (2, 'Burpees', 'Dynamic full-body movement, squat thrust', 'Medium'),
-- (3, 'Pushups', 'Upper body strength, full range motion', 'Medium'),
-- (4, 'Downward dog', 'Full body stretch, inverted V-shape position', 'Easy');

-- INSERT INTO ExerciseFeedback (UserID, ExerciseID, Score, Comments, ImprovementTips) VALUES
-- (898666, 1, 69, 'Too much butt wink and back reliance', 'Increase core stability by holding large breath'),
-- (898667, 2, 80, 'Good pace, but unexceptional squat phase', 'Increase squat range of motion'),
-- (898668, 3, 95, 'Good pace and range of motion', 'Come slightly slower on the downward motion'),
-- (898669, 4, 100, 'Extremely accurate v-shape and core stability', 'Be quicker');

INSERT INTO IdealExerciseVideos (ExerciseID, VideoURL, Description) VALUES
(1, 'https://example.com/squats-video', 'Video of patient performing a deep squat'),
(2, 'https://example.com/burpees-video', 'Video of patient performing burpees'),
(3, 'https://example.com/pushups-video', 'Pushups'),
(4, 'https://example.com/downward-dog-video', 'Patient performing downward dog exercise');

