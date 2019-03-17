class PostsController < ApplicationController
  
  get '/posts' do 
    erb :"sessions/posts.html"
  end
  
  get '/posts/new' do 
    if !logged_in?
      redirect "/login"
    else 
      erb :"sessions/posts.html"
    end
  end
  
  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
     if post = current_user.posts.find_by(params[:id])
      "An edit post form #{current_user.id} is editing #{post.id}"
    else 
      redirect '/posts'
      end
    end
  end
end