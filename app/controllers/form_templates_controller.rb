class FormTemplatesController < ApplicationController
  before_action :set_nested

  def index
    @formTemplates = FormTemplate.all
    render json: @formTemplates
  end

  def create
    permitted = params.permit(:form_template, :name,
                              fields_attributes: [:name, :fieldType, { values_attributes: [:value] }])
    @formTemplate = FormTemplate.new(permitted)
    @formTemplate.save!
    render json: @formTemplate
  end

  def update
    permitted = params.permit(:id, :form_template, :name,
                              fields_attributes: [:name, :fieldType, :id, { values_attributes: %i[id value] }])

    @formTemplate = FormTemplate.find(params[:id])
    @formTemplate.update!(
      permitted
    )
    render json: @formTemplate
  end

  def destroy
    @formTemplate = FormTemplate.find(params[:id])
    @formTemplate.destroy
    render json: @formTemplate
  end

  private

  def set_nested
      params[:fields_attributes] = params.delete(:fields)
      params[:fields_attributes].each do |param|
      param[:values_attributes] = param.delete(:values)
    end
  end
end
