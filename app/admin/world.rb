ActiveAdmin.register World do     
  index do                            
    column :name    
    column :width
    column :height      
    default_actions                   
  end                                                  

  form do |f|                         
    f.inputs "World Details" do       
      f.input :name  
      f.input :width, as: :number
      f.input :height, as: :number               
    end                               
    f.actions                         
  end                                 
end                                   
