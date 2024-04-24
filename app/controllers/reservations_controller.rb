class ReservationsController < ApplicationController
  include Import
  def index
    @reservations = Reservation.all
  end

  def new_search
  end

  def search
    return redirect_to reservations_url, notice: "Aucun résultat." if params[:query].blank?
    @reservations = Reservation.where("show LIKE ?", "%"+ params[:query] +"%")
    if @reservations.any?
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    else
      redirect_to reservations_url, notice: "Aucun résultat."
    end
  end

  def new
  end

  def create
    if params[:reservation]&.[](:custom)
      return redirect_to new_reservation_url, alert: "Aucun fichier." if params[:reservation][:file].nil?
      return redirect_to new_reservation_url, alert: "Seulement les fichiers CSV sont autorisés." unless params[:reservation][:file].content_type == "text/csv"
      CsvImport.new.customcall(reservation_params)
    else
      return redirect_to new_reservation_url, alert: "Aucun fichier." if params[:file].nil?
      return redirect_to new_reservation_url, alert: "Seulement les fichiers CSV sont autorisés." unless params[:file].content_type == "text/csv"
      CsvImport.new.call(params[:file])
    end
    redirect_to new_reservation_url, notice: "Données importées."
  end

  def custom
    @reservation = Reservation.new
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:file, :num_billet, :num_reserv, :date, :hour, :show_key, :show, :represent_key, :represent, :represent_date, :represent_hour, :represent_end_date, :represent_end_hour, :price, :product_type, :sales_channel, :lastname, :firstname, :email, :adress, :pcode, :country, :age, :gender)
  end
end
