class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @sidebar = false
    @navbar = true
  end

  def dashboard
    @bank_accounts = BankAccount.all
    @balances = Balance.sumar_balance(current_user)
    @recent = Movement.recent_transactions(current_user)
    @favorites = FavoriteRecipientAccount.list_favorites(current_user)
    @banks = BankAccount.show_all_banks(current_user)
    @sidebar = true
    @navbar = false
  end

  def _sidebar
    @banks = BankAccount.show_all_banks(current_user)
  end

end
