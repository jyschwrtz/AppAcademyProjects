# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  u1 = User.create!(username: 'Jay')
  u2 = User.create!(username: 'Matt')
  u3 = User.create!(username: 'Joe')

  a1 = Artwork.create!(title: 'Picture 1', image_url: "test.com" , artist_id: u1.id)
  a2 = Artwork.create!(title: 'Picture 2', image_url: "test2.com" , artist_id: u2.id)
  a3 = Artwork.create!(title: 'Picture 3', image_url: "test3.com" , artist_id: u3.id)

  as1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
  as2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)
  as3 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u2.id)

end
