require_relative 'main'

class Question < ModelBase
  attr_accessor :id, :title, :body, :author_id

  # def self.all
  #   data = QuestionsDatabase.instance.execute(<<-SQL)
  #     SELECT
  #       *
  #     FROM
  #       questions
  #   SQL
  #
  #   data.map { |data| Question.new(data) }
  # end

  # def self.find_by_id(id)
  #   data = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       questions
  #     WHERE
  #       id = ?
  #   SQL
  #
  #   Question.new(data.first)
  # end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    data.map { |data| Question.new(data) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, @author_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(data.first)
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  # def save
  #   if @id
  #     #then update
  #     QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id)
  #       UPDATE
  #         questions
  #       SET
  #         title = ?, body = ?, author_id = ?
  #       WHERE
  #         id = ?
  #     SQL
  #   else
  #     #then insert
  #     QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
  #       INSERT INTO
  #         questions (title, body, author_id)
  #       VALUES
  #         (?, ?, ?)
  #     SQL
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  # end

end
