User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "男",
             
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "duran",
             genre: "ブルース",
             responsible_part: "ギター",
             image: "default.png")
             
Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 1)
             
             