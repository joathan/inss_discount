# frozen_string_literal: true

# Path: app/controllers/proponents_controller.rb
class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[show edit update destroy]

  def index
    @proponents = Proponent.order(:name)
                           .page(params[:page])
                           .per(5)

    @salary_distribution = Proponent.salary_distribution
  end

  def show; end

  def new
    @proponent = Proponent.new
    @proponent.contacts.build
  end

  def edit; end

  def create
    @proponent = Proponent.new(proponent_params)

    respond_to do |format|
      if @proponent.save
        format.html { redirect_to proponent_url(@proponent), notice: 'Proponent was successfully created.' }
        format.json { render :show, status: :created, location: @proponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proponent.update(proponent_params.except(:salary, :inss_discount))
        UpdateProponentJob.perform_later(@proponent.id, proponent_params[:salary], proponent_params[:inss_discount])

        format.html { redirect_to proponent_url(@proponent), notice: 'Proponent was successfully updated.' }
        format.json { render :show, status: :ok, location: @proponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proponent.destroy!

    respond_to do |format|
      format.html { redirect_to proponents_url, notice: 'Proponent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  def proponent_params
    params.require(:proponent)
          .permit(:name, :cpf, :salary, :inss_discount, address: {}, contacts_attributes: %i[id phone kind
                                                                                             _destroy])
  end
end
