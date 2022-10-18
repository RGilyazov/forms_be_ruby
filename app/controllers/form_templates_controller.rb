class FormTemplatesController < ApplicationController
  before_action :set_nested

  def index
    formTemplates = FormTemplate.all
    render json: formTemplates, each_serializer: FormTemplateSerializer, root: false, include: '**'
       
  end

  def create
    permitted = params.permit(:form_template, :name,
                              fields_attributes: [:name, :fieldType, { values_attributes: [:value] }])
    @formTemplate = FormTemplate.new(permitted)
    @formTemplate.save!
    render json: @formTemplate
  end

  def update
    permitted = params.permit(:id, :pk, :form_template, :name,
                              fields_attributes: [:name, :fieldType, :id,  :pk, { values_attributes: [:id, :pk, :value, :form_field_id] }])

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
      params.delete(:formTemplate)
      params.delete(:form_template)
      params[:fields_attributes] = params.delete(:fields)
      if params[:fields_attributes]
          params[:fields_attributes].each do |param|
            param[:values_attributes] = param.delete(:values)
          end
      end
  end


end
