class PublicController < ApplicationController


  layout 'standard'


  before_action :get_users

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_parameters)

    if @user.save
      respond_to do |format|
        format.html {redirect_to :action => 'index'}
        format.js
       end
      flash[:notice] = 'user created successfully'
    else
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  def get_json

    @test = view_context.get_rest(params[:photoset_id])
    render :text => @test.to_json
  end

  private

  def get_users
    @user_list = User.sorted
  end


  private

  def user_parameters

    params.require(:user).permit(
        :mobile_number,
        :first_name,
        :last_name,
        :email,
        :admin_user,
        :password,
        :password_confirmation
    )


  end

end
