# require modules here
require 'yaml'

def load_library(path)
  dictionary = { 
    "get_meaning" => {}, 
    "get_emoticon" => {} 
  }
  YAML.load_file(path).each do |meaning, emoticon|
    dictionary["get_meaning"][emoticon[1]] = meaning 
    dictionary["get_emoticon"][emoticon[0]] = emoticon[1] 
  end
  dictionary
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  answer = load_library(path)["get_emoticon"][emoticon]
  answer ? answer : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  answer = load_library(path)["get_meaning"][emoticon]
  answer ? answer : "Sorry, that emoticon was not found"
end