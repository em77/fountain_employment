module ListingsHelper
  def zero_wage_handler(wage)
    if wage.to_f == 0
      "N/A"
    else
      decimalize(wage)
    end
  end
end
