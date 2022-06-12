(1..3).each do |i|
  User.create!(
    user_id: "user#{i}",
    password_hash: Digest::SHA256.hexdigest("pass#{i}")
  )
end

user = User.first
(1..3).each do |i|
  user.photos.create!(
    title: "サンプル写真#{i}",
    image_path: "uploads/sample#{i}.png"
  )
end
