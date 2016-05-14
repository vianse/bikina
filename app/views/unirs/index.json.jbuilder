json.array!(@unirs) do |unir|
  json.extract! unir, :id, :grupo_id, :user_id
  json.url unir_url(unir, format: :json)
end
