# require modules here
require "yaml"
require 'pry'

def load_library(path)
  hash = YAML.load_file(path)
  new_hash = {}
  
  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}
  
  hash.each do |meaning, emoticon|
    new_hash["get_meaning"][emoticon[1]] = meaning
    new_hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  hash["get_emoticon"].each do |eng, jap|
    
    if emoticon == eng
      return jap
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  hash["get_meaning"].each do |jap, meaning|
    
    if emoticon == jap
      return meaning
    end
  end
  "Sorry, that emoticon was not found"
end


