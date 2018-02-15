Sequel.migration do
  transaction
  change do
    create_table(:blueprints) do
      primary_key :id
      String :name, null: false
      String :description, null: false, text: true
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
      TrueClass :deleted, null: false, default: false
    end

    create_table(:revisions) do
      primary_key :id
      foreign_key :blueprint_id, :blueprints
      blob :definition, null: false
      DateTime :created_at, null: false
    end

    create_table(:pipelines) do
      primary_key :id
      foreign_key :revision_id, :revisions
      Integer :status, null: false, default: 0
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:tasks) do
      primary_key :id
      foreign_key :pipeline_id, :pipelines
      String :name, null: false
      String :description, null: false, text: true
      blob :return_value, text: true
      Integer :status, null: false, default: 0
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
