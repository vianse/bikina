json.array!(@fotos) do |foto|
  json.extract! foto, :id, :photo, :user_id, :grupo_id
  json.url foto_url(foto, format: :json)
end
