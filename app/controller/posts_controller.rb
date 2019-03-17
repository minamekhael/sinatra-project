class PostsController < ApplicationController

# task index
  get '/posts' do
    @posts = Post.find_by_id(params[:id])
    erb :'users/show'
  end

    get '/posts/new' do
      if !logged_in?
        redirect "/login"
      else
      @error_message = params[:error]
      @posts = Post.all
      erb :'posts/new'
    end
  end

# edit tasks
    get "/posts/:id/edit" do
      if !logged_in?
        redirect "/login"
     else @error_message = params[:error]
      @post = Post.find(params[:id])
      @posts = Post.all
      erb :'posts/edit'
    end
  end

    post "/posts/:id" do
      if !logged_in?
        redirect "/login"
     else @post = Post.find(params[:id])
      unless Post.valid_params?(params)
        redirect "/posts/#{@post.id}/edit?error=invalid task"
      end
      @post.update(params.select{|k|k=="name"})
      redirect "/posts/#{@post.id}"
    end
  end

# show tasks
  get '/posts/:id' do
    if !logged_in?
      redirect "/login"
    @post = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

    post "/posts" do
      if !logged_in?
        redirect "/login"
      unless Post.valid_params?(params)
        redirect "/posts/new?error=invalid task"
      end
      Post.create(params)
      redirect "/posts"
    end
  end

# delete tasks
    get '/posts/:id' do 
      @post = Post.find_by_id(params[:id])
      erb :'/posts/edit'
    end
  
    delete '/posts/:id' do 
      @post = Post.find_by_id(params[:id])
      @post.destroy
      redirect '/posts'
    end
  end
end