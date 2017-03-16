class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  before_filter :configure_permitted_parameters

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    if (params[:user][:membership_id] == "1")
      super
    else
      super
=begin
      if resource.save
        @user = resource.id
        @inmobiliarium = Inmobiliaria.new
        @inmobiliarium.name = params[:inmobiliaria][:name_inmo]
        @inmobiliarium.rfc = params[:inmobiliaria][:rfc_inmo]
        @inmobiliarium.phone = params[:inmobiliaria][:phone_inmo]
        @inmobiliarium.phone2 = params[:inmobiliaria][:phone1_inmo]
        @inmobiliarium.save
        @inmobiliaria = Inmobiliaria.order("created_at").last
        sql = "INSERT INTO inmobiliaria_users (`user_id`, `inmobiliaria_id`)VALUES (#{@user.id},#{@inmobiliaria.id})"
        ActiveRecord::Base.connection.execute(sql)
      end

      @inmobiliarium = Inmobiliaria.new
      @inmobiliarium.name = params[:inmobiliaria][:name_inmo]
      @inmobiliarium.rfc = params[:inmobiliaria][:rfc_inmo]
      @inmobiliarium.phone = params[:inmobiliaria][:phone_inmo]
      @inmobiliarium.phone2 = params[:inmobiliaria][:phone1_inmo]
      @inmobiliarium.save
      @user = User.order("created_at").last
      @inmobiliaria = Inmobiliaria.order("created_at").last
      sql = "INSERT INTO inmobiliaria_users (`user_id`, `inmobiliaria_id`)VALUES (#{@user.id},#{@inmobiliaria.id})"
      ActiveRecord::Base.connection.execute(sql)
=end
    end
  end

  # GET /resource/edit
  def edit
    super
    @inmobiliaria = InmobiliariaUsers(resource.id)
  end

  # PUT /resource
  def update
    super
    my_file = params[:user][:image]
    uploader = AvatarUploader.new
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :membership_id, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :gender, :newsletter, :birth_date, :password, :password_confirmation, :image, :email, :description)
    end
  end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
