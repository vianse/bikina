json.array!(@registros) do |registro|
  json.extract! registro, :id, :titulo, :descripcion, :direccion, :telefono1, :telefono2, :telefono3, :correo, :sitioweb, :logo, :categoria, :user_id
  json.url registro_url(registro, format: :json)
end
