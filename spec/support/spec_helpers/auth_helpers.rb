module AuthHelpers
  def authWithUser (user)
    request.headers['X-ACCESS-TOKEN'] = "#{user.auth_token}"
  end

  def clearToken
    request.headers['X-ACCESS-TOKEN'] = nil
  end
end
