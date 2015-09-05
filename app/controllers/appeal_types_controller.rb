class AppealTypesController < ApplicationController
  before_action :set_appeal_type, only: [:update, :destroy]

  # POST /appeal_types
  # POST /appeal_types.json
  def create
    @appeal_type = AppealType.new(appeal_type_params)

    respond_to do |format|
      if @appeal_type.save
        @appeal_types = AppealType.all.map{|t| {'value' => t.id.to_s, 'text' => t.name} }.to_json
        format.js
      else
        format.json { render json: @appeal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appeal_types/1
  # PATCH/PUT /appeal_types/1.json
  def update
    respond_to do |format|
      if @appeal_type.update(params[:name] => params[:value])
        @appeal_types = AppealType.all.map{|t| {'value' => t.id.to_s, 'text' => t.name} }.to_json
        format.js
      else
        format.js { render status: :unprocessable_entity }
        format.json { render json: @appeal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appeal_types/1
  # DELETE /appeal_types/1.json
  def destroy
    @appeal_type.destroy
    respond_to do |format|
      format.html { redirect_to appeal_types_url, notice: 'Обращение было успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appeal_type
      @appeal_type = AppealType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appeal_type_params
      params.require(:appeal_type).permit(:name)
    end
end
