# Takes string as argument, returns first 5 words then '...'

def make_snippet(string)
  first_five = string.split(" ")
  output = first_five.slice(0,5).join(" ")
  return "#{output}..."
end