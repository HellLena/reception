class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @applications = {:new => [], :current => [], :finished => []}
    Application.all.each{|application|
      if application.status
        @applications[:finished].push(application)
      elsif application.decision
        @applications[:current].push(application)
      else
        @applications[:new].push(application)
      end
    }
    @appeal_types = AppealType.all.map{|t| {'value' => t.id.to_s, 'text' => t.name} }.to_json
    @decisions = Decision.all.map{|t| {'value' => t.id.to_s, 'text' => t.name} }.to_json
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
    @appeal_types = AppealType.all
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to applications_path, notice: 'Обращение было успешно создано.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(params[:name] => params[:value])
        format.js
        format.json { render :show, status: :ok, location: @application }
      else
        format.js { render status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Обращение было успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:applicant, :appeal_type, :subject, :contacts)
    end
end
