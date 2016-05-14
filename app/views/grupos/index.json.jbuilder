json.array!(@grupos) do |grupo|
  json.extract! grupo, :id, :nombre, :user_id
  json.url grupo_url(grupo, format: :json)
end
