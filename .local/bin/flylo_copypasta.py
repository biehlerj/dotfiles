#!/usr/bin/env python3
import subprocess

name = input("Name to insert: ")
location = input("Location to insert: ")
copypasta = f"""I saw {name} at a grocery store in {location} yesterday. I told him how cool it was to meet him in person, but I didn't want to be a douche and bother him and ask him for photos or anything. He said, “Oh, like you're doing now?” I was taken aback, and all I could say was “Huh?” but he kept cutting me off and going “huh? huh? huh?” and closing his hand shut in front of my face. I walked away and continued with my shopping, and I heard him chuckle as I walked off. When I came to pay for my stuff up front I saw him trying to walk out the doors with like fifteen Milky Ways in his hands without paying. The girl at the counter was very nice about it and professional, and was like “Sir, you need to pay for those first.” At first he kept pretending to be tired and not hear her, but eventually turned back around and brought them to the counter. When she took one of the bars and started scanning it multiple times, he stopped her and told her to scan them each individually “to prevent any electrical infetterence,” and then turned around and winked at me. I don't even think that's a word. After she scanned each bar and put them in a bag and started to say the price, he kept interrupting her by yawning really loudly."""

subprocess.run(
    "xclip -selection clipboard", input=copypasta.encode(), shell=True, check=True
)
print(f"Added the following copypasta to your clipboard:\n{copypasta}")
