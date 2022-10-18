class FormsController < ApplicationController
   before_action :set_nested

  def index
    @forms = Form.all
    render json: @forms
  end

  def create
    permitted = params.permit(:form_template_id, :name,
                              values_attributes: [:form_field_id, :stringValue, :list_value_id, :numberValue])
    @form = Form.new(permitted)
    @form .save!
    render json:   @form 
  end

 
  private

  def set_nested
     params[:values_attributes] = params.delete(:values)
     params[:form_template_id] = params.delete(:template)
     if params[:values_attributes] 
      params[:values_attributes].each do |param|
            param[:form_field_id] = param.delete(:formField)
            param[:list_value_id] = param.delete(:listValue)
      end
     end
  end
end
