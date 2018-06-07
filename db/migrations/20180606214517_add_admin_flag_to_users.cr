class AddAdminFlagToUsers::V20180606214517 < LuckyMigrator::Migration::V1
  def migrate
    alter :users do
      add admin : Bool, default: false
    end
  end

  def rollback
    alter :users do
      remove :admin
    end
  end
end
