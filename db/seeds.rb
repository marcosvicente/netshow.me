User.create(email: 'user1@email.com', password: 'initial123')
User.create(email: 'user2@email.com', password: 'initial123')

for i in 0..100

  @view = View.create(count: 0)
  Video.create(name: Faker::Company.name,
               url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8",
               view_id: @view.id, 
               user_id: User.last.id
              )

  Video.create(name: Faker::Company.name,
               url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8",
               view_id: @view.id, 
               user_id: User.first.id
              )

end
