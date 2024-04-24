module Import
  class CsvImport
    require "csv"

    def call(file)
      f = File.open(file)
      CSV.foreach(f, headers: true, col_sep: ";") do |row|
        reservation_params = {}
        reservation_params[:num_billet] = row["Numero billet"]
        reservation_params[:num_reserv] = row["Reservation"]
        reservation_params[:date] = convert(row["Date reservation"])
        reservation_params[:hour] = row["Heure reservation"]
        reservation_params[:show_key] = row["Cle spectacle"]
        reservation_params[:show] = row["Spectacle"]
        reservation_params[:represent_key] = row["Cle representation"]
        reservation_params[:represent] = row["Representation"]
        reservation_params[:represent_date] = convert(row["Date representation"])
        reservation_params[:represent_hour] = row["Heure representation"]
        reservation_params[:represent_end_date] = convert(row["Date fin representation"])
        reservation_params[:represent_end_hour] = row["Heure fin representation"]
        reservation_params[:price] = row["Prix"]
        reservation_params[:product_type] = row["Type de produit"]
        reservation_params[:sales_channel] = row["Filiere de vente"]
        reservation_params[:lastname] = row["Nom"]
        reservation_params[:firstname] = row["Prenom"]
        reservation_params[:email] = row["Email"]
        reservation_params[:adress] = row["Adresse"]
        reservation_params[:pcode] = row["Code postal"]
        reservation_params[:country] = row["Pays"]
        reservation_params[:age] = row["Age"]
        reservation_params[:gender] = row["Sexe"]

        Reservation.create(reservation_params)
      end
    end

    def customcall(params)
      f = File.open(params[:file])
      CSV.foreach(f, headers: true, col_sep: ";") do |row|
        reservation_params = {}
        reservation_params[:num_billet] = row[params[:num_billet]]
        reservation_params[:num_reserv] = row[params[:num_reserv]]
        reservation_params[:date] = convert(row[params[:date]])
        reservation_params[:hour] = row[params[:hour]]
        reservation_params[:show_key] = row[params[:show_key]]
        reservation_params[:show] = row[params[:show]]
        reservation_params[:represent_key] = row[params[:represent_key]]
        reservation_params[:represent] = row[params[:represent]]
        reservation_params[:represent_date] = convert(row[params[:represent_date]])
        reservation_params[:represent_hour] = row[params[:represent_hour]]
        reservation_params[:represent_end_date] = convert(row[params[:represent_end_date]])
        reservation_params[:represent_end_hour] = row[params[:represent_end_hour]]
        reservation_params[:price] = row[params[:price]]
        reservation_params[:product_type] = row[params[:product_type]]
        reservation_params[:sales_channel] = row[params[:sales_channel]]
        reservation_params[:lastname] = row[params[:lastname]]
        reservation_params[:firstname] = row[params[:firstname]]
        reservation_params[:email] = row[params[:email]]
        reservation_params[:adress] = row[params[:adress]]
        reservation_params[:pcode] = row[params[:pcode]]
        reservation_params[:country] = row[params[:country]]
        reservation_params[:age] = row[params[:age]]
        reservation_params[:gender] = row[params[:gender]]

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
