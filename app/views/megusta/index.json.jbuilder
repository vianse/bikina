json.array!(@megusta) do |megustum|
  json.extract! megustum, :id, :megusta, :user_id, :grupo_id, :registro_id
  json.url megustum_url(megustum, format: :json)
end
