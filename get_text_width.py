import sys
from PIL import ImageFont

font_path = sys.argv[1]
font_size = int(sys.argv[2])
text = sys.argv[3]

font = ImageFont.truetype(font_path, font_size)
width = font.getlength(text)
print(width)