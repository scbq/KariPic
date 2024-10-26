class Ability
  include CanCan::Ability

  def initialize(user)
    # Define permisos para usuarios no autenticados
    return unless user.present?

    # Permisos para usuarios autenticados
    can :read, Photo # Todos los usuarios pueden leer fotos

    # Permisos especiales solo para Karina
    if user.karina?
<<<<<<< HEAD
      can [:create, :new, :edit, :update, :destroy], Photo
=======
      can :create, Photo
      can :new, Photo
>>>>>>> 4c1c22b6369f2a38e6d7c2e1ab0c7b58566c1cc9
    end
  end
end
