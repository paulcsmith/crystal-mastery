class CreateEpisodesAndSeries::V20180601205616 < LuckyMigrator::Migration::V1
  def migrate
    create :series do
      add title : String
      add description : String
    end

    create :episodes do
      add title : String
      add description : String
      add_belongs_to series : Series?, on_delete: :cascade
    end
  end

  def rollback
    drop :episodes
    drop :series
  end
end
