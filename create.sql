CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL,
    Password VARCHAR(25) NOT NULL,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Exercises (
    ExerciseID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Description TEXT NOT NULL,
    TargetArea VARCHAR(100) NOT NULL,
    DifficultyLevel INT NOT NULL
);

CREATE TABLE PerformanceVideos (
    UserID INT NOT NULL,
    ExerciseID INT NOT NULL,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    VideoURL VARCHAR(200) NOT NULL,
    Score INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercises(ExerciseID)
);

CREATE TABLE IdealExerciseVideos (
    ExerciseID INT PRIMARY KEY,
    VideoURL VARCHAR(200) NOT NULL,
    Description TEXT NOT NULL,
    FOREIGN KEY (ExerciseID) REFERENCES Exercises(ExerciseID)
);

CREATE TABLE ExerciseFeedback (
    UserID INT,
    ExerciseID INT,
    Score INT,
    Comments TEXT,
    ImprovementTips TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercises(ExerciseID)
);