class Task < Sequel::Model
  plugin :timestamps, create: :created_at, update: :updated_at
  one_to_many :pipeline
end
