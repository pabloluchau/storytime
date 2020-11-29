Rails.application.routes.draw do

  # HOME 
  get("/", { :controller => "stories", :action => "index"})
  get("/stories", { :controller => "stories", :action => "index"})

  # USER
  get("/account_details", { :controller => "user_authentication", :action => "details"})

  get("/sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  get("/sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })

  get("/sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
  get("/cancel_user", { :controller => "user_authentication", :action => "destroy" })
  get("/edit_user", { :controller => "user_authentication", :action => "edit_profile_form" })       
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  #STORY
  post("/insert_story", { :controller => "stories", :action => "create" })

  get("/stories", { :controller => "stories", :action => "index"})
  get("/stories/:path_id", { :controller => "stories", :action => "show" })
  
  post("/modify_story/:path_id", { :controller => "stories", :action => "update" })
  get("/delete_story/:path_id", { :controller => "stories", :action => "destroy" })

  #PARTS
  
  post("/insert_story_part", { :controller => "story_parts", :action => "create" })


  # LIKES

  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })
  post("/insert_like", { :controller => "likes", :action => "create" })

  #CLOSE VOTES

  post("/insert_close_vote", { :controller => "close_votes", :action => "create" })

  # get("/close_votes/:path_id", { :controller => "close_votes", :action => "show" })

  get("/delete_close_vote/:path_id", { :controller => "close_votes", :action => "destroy" })
  
  
  
  
  
  # # Routes for the Close vote resource:

  # # CREATE
  # 
  # # READ
  # get("/close_votes", { :controller => "close_votes", :action => "index" })
  # 
  # # UPDATE 
  # post("/modify_close_vote/:path_id", { :controller => "close_votes", :action => "update" }) 
  # # DELETE
  # 

  # #------------------------------

  # # Routes for the Like resource:

  # # CREATE
    
  # get("/likes", { :controller => "likes", :action => "index" })

  
  # # UPDATE
  
  # post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  # #------------------------------

  # # Routes for the Story part resource:

  # # CREATE
  # 
          
  # # READ
  # get("/story_parts", { :controller => "story_parts", :action => "index" })
  
  # get("/story_parts/:path_id", { :controller => "story_parts", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_story_part/:path_id", { :controller => "story_parts", :action => "update" })
  
  # # DELETE
  # get("/delete_story_part/:path_id", { :controller => "story_parts", :action => "destroy" })

  # #------------------------------

  # # Routes for the Story resource:

  # #------------------------------

  # # -----------------------------
             
  #------------------------------

end
