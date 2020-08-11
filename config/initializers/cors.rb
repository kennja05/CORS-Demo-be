# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  
    allow do
    origins ['localhost:3001', 'frosty-bardeen-cd2312.netlify.app']

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end

end
