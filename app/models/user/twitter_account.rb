class User::TwitterAccount < User::LoginAccount
  def assign_account_info(auth_hash)
    self.remote_account_id = auth_hash['uid']
    self.info = auth_hash['info']
    self.name = auth_hash['info']['name']
    self.login = auth_hash['info']['nickname']
    self.access_token = auth_hash['credentials']['token']
    self.access_token_secret = auth_hash['credentials']['secret']
  end
end

