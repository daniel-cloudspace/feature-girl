module ScenariosHelper

  # returns a color based on the total number of objects that need a color and the index of the current object
  # starts with red, ends with purple
  def get_unique_color(total, index)
    per = index.to_f / total
    if per >= 0 and per <= 0.2
      #start with red
      #raise green
      red = 255
      green = (per/0.2) * 255
      blue = 0
    elsif per > 0.2 and per <= 0.4
      #lower red
      red = 255 - (((per - 0.2)/0.2) * 255)
      green = 255
      blue = 0
    elsif per > 0.4 and per <= 0.6
      #raise blue
      red = 0
      green = 255
      blue = ((per - 0.4)/0.2) * 255
    elsif per > 0.6 and per <= 0.8
      #lower green
      red = 0
      green = 255 - (((per - 0.6)/0.2) * 255)
      blue = 255
    elsif per > 0.8 and per <= 1.0
      #raise red
      red = ((per - 0.8)/0.2) * 255
      green = 0
      blue = 255
    elsif per > 1 or per < 0
      #error condition
      red = 255
      green = 255
      blue = 255
    end
    hex = to_hex(red) + to_hex(green) + to_hex(blue)
    return "##{hex}"
  end

  # converts float or int to hex and zero pads if it is a single hex digit
  def to_hex(input)
    input = input.to_i.to_s(16)
    if input.length == 1
      return '0' + input
    end
    return input
  end
end
