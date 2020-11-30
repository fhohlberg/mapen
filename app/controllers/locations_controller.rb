class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /locations
  # GET /locations.json
  def index
    
    @locations = Location.all
    @conections = Conection.all
    cont =  @locations.length()

    @geojson = Array.new

    @locations.each do |location|
      if location.latitude
        #puts location.address
        cont -= 1
      end

      info = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [location.longitude, location.latitude]
        },
        properties: {
          sistema: location.sistema, 
          subsistema: location.subsistema, 
          propietario: location.propietario, 
          rut: location.rut, 
          nombre_central: location.nombre_central, 
          estado: location.estado, 
          fecha_puesta_servicio_central: location.fecha_puesta_servicio_central, 
          address: location.address, 
          clasificacion: location.clasificacion, 
          tipo_energia: location.tipo_energia, 
          potencia_bruta_mw: location.potencia_bruta_mw, 
          potencia_neta_mw: location.potencia_neta_mw, 
          medio_generacion: location.medio_generacion, 
          distribuidora: location.distribuidora, 
          punto_conexion: location.punto_conexion, 
          combustible: location.combustible, 
          consumo: location.consumo, 
          unidad_consumo: location.unidad_consumo,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
      if location.sistema.nil?
        info[:properties]['marker-size'] = 'small'
        info[:properties]['marker-symbol'] = 'p'
      end

      if location.tipo_energia == "Solar"
        info[:properties]['marker-color'] = '#fff947'
      elsif location.tipo_energia == "Petróleo Diesel"
        info[:properties]['marker-color'] = '#24291b'
      elsif location.tipo_energia == "Eólica"
        info[:properties]['marker-color'] = '#b1ff87'
      elsif location.tipo_energia == "Hidráulica Pasada"
        info[:properties]['marker-color'] = '#104c7a'
      elsif location.tipo_energia == "Mini Hidráulica Pasada"
        info[:properties]['marker-color'] = '#104c7a'
      elsif location.tipo_energia == "Biogas"
        info[:properties]['marker-color'] = '#73777a'
      elsif location.tipo_energia == "Biomasa"
        info[:properties]['marker-color'] = '#cfbb82'
      elsif location.tipo_energia == "Biomasa-Petróleo N°6"
        info[:properties]['marker-color'] = '#a09dd4'
      elsif location.tipo_energia == "Geotérmica"
        info[:properties]['marker-color'] = '#e8af10'
      end
      @geojson << info
    end

    cont2 = 0
    cont3 = 0

    @list_conections = Array.new
    @conections.each do |con|
      if !(@list_conections.include?(con.address))
        @list_conections.push(con.address)
        #puts "Agregando" + con.address + " a las conexiones"
        info = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [con.longitude, con.latitude]
          },
          properties: {
            conection: "Conexion",
            punto_conexion: con.punto_conexion, 
            centrales: [con.nombre_central],
            sistema: con.sistema, 
            subsistema: con.subsistema, 
            potencia_neta_mw_total: con.potencia_neta_mw.sub(",",".").to_f,
            :'marker-color' => '#00607d',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'large'
          }
        }
        @geojson << info
      else
        @geojson.each do |inf| 
          if inf[:properties][:punto_conexion] == con.punto_conexion && inf[:properties][:conection].present?
            #puts "Agregando" + con.nombre_central + " a las conexion " + inf[:properties][:punto_conexion]
            inf[:properties][:centrales].push(con.nombre_central)
            inf[:properties][:potencia_neta_mw_total] += con.potencia_neta_mw.sub(",",".").to_f
          end
        end
      end
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
      format.js
    end
  end


  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:comuna, :region, :latitude, :longitude, :tipo_energia, :medio_generacion, :potencia_neta_mw)
    end

end
