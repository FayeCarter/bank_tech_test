class Transaction

  def date
    Time.now.strftime('%d/%m/%Y')
  end

end