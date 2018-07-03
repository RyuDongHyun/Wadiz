# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# boxoffice.json에 있는 영화정보를 불러와서
# Movie 데이터 테이블에 넣어준다.



file = File.read('./db/boxoffice.json')
data = JSON.parse(file)

list = data["cards"]
movies = Array.new
list.each do |elem|
    movies.push(
            Movie.create(
            title: elem["items"][0]["item"]["title"],
            genre: elem["items"][0]["item"]["main_genre"],
            rate: elem["items"][0]["item"]["filmrate"],
            director: elem["items"][0]["item"]["directors"][0]["name"],
            poster: elem["items"][0]["item"]["poster"]["medium"]
        )   
    )
end

# Movie.create(
#     title: data["cards"][0]["items"][0]["item"]["title"],
#     genre: data["cards"][0]["items"][0]["item"]["main_genre"],
#     rate: data["cards"][0]["items"][0]["item"]["filmrate"],
#     director: data["cards"][0]["items"][0]["item"]["directors"][0]["name"],
#     poster: data["cards"][0]["items"][0]["item"]["poster"]
# )