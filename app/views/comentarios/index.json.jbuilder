json.array!(@comentarios) do |comentario|
  json.extract! comentario, :id, :comentario, :user_id, :grupo_id, :registro_id
  json.url comentario_url(comentario, format: :json)
end
