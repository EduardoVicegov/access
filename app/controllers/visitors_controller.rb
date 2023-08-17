class VisitorsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_visitor, only: %i[ show edit update destroy ]

  def index
    @q = Visitor.ransack(params[:q])
    @visitors = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new 
    @visitor = Visitor.new
  end  

  def create 
    @visitor = Visitor.new(visitor_params)

    if valid_cpf?(visitor_params[:cpf]) && @visitor.save
      redirect_to @visitor
    else
      @cpf_error = 'CPF inválido!'
      render :new
    end
  end

  def show; end

  def edit; end

  def update 
    @visitor.update(visitor_params)

    if valid_cpf?(visitor_params[:cpf]) && @visitor.save
      redirect_to @visitor
    else
      @cpf_error = 'CPF inválido!'
      render :edit
    end
  end

  def destroy
    @visitor.destroy

    redirect_to visitors_path
  end

  private 

  def valid_cpf?(cpf)
    CPF.valid?(cpf)
  end 

  def visitor_params
    params.require(:visitor).permit(:name, :cpf, :visit_sector, :observation)
  end

  def fetch_visitor
    @visitor = Visitor.find(params[:id]) 
  end
end