require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file file_path
  new_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |k, v|
    new_hash["get_meaning"][v[1]] = k.to_s
    new_hash["get_emoticon"][v[0]] = v[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  x = load_library(file_path)["get_emoticon"][emoticon]
  if x.nil?
    "Sorry, that emoticon was not found"
  else
    x
  end
end

def get_english_meaning(file_path, emoticon)
  if load_library(file_path)["get_meaning"][emoticon]
    load_library(file_path)["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

# binding.pry
