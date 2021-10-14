class MsApiService
  CONTENT_TYPE = "recipe"
  attr_reader :client

  def initialize
    @client = Contentful::Client.new(
      access_token: Rails.application.credentials.ms_access_token,
      environment: Rails.application.credentials.ms_env_id,
      space: Rails.application.credentials.ms_space_id,
      dynamic_entries: :auto
    )
  end

  def get_recipes
    client.entries(content_type: CONTENT_TYPE)
  end

  def get_recipe(id)
    client.entry(id)
  end
end
