ActiveAdmin.register World do
  index do
    column :name
    column :width
    column :height
    column :starting_units do |world|
      world.config.try(:starting_units)
    end
    column :global_configuration do |world|
      link_to world.config,
        admin_global_configuration_path(world.config.id) unless world.config.nil?
    end
    default_actions
  end

  show do |world|
    attributes_table do
      row :name
      row :width
      row :height
    end
  end

  form do |f|
    f.inputs "World Details" do
      f.input :name
      f.input :width, as: :number
      f.input :height, as: :number
      f.input :global_configuration, collection: GlobalConfiguration.all
    end
    f.actions
  end
end
