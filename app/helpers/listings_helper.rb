module ListingsHelper
  def decimalize(integer)
    integer.to_s[0..-3] + "." + integer.to_s[-2..-1]
  end
end
