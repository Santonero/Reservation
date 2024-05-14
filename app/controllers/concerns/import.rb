module Import
  class CsvImport
    require "csv"

    def call(params)
      col = { num_billet: "Numero billet", num_reserv: "Reservation", date: "Date reservation", hour: "Heure reservation", show_key: "Cle spectacle", show: "Spectacle", represent_key: "Cle representation", represent: "Representation", represent_date: "Date representation", represent_hour: "Heure representation", represent_end_date: "Date fin representation", represent_end_hour: "Heure fin representation", price: "Prix", product_type: "Type de produit", sales_channel: "Filiere de vente", lastname: "Nom", firstname: "Prenom", email: "Email", adress: "Adresse", pcode: "Code postal", country: "Pays", age: "Age", gender: "Sexe" }
      if params.is_a? ActionController::Parameters
        col = params
        f = File.open(params[:file])
      else
        f = File.open(params)
      end
      CSV.foreach(f, headers: true, col_sep: ";") do |row|
        reservation_params = {}
        reservation_params[:num_billet] = row[col[:num_billet]]
        reservation_params[:num_reserv] = row[col[:num_reserv]]
        reservation_params[:date] = convert(row[col[:date]])
        reservation_params[:hour] = row[col[:hour]]
        reservation_params[:show_key] = row[col[:show_key]]
        reservation_params[:show] = row[col[:show]]
        reservation_params[:represent_key] = row[col[:represent_key]]
        reservation_params[:represent] = row[col[:represent]]
        reservation_params[:represent_date] = convert(row[col[:represent_date]])
        reservation_params[:represent_hour] = row[col[:represent_hour]]
        reservation_params[:represent_end_date] = convert(row[col[:represent_end_date]])
        reservation_params[:represent_end_hour] = row[col[:represent_end_hour]]
        reservation_params[:price] = row[col[:price]]
        reservation_params[:product_type] = row[col[:product_type]]
        reservation_params[:sales_channel] = row[col[:sales_channel]]
        reservation_params[:lastname] = row[col[:lastname]]
        reservation_params[:firstname] = row[col[:firstname]]
        reservation_params[:email] = row[col[:email]]
        reservation_params[:adress] = row[col[:adress]]
        reservation_params[:pcode] = row[col[:pcode]]
        reservation_params[:country] = row[col[:country]]
        reservation_params[:age] = row[col[:age]]
        reservation_params[:gender] = row[col[:gender]]

        Reservation.create(reservation_params)
      end
    end

    private

    def convert(d)
      return nil if d.nil?
      Date.strptime(d, "%d/%m/%y")
    end
  end
end
