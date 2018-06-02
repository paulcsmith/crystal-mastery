class AddVideoUrlToEpisodes::V20180602193804 < LuckyMigrator::Migration::V1
  def migrate
    alter :episodes do
      add video_url : String, fill_existing_with: :nothing
    end
  end

  def rollback
    alter :episodes do
      remove :video_url
    end
  end
end
