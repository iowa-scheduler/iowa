class Pipeline < Sequel::Model
  plugin :timestamps, create: :created_at, update: :updated_at
  many_to_one :revision
  one_to_many :tasks
end
