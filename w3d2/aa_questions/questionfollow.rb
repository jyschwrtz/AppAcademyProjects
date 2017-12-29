require_relative 'main'

class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.*
      FROM users
      JOIN question_follows
        ON question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL

    data.map { |data| User.new(data) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.*
      FROM questions
      JOIN question_follows
        ON question_follows.question_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL

    data.map { |data| Question.new(data) }
  end

  def self.most_followed_questions(n)
      data = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
          questions.*
        FROM
          questions
        JOIN
          question_follows ON question_follows.question_id = questions.id
        GROUP BY
          questions.id
        ORDER BY
          COUNT(question_follows.user_id) DESC
        LIMIT
          ?
      SQL

    data.map { |data| Question.new(data) }
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        question_follows
    SQL

    data.map { |data| QuestionFollow.new(data) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    QuestionFollow.new(data.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
