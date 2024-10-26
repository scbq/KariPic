Rails.application.routes.draw do
  # Configura Devise para autenticación de usuarios
  devise_for :users

<<<<<<< HEAD
  get "manifest.json", to: "application#manifest"

=======
>>>>>>> 4c1c22b6369f2a38e6d7c2e1ab0c7b58566c1cc9
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :get_sign_out
  end
  

  # Rutas para photos, incluyendo las rutas anidadas para comentarios
  resources :photos do
    resources :comments, only: [:create]  # Solo necesitamos la acción `create` para los comentarios
  end

  # Ruta raíz de la aplicación
  root "photos#index"
end
