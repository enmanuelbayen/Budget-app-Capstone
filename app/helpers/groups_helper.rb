module GroupsHelper
  def total_transactions(group)
    total_transactions = 0
    group.purchases.each do |purchase|
      total_transactions += purchase.amount
    end
    total_transactions
  end
end
