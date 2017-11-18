class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    #@figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    #@figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    #@figure.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    @figure.save
    redirect :"/landmarks/#{@figure.id}"
  end
end
