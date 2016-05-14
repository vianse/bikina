json.array!(@perfils) do |perfil|
  json.extract! perfil, :id, :nombre, :cp, :colonio, :user_id
  json.url perfil_url(perfil, format: :json)
end
