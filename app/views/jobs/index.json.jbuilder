json.array!(@jobs) do |job|
  json.extract! job, :id, :company, :title, :notes
  json.url job_url(job, format: :json)
end
