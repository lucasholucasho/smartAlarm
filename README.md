smartAlarm
==========
This is a hack that we built at the 2014 AEC Hackathon. It's a "smart alarm clock" that uses lighting to wake up the user more naturally than sound does. Our app uses Lawrence Livermore Berkeley Lab's SmartWindow API to read the brightness level outside the window and resonds appropriately. If it's bright outside, we open the window shade (via said API) and let sunlight wake up the user. If it's dark outside, our app use Philips hue API to turn on the light in a colorloop fashion, which has a similar waking effect as sunlight.
