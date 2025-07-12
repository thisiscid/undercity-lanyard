# Undercity eink lanyard

#####  forked from [phtallos version](https://github.com/phthallo/undercity-lanyard) (and thereby [spc's original version](https://github.com/espcaa/undercity-lanyard/)), many thanks

## How to flash it

__Note : only works on macos :/__

1. Clone the repo
    ```bash
    git clone https://github.com/thisiscid/undercity-lanyard
    ```

2. You need anaconda, imagemagick installed & arduino-cli. Install anaconda using this [link](https://www.anaconda.com/docs/getting-started/anaconda/install#macos-linux-installation)
    ```bash
    # arduino cli
    brew install arduino-cli

    ```

3. Install dependencies
    The script requires a few dependencies for arduino-cli. Here are the steps I took:
    ardu
    ```bash
    arduino-cli config init # not necessary if you have already used arduino-cli prior
    arduino-cli config add board_manager.additional_urls https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json
    arduino-cli core update-index
    arduino-cli lib install "Adafruit NeoPixel"
    ```

4. Just run the script
    ```bash
    chmod +x upload.sh
    ./upload.sh
    ```
5. Follow the instructions and yay!

## Wooo

<img alt="image" src="https://hc-cdn.hel1.your-objectstorage.com/s/v3/d740bdf6083d57b0bddd66e4ca854c5cc8a60c62_img_5046.jpeg" />

