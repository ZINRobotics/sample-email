class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery with: :null_session, only: [:send_email]
  skip_before_action :verify_authenticity_token, only: [:send_email]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def email
    @templates = Template.all
    render 'email/index'
  end

  def send_email
    username = params[:from]
    server = params[:server]
    password = params[:password]
    to_email = params[:to]
    template = Template.find(params[:templateId])

    delivery_options = { user_name: username,
                         password: password,
                         address: server}

    ActionMailer::Base.mail(
        from: username,
        to: to_email,
        subject: "Hello from Sample-Email!",
        body: template.body,
        content_type: "text/html",
        delivery_method_options: delivery_options
    ).deliver
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:body)
    end
end
