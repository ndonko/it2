module ClientsHelper
  
  def gravatar_for(client,options = { :size => 50 })
    gravatar_image_tag(client.email.downcase, :alt => client.nom,
                                              :class => 'gravatar',
                                              :gravatar => options
                                             )
  end
  
end
