require_relative 'main'

class QuestionLike
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        question_likes
    SQL

    data.map { |data| QuestionLike.new(data) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    QuestionLike.new(data.first)
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.id, users.fname, users.lname
      FROM users
      JOIN question_likes
        ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
    SQL

    data.map { |data| User.new(data) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT COUNT(users.id)
      FROM users
      JOIN question_likes
        ON question_likes.user_id = users.id
      WHERE question_likes.question_id = ?
    SQL
    data.first['COUNT(users.id)']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.*
      FROM questions
      JOIN question_likes
        ON question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = ?
    SQL

    data.map { |data| Question.new(data) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_like ON question_like.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_like.user_id) DESC
      LIMIT
        ?
    SQL

    data.map { |data| Question.new(data) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
