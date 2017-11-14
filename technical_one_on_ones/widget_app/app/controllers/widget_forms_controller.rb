class WidgetFormsController < ApplicationController
  before_action :set_widget_form, only: [:show, :edit, :update, :destroy]

  # GET /widget_forms
  # GET /widget_forms.json
  def index
    @widget_forms = WidgetForm.all
  end

  # GET /widget_forms/1
  # GET /widget_forms/1.json
  def show
  end

  # GET /widget_forms/new
  def new
    @widget_form = WidgetForm.new
  end

  # GET /widget_forms/1/edit
  def edit
  end

  # POST /widget_forms
  # POST /widget_forms.json
  def create
    @widget_form = WidgetForm.new(widget_form_params)

    respond_to do |format|
      if @widget_form.save
        format.html { redirect_to @widget_form, notice: 'Widget form was successfully created.' }
        format.json { render :show, status: :created, location: @widget_form }
      else
        format.html { render :new }
        format.json { render json: @widget_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widget_forms/1
  # PATCH/PUT /widget_forms/1.json
  def update
    respond_to do |format|
      if @widget_form.update(widget_form_params)
        format.html { redirect_to @widget_form, notice: 'Widget form was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget_form }
      else
        format.html { render :edit }
        format.json { render json: @widget_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widget_forms/1
  # DELETE /widget_forms/1.json
  def destroy
    @widget_form.destroy
    respond_to do |format|
      format.html { redirect_to widget_forms_url, notice: 'Widget form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget_form
      @widget_form = WidgetForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_form_params
      params.fetch(:widget_form, {})
    end
end
