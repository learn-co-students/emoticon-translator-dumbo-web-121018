# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  # code goes here
  translator = { # hash key should point to the inner hashes
    "get_meaning" => {}, # keys inside should be japanese emojis =>  points to their meaning
    "get_emoticon" => {} # the emoticon keys(english version) => points to japanese equivalents
  }
  YAML.load_file(file_path).each do |meaning, array|
    translator["get_meaning"][array[1]] = meaning #japanese emojis: meaning
    translator["get_emoticon"][array[0]] = array[1] #english emojis: japanese emojis
  end
  translator
end

def get_japanese_emoticon(file_path, emoticon) #cleanest way i could come up with
  # code goes here
  output = load_library(file_path)["get_emoticon"][emoticon]
  output ? output : "Sorry, that emoticon was not found"
end

# def get_japanese_emoticon(file_path, emoticon) # my first attempt
#   # code goes here
#   load_library(file_path)["get_emoticon"].each do |eng_emoji, jap_emoji|
#     if eng_emoji == emoticon
#       return jap_emoji
#     end
#   end
#   "Sorry, that emoticon was not found"
# end

def get_english_meaning(file_path, emoticon)
  # code goes here
  output = load_library(file_path)["get_meaning"][emoticon]
  output ? output : "Sorry, that emoticon was not found"
end

# load_library(file_path)["get_meaning"].each do |jap_emoji, word|
#   if jap_emoji == emoticon
#     return word
#   end
# end
# "Sorry, that emoticon was not found"
