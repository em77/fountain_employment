class AddSocialEnterpriseBooleanToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :social_enterprise, :boolean, null: false,
      default: false
  end
end
