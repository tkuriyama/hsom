## Haskell School of Music

A collection of exercises from reading [The Haskell School of Music](https://www.amazon.com/Haskell-School-Music-Signals-Symphonies/dp/1108416756/).

<hr>

### Setup

The two required components are the Euterpea library and a MIDI synthesizer. The HSoM library is optional. Below are my setup notes for macOS Catalina as of May 2020, following the The [official instructions for Euterpea and HSoM](http://euterpea.com/download-and-installation/).

Euterpea didn't work for unclear reasons with Haskell Platform 8.6.5 installed using ghcup. Reverting to 8.6.3 and following the instructions worked well:

- Cabal 2.4.1.0
- GHCI 8.6.3
- Euterpea 2.0.7
- HSoM 1.0.0

I chose [FluidSynth](http://www.fluidsynth.org/) as the MIDI synthesizer. 

- FluidSynth 2.1.3

The synthesizer requires a "sound font", for which I used [this link for FluidR3 GM](https://packages.debian.org/sid/sound/fluid-soundfont-gm).

A shell alias to start fluidsynth with the sound font file: 

`alias fsynth='fluidsynth /Library/Audio/Sounds/Banks/FluidR3_GM.sf2'`


<br>
