User.create!(name: "Sample User1",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "男",
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "yui",
             prefecture: "北海道",
             genre: 8,
             responsible_part: "ギター",
             image: File.open("./public/user_images/default.png"))
             

User.create!(name: "Sample User2",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "男",
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "フラフラ",
             prefecture: "北海道",
             genre: 8,
             responsible_part: "ギター",
             image: File.open("./public/user_images/default.png"))
             
User.create!(name: "Sample User3",
             email: "sample3@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "男",
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "あいみょん",
             prefecture: "北海道",
             genre: 8,
             responsible_part: "ギター",)
             #image: File.open("./public/user_images/default.png"))
             
User.create!(name: "Sample User4",
             email: "sample4@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "女",
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "yui",
             prefecture: "北海道",
             genre: 8,
             responsible_part: "ギター",)
             #image: File.open("./public/user_images/default.png"))
             

User.create!(name: "Sample User5",
             email: "sample5@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "女",
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "フラフラ",
             prefecture: "北海道",
             genre: 8,
             responsible_part: "ギター",)
             #image: File.open("./public/user_images/default.png"))
             
User.create!(name: "Sample User6",
             email: "sample6@email.com",
             password: "password",
             password_confirmation: "password",
             age: 20,
             sex: "男",
             purpose_of_use: "音楽好きと繋がりたい",
             favorite_artist: "あいみょん",
             prefecture: "北海道",
             genre: 8,
             responsible_part: "ギター",)
             #image: File.open("./public/user_images/default.png"))

             

             
Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 1)
             
Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 2)
             
Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 3)

Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 4)
             
Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 5)
             
Post.create!(title: "メンバー募集",
             content: "ギター探してます",
             user_id: 6)
             