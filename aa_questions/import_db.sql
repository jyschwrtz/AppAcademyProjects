DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Jay', 'Schwartz'),
  ('Ameet', 'Vadhia'),
  ('Jeff', 'Fiddler');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Question 1', 'What time is it?', (SELECT id FROM users WHERE fname = 'Jay' AND lname = 'Schwartz')),
  ('Question 2', 'What time is it?', (SELECT id FROM users WHERE fname = 'Jay' AND lname = 'Schwartz')),
  ('Question 3', 'What time is it?', (SELECT id FROM users WHERE fname = 'Jay' AND lname = 'Schwartz')),
  ('Question 4', 'What time is it?', (SELECT id FROM users WHERE fname = 'Jay' AND lname = 'Schwartz')),
  ('Question 5', 'When is it?', (SELECT id FROM users WHERE fname = 'Ameet' AND lname = 'Vadhia'));


INSERT INTO
  replies (question_id, parent_reply_id, user_id, body)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'Question 1'),
    null,
    (SELECT id FROM users WHERE fname = 'Ameet' AND lname = 'Vadhia'),
    'It is 12:00pm.'
  );

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 2),
  (1, 1),
  (1, 3),
  (2, 2),
  (2, 1),
  (3, 3),
  (4, 2),
  (5, 1),
  (5, 2),
  (5, 3);

  INSERT INTO
    question_likes (question_id, user_id)
  VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (2, 3),
    (4, 1),
    (1, 3),
    (1, 2),
    (2, 1),
    (4, 2),
    (5, 3);
