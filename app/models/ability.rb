class Ability
  include CanCan::Ability

  def initialize(user)
    # Define permisos para usuarios no autenticados
    return unless user.present?

    # Permisos para usuarios autenticados
    can :read, Photo # Todos los usuarios pueden leer fotos

    # Permisos especiales solo para Karina
    if user.karina?
      can [:create, :new, :edit, :update, :destroy], Photo
    end
  end
end
