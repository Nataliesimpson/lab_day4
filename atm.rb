

accounts = {:account_number => 1, :pin_number => 9, :name => "Joe", :sort_code => [80, 20, 60], :balance => 100, :address => "Bondi Beach, Sydney"}

def deposit(account_hash)
  puts "How much would you like to deposit?"
  print "> £"
  deposit_answer = gets.to_i
  puts " "
  new_balance = account_hash[:balance] + deposit_answer
  puts "Deposit success! Your new balance is £#{new_balance}"
  return new_balance
end

def withdraw(account_hash)
  puts "How much would you like to withdraw?"
  print "> £"
  withdraw_answer = gets.to_i
  puts " "
    if withdraw_answer < account_hash[:balance]
      new_balance = account_hash[:balance] - withdraw_answer
      puts "Withdraw success! Your new balance is £#{new_balance}"
      return new_balance
    else 
      puts "Sorry you have insuffient funds availible!"
      return account_hash[:balance]
    end    
end

def balance(account_hash)
  puts "Your current balance is £#{account_hash[:balance]}"
end

def account_details(account_hash)
  puts "\nYour account details are: \n"
  puts "Acc number: \t#{account_hash[:account_number]}"
  print "Sort code: \t#{account_hash[:sort_code][0]}-#{account_hash[:sort_code][1]}-#{account_hash[:sort_code][2]}"
  puts
  puts "Name: \t\t#{account_hash[:name]}"
  puts "Address: \t#{account_hash[:address]}"
end

def edit_name(account_hash)
  puts "Would you like to change name details? (y/n)"
  name_answer = gets.chomp
  print "> "
  if name_answer == "y"
    puts "What is your new name?"
    new_name_answer = gets.chomp
    puts "Name change succesful!"
    return new_name_answer
  else
  return account_hash[:name]  
end
end

def edit_address(account_hash)
  puts "Would you like to change address details? (y/n)"
  address_answer = gets.chomp
  if address_answer == "y"
    puts "What is your new address?"
    new_address_answer = gets.chomp
    puts "Address change successful!"
    return new_address_answer
  else
    return account_hash[:address]  
  end
end

puts "Please enter your account number"
print "> "
answer = gets.to_i
puts "Please enter your PIN number"
print "> "
pin = gets.to_i

at_atm = true

while (at_atm == true)

  if accounts[:account_number].to_i == answer && accounts[:pin_number].to_i == pin
    puts "\n-Deposit"
    puts "-Withdraw"
    puts "-Balance"
    puts "-Account details"
    puts "-Edit details"
    puts "-Exit\n\n"
    puts "Please enter your selection"
    print "> "
    choice = gets.chomp
    choice.downcase!
    puts " "

    case choice
      when "deposit"
        accounts[:balance] = deposit(accounts)
      when "withdraw"
        accounts[:balance] = withdraw(accounts)
      when "balance"
        balance(accounts)
      when "account details"
        account_details(accounts)
      when "edit details"
        accounts[:name] = edit_name(accounts) 
        accounts[:address] = edit_address(accounts)
      when "exit"
      at_atm = false 
      else
      puts "Sorry incorrect input" 
    end#end of case

  else
      puts "Sorry, your details are invalid"

  end#end of if

end#end of while




