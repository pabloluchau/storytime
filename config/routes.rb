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
  
  # # UPDATE
  
  # post("/modify_story/:path_id", { :controller => "stories", :action => "update" })
  
  # # DELETE
  # get("/delete_story/:path_id", { :controller => "stories", :action => "destroy" })
  
  
  
  
  
  # # Routes for the Close vote resource:

  # # CREATE
  # post("/insert_close_vote", { :controller => "close_votes", :action => "create" })
  # # READ
  # get("/close_votes", { :controller => "close_votes", :action => "index" })
  # get("/close_votes/:path_id", { :controller => "close_votes", :action => "show" }) 
  # # UPDATE 
  # post("/modify_close_vote/:path_id", { :controller => "close_votes", :action => "update" }) 
  # # DELETE
  # get("/delete_close_vote/:path_id", { :controller => "close_votes", :action => "destroy" })

  # #------------------------------

  # # Routes for the Like resource:

  # # CREATE
  # post("/insert_like", { :controller => "likes", :action => "create" })
          
  # # READ
  # get("/likes", { :controller => "likes", :action => "index" })
  
  # get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # # DELETE
  # get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  # #------------------------------

  # # Routes for the Story part resource:

  # # CREATE
  # post("/insert_story_part", { :controller => "story_parts", :action => "create" })
          
  # # READ
  # get("/story_parts", { :controller => "story_parts", :action => "index" })
  
  # get("/story_parts/:path_id", { :controller => "story_parts", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_story_part/:path_id", { :controller => "story_parts", :action => "update" })
  
  # # DELETE
  # get("/delete_story_part/:path_id", { :controller => "story_parts", :action => "destroy" })

  # #------------------------------

  # # Routes for the Story resource:

  # # CREATE
  # post("/insert_story", { :controller => "stories", :action => "create" })
          
  # # READ
  # get("/stories", { :controller => "stories", :action => "index" })
  
  # get("/stories/:path_id", { :controller => "stories", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_story/:path_id", { :controller => "stories", :action => "update" })
  
  # # DELETE
  # get("/delete_story/:path_id", { :controller => "stories", :action => "destroy" })

  # #------------------------------

  # # Routes for the User account:

  # # SIGN UP FORM
  # get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # # CREATE RECORD
  # post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # # EDIT PROFILE FORM        
  # get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # # UPDATE RECORD
  # post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # # DELETE RECORD
  # get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # # ------------------------------

  # # SIGN IN FORM
  # get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # # AUTHENTICATE AND STORE COOKIE
  # post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # # SIGN OUT        
  # get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
