json.array!(@projects) do |project|
  json.extract! project, :id, :company_name, :phone_number, :body, :user_id
  json.url project_url(project, format: :json)
end