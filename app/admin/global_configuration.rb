ActiveAdmin.register GlobalConfiguration do
  index do
    column :starting_resources do |config|
      config.starting_resources.map do |resource|
        "#{resource.name}:#{resource.amount}"
      end.join(', ')
    end
    column :starting_units
    default_actions
  end

  show do |config|
    attributes_table do
      row :starting_units
      table_for config.starting_resources do
        column :name
        column :amount
      end if config.starting_resources.any?
    end
  end

  form do |f|
    f.inputs "Global Configuration Details" do
      f.input :starting_units, as: :number
      f.input :is_global, as: :boolean
      f.has_many :starting_resources do |j|
        j.input :kind, collection: Kinds::Resource.all
        j.input :amount
        if j.object.id
          j.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove'
        end
      end
    end
    f.actions
  end
end
