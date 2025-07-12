@echo off
echo welcome to undercity broken lanyard upload script

del img.png 2>nul
del img_resized.png 2>nul
del newbadge.bmp 2>nul

set /p name=Please enter your name: 
echo Hello, %name%!
set /p slack_handle=Please enter your slack handle: @
echo Thank you, %slack_handle%! Let's proceed with the upload.
set /p pronouns=any text you want to add?: 
set /p image_url=any image you want to add? (res is broken u know it + .png only + path pliz) : 

if not "%image_url%"=="" (
    copy "%image_url%" img.png
) else (
    echo no img, you're not funni
)

if exist img.png (
    echo Resizing image to 64x64...
    magick img.png -resize 64x64 img_resized.png
) else (
    echo Image not found, skipping resize.
)

for /f "delims=" %%A in ('python get_text_width.py .\font.ttf 25 "%name%"') do set name_width=%%A
set /a pronoun_x=20 + name_width + 20

magick badge.bmp ^
  -font ./font.ttf -pointsize 25 -fill black ^
  -annotate +20+30 "%name%" ^
  -annotate +20+60 "@%slack_handle%" ^
  -pointsize 15 -font ./bankfont.ttf -annotate +%pronoun_x%+30 "%pronouns%" ^
  newbadge.bmp

if exist img_resized.png (
    echo Overlaying image on the badge...
    magick newbadge.bmp img_resized.png -geometry +220+5 -composite newbadge.bmp
)

:: Convert to device format
python bmp_to_array.py newbadge.bmp f.h gImage_img

arduino-cli compile --fqbn rp2040:rp2040:generic_rp2350 --output-dir ./build
if %ERRORLEVEL% neq 0 (
    echo Compilation failed. Please check the code.
    exit /b 1
)
echo Please press the boot button on the device and press enter when plugged in
pause
copy build\undercity-lanyard.ino.uf2 D:\
if %ERRORLEVEL% neq 0 (
    echo Upload failed. Please check the device connection.
    exit /b 1
)
echo Upload successful! The device should now be running the new code.