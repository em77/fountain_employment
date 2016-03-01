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
    return "" if integer == nil
    num = integer.to_s
    num += "0" if num.size < 2
    num[0..-3] + "." + num[-2..-1]
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

  def monthly_wages_calculator(weekly_hours, wage)
    result = (decimal_to_int(weekly_hours)/100.0) * decimal_to_int(wage) * 4
    result.to_i
  end

  def ssi_amount_calculator(amount, ssi_check, subtract_num)
    temp = amount
    deduction = temp - decimal_to_int(subtract_num.to_s)
    deduction = 0 if deduction < 0
    result = deduction / 2
    result = 0 if result < 0
    temp = decimal_to_int(ssi_check.to_s) - result
    temp = 0 if temp < 0
    temp
  end

  def ssi_calc(weekly_hours, wage, ssi_check, subtract_num)
    result = Array.new
    monthly_wages = monthly_wages_calculator(weekly_hours, wage)
    result[0] = ssi_amount_calculator(monthly_wages,
      ssi_check, subtract_num)
    result[1] = result[0] + monthly_wages
    result[0] = decimalize(result[0])
    result[1] = decimalize(result[1])
    result
  end
end
