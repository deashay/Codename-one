ActiveAdmin.register Kinds::Resource, as: 'Resources' do
  menu parent: 'Kinds'

  index do
    column :name
  end

  form do |f|
    f.inputs "Resource Details" do
      f.input :name
    end
    f.actions
  end
end
