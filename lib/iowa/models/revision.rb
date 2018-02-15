class Revision < Sequel::Model
  plugin :timestamps, create: :created_at
  many_to_one :blueprint
  one_to_many :pipelines
end
