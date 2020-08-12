## Haskell School of Music

A collection of exercises from reading [The Haskell School of Music](https://www.amazon.com/Haskell-School-Music-Signals-Symphonies/dp/1108416756/).

<hr>

### Setup

The two required components are the Euterpea library and a MIDI synthesizer. The HSoM library is optional. Below are my setup notes for macOS Catalina as of May 2020, following the [official instructions for Euterpea and HSoM](http://euterpea.com/download-and-installation/).

For reasons unclear, Euterpea didn't work with Haskell Platform 8.6.5 (installed using ghcup). Reverting to 8.6.3 and following the official instructions worked well.

- Cabal 2.4.1.0
- GHCI 8.6.3
- Euterpea 2.0.7
- HSoM 1.0.0

For the MIDI synthesizer, I chose [FluidSynth](http://www.fluidsynth.org/).

- FluidSynth 2.1.3

`brew install fluidsynth` 


The synthesizer requires a "sound font". I used [this link for FluidR3 GM](https://packages.debian.org/sid/sound/fluid-soundfont-gm) and put it in `/Library/Audio/Sounds/Banks/`.

The sound font needs to be loaded each time FluidSynth is started (or specified as a command-line argument). I setup a shell alias for convenience:

`alias fsynth='fluidsynth /Library/Audio/Sounds/Banks/FluidR3_GM.sf2'`


<hr>

### References

[Euterpea Quick Reference, 2016](http://euterpea.com/wp-content/uploads/2016/12/Euterpea_Quick_Reference.pdf)

<br>
