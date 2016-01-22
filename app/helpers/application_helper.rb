module ApplicationHelper
  def flash_class(flash_type)
    case flash_type
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-error"
    end
  end

  def decimalize(integer)
    return "0.00" if integer == 0
    integer.to_s[0..-3] + "." + integer.to_s[-2..-1]
  end

  def decimal_to_int(string)
    temp = string.gsub("$","")
    if temp[-2] == "."
      result = (temp.gsub(".", "") + "0").to_i
    elsif temp.include?(".")
      result = temp.gsub(".", "").to_i
    else
      result = (temp.gsub(".", "") + "00").to_i
    end
    result
  end

  def amount_calculator(amount, ssi_check, subtract_num)
    temp = decimal_to_int(amount.to_s)
    deduction = temp - decimal_to_int(subtract_num.to_s)
    deduction = 0 if deduction < 0
    result = deduction / 2
    result = 0 if result < 0
    temp = decimal_to_int(ssi_check.to_s) - result
    temp = 0 if temp < 0
    decimalize(temp)
  end
end
