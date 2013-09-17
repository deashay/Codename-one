ActiveAdmin.register World do     
  index do                            
    column :name          
    default_actions                   
  end                                                  

  form do |f|                         
    f.inputs "World Details" do       
      f.input :name                  
    end                               
    f.actions                         
  end                                 
end                                   
