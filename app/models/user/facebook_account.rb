class User::FacebookAccount < User::LoginAccount
  def assign_account_info(auth_hash)
    self.remote_account_id = auth_hash['uid']
    self.info = auth_hash['info']
    self.login = auth_hash['info']['nickname']
    self.name = auth_hash['info']['name']
    self.email = auth_hash['info']['email']
    self.access_token = auth_hash['credentials']['token']
  end

  def populate_user_info(user)
    user.name = user.name.presence || name
    user.nickname = user.nickname.presence || nickname
    user.email = user.email.presence || email
    user.save
  end
end

