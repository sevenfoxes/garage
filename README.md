# garage

raspberry pi code for monitoring and controlling my garage door.

## Future me

I used this to setup the wifi: [link to wifi setup](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-3-network-setup/setting-up-wifi-with-occidentalis)

This is a good diagram for the pins: [link to raspberry pi pinout](https://pinout.xyz/). So this really bit me in the ass, in the config, you need to put the BCM number of the pin, not the physical one. However, if you want to test a pin, wiring pi wants the wiring pi number. Any pins that you want to use have to be exported in the gpio_init.sh script.
