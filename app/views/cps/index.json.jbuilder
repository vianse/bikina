json.array!(@cps) do |cp|
  json.extract! cp, :id, :codigo, :asentamiento, :tipoAsentamiento, :municipio, :estado
  json.url cp_url(cp, format: :json)
end
