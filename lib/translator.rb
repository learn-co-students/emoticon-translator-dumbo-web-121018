# require modules here
require "yaml"


def load_library(yaml)
  yaml = YAML.load_file('lib/emoticons.yml')
  emote_library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  yaml.each do |name_keys, emoticons_hash|
    emote_library["get_meaning"].merge!({emoticons_hash[1] => name_keys})
    emote_library["get_emoticon"].merge!({emoticons_hash[0] => emoticons_hash[1]})
  end
  emote_library
end

def get_japanese_emoticon(yaml, emoticon)
  emote_library = load_library(yaml)
  if emote_library["get_emoticon"][emoticon]
    emote_library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml, emoticon)
  emote_library = load_library(yaml)
  if emote_library["get_meaning"][emoticon]
    emote_library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
