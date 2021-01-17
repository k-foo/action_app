module LogInSupport
  # ログインを前提とする結合コードにて使用するため
  def log_in(user)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq "/objectives.#{user.id}"
  end
end
