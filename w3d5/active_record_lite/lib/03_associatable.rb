require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    foreign_string = "#{name}_id"
    defaults = {
        class_name: name.to_s.camelcase,
        foreign_key: foreign_string.to_sym,
        primary_key: :id
      }
    options = defaults.merge(options)
    @name = name
    @class_name = options[:class_name]
    @foreign_key = options[:foreign_key]
    @primary_key = options[:primary_key]
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    foreign_string = "#{self_class_name.to_s.underscore}_id"
    defaults = {
        class_name: name.to_s.singularize.camelcase,
        foreign_key: foreign_string.to_sym,
        primary_key: :id
      }
    options = defaults.merge(options)
    @name = name
    @class_name = options[:class_name]
    @foreign_key = options[:foreign_key]
    @primary_key = options[:primary_key]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name.to_sym) do
      p foreign_key = options.send(:foreign_key)
      p foreign = self.send(foreign_key.to_sym)
      options.model_class.where(id: foreign).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.class, options)
    define_method(name.to_sym) do
      p foreign_key = options.send(:foreign_key)
      # p foreign = self.send(foreign_key.to_sym)
      p primary_key = options.send(:primary_key)
      p primary = self.send(primary_key.to_sym)
      options.model_class.where(foreign_key => primary).first
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
