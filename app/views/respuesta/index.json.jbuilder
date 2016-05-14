json.array!(@respuesta) do |respuestum|
  json.extract! respuestum, :id, :respuesta, :comentario_id, :user_id, :grupo_id, :registro_id
  json.url respuestum_url(respuestum, format: :json)
end
