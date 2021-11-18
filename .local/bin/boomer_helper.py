#!/usr/bin/env python3
# Script to grab text and search for it's meaning on Urban Dictionary
import json
import os
import requests


search_word = os.popen('xsel').read()
if " " in search_word:
    search_word_list = list(search_word.split(" "))
    search_word = "%20".join(search_word_list)
r = requests.get(f'https://api.urbandictionary.com/v0/define?term={search_word.lower()}')
print(json.dumps(r.json(), indent=2))
