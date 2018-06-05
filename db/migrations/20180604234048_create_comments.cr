class CreateComments::V20180604234048 < LuckyMigrator::Migration::V1
  def migrate
    create :comments do
      add body : String
      add_belongs_to author : User, on_delete: :cascade
      add_belongs_to episode : Episode, on_delete: :cascade
    end
  end

  def rollback
    drop :comments
  end
end
