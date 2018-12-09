require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  get_emoticon = {}#get emoticon to point to inner hash
  get_meaning = {}
  YAML.load_file(path).each do |var_one, var_two|
    get_meaning[var_two[1]] = var_one
    get_emoticon[var_two[0]] = var_two[1]
  end
  result = {}
  result["get_meaning"] = get_meaning
  result["get_emoticon"] = get_emoticon
  result
end

def get_japanese_emoticon(path, emo)
  # code goes here
  library = load_library(path)
  library['get_emoticon'][emo] ? library['get_emoticon'][emo] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emo)
  # code goes here
  library = load_library(path)
  library['get_meaning'][emo] ? library['get_meaning'][emo] : "Sorry, that emoticon was not found"
end