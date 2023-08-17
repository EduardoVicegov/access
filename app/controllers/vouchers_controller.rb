class VouchersController < ApplicationController
        before_action :authenticate_user!
        before_action :set_voucher, only: [:show, :edit, :update, :destroy]
      
        def index
          @vouchers = Voucher.all.page(params[:page])   
        end
      
        def show
        end
      
        def new
          @voucher = Voucher.new
        end
      
        def create
          @voucher = Voucher.new(voucher_params)
          if @voucher.save
            redirect_to @voucher, notice: 'Voucher was successfully created.'
          else
            render :new
          end
        end
      
        def edit
        end
      
        def update
          if @voucher.update(voucher_params)
            redirect_to @voucher, notice: 'Voucher was successfully updated.'
          else
            render :edit
          end
        end
      
        def destroy
          @voucher.destroy
          redirect_to vouchers_url, notice: 'Voucher was successfully destroyed.'
        end
      
        private
      
        def set_voucher
          @voucher = Voucher.find(params[:id])
        end
      
        def voucher_params
          params.require(:voucher).permit(:user_name, :token, :status)
        end
end
