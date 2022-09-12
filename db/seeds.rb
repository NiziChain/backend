author = Author.find_or_create_by(id: 1, name: "akira", address: "addressssss")

original1 = Original.find_or_create_by(id: 1, author_id: 1, content_id: 123, title: "ドラえもん", description: "みんな大好き")

secondary1 = Secondary.find_or_create_by(id: 1, author_id: 1, original_id: 1, content_id: 456, title: "ドラえもどき", description: "みんな大嫌い")

original1 = Original.find_or_create_by(id: 2, author_id: 1, content_id: 789, title: "クレヨンしんちゃん", description: "みんな知ってる")

secondary1 = Secondary.find_or_create_by(id: 2, author_id: 1, original_id: 2, content_id: 1011, title: "シャーペンしんちゃん", description: "みんな知らない")

puts "Finished"