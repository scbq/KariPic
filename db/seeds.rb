require 'faker'

# Helper para cargar archivos desde app/assets/images
def image_file(filename)
  File.open(Rails.root.join("app/assets/images/#{filename}"))
end

# Crear un usuario con el rol de Karina solo si no existe
karina = User.find_or_initialize_by(email: "karina@example.com")
karina.name = "Karina"
karina.password = "password"
karina.password_confirmation = "password"
karina.role = :karina
karina.save!

# Adjuntar la foto de perfil de Karina
karina.profile_photo.attach(io: image_file("karina_photo.jpg"), filename: "karina_photo.jpg") if karina.profile_photo.attachment.nil?

# Crear otros usuarios y comentarios
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,  # Usamos `unique` para evitar duplicados
    password: "password",
    password_confirmation: "password",
    role: :user
  )
  user.profile_photo.attach(io: image_file("default_user_photo.jpg"), filename: "user_photo.jpg")

  # Crear fotos para Karina
  3.times do
    photo = karina.photos.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph
    )
    photo.image.attach(io: image_file("sample_photo.jpg"), filename: "sample_photo.jpg")

    # Crear comentarios para cada foto
    2.times do
      photo.comments.create!(
        content: Faker::Lorem.sentence,
        user: user
      )
    end
  end
end
