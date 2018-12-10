# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons.each do | meaning, emotes |
    new_hash['get_meaning'][emotes[1]] = meaning
    new_hash['get_emoticon'][emotes[0]] = emotes[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  out = lib['get_emoticon'][emoticon]
  if out == nil
    out = "Sorry, that emoticon was not found"
  end
  out
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  out = lib['get_meaning'][emoticon]
  if out == nil
    out = "Sorry, that emoticon was not found"
  end
  out
end
