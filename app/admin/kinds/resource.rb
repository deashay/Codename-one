ActiveAdmin.register Kinds::Resource do
  menu parent: 'Kinds'
  actions :all

  index do
    column :name
    column :weight
    column :necessary_resources do |resource_kind|
      resource_kind.necessary_resources.map do |resource|
        "#{resource.name}:#{resource.amount}"
      end.join(', ')
    end
    column :normal_output
    default_actions
  end

  show do |resource_kind|
    attributes_table do
      row :name
      row :weight
      row :normal_output
      table_for resource_kind.necessary_resources do
        column :name
        column :amount
      end if resource_kind.necessary_resources.any?
    end
  end

  form do |f|
    f.inputs "Resource Details" do
      f.input :name
      f.input :weight
      f.input :normal_output
      f.has_many :necessary_resources do |j|
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
