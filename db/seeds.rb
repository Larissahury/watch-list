# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'net/http'
require 'json'

Movie.destroy_all

def rated_dataset
  movies = RestClient.get('https://api.themoviedb.org/3/movie/top_rated?api_key=85f99553a56b9298bb1c8bdd237593c2&language=en-US&page=1')
  movies_array = JSON.parse(movies)['results']
  movies_array.each do |s|
    Movie.create(title: s['title'], overview: s['overview'], poster_url: s['poster_path'], rating: s['vote_average'])
  end
end

rated_dataset()

# class GetRequester
#   def initialize(url)
#     @url = url
#   end

#   def get_response_body
#     url = URI.parse(@url)
#     resp = NET::HTTP.get_response(url)
#     JSON.parse(resp.body)
#   end
# end

# top_rated_response = GetRequester.new(top_rated_api)
# top_rated = top_rated_response.get_response_body

# top_rated['results'].each do |movie|
#   movie_title = movie['title']
#   movie_image = movie['poster_path']
#   movie_overview = movie['overview']
#   Movie.create(title: movie_title, image: "#{img_url}"+movie_image, overview: movie_overview, category: 'popular')
# end
