class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
  #    @figure.titles << Title.find(id: params["figure"]["title_ids"])
  #  else
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    @figure.titles << Title.find_or_create_by(name: params["title"]["name"])
    @figure.save
    redirect :"/figures/#{@figure.id}"
  end
end
