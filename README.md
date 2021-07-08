# ogg-winmm CD Audio Emulator

ogg-winmm is a wrapper of "winmm.dll", which is used by many games and programs to play CD-DA audio tracks.

ogg-winmm emulates the CD-DA audio tracks by reading them from ogg files instead of audio tracks on a CD-ROM.

# Usage:

1. Rip the audio tracks from the CD and encode them to ogg files, following naming convention:
> **Track02.ogg, Track03.ogg, Track04.ogg, ...**

  Note that numbering usually starts from 02 since the first track is a data track on mixed mode CD's.
  
  However some games may use a pure music CD with no data tracks in which case you should start numbering them from "Track01.ogg".

2. Extract the dll file(s) to the game folder where the game's main executable file is located.

3. Create a subfolder called "Music" there and put the ogg files in it. 

4. Run the game and enjoy the emulated CD audio.

# Building:

- Use MinGW 6.3.0-1 or later to build on Windows OS.
- Put libraries in subfolder "libs\"
- Put include files in subfolder "libs\include\"
- Dependencies:
  - libogg (https://github.com/gcp/libogg.git)
  - libvorbis (https://github.com/xiph/vorbis.git)

# Revisions:

v.2021.07.08:
- Implement realtime TMSF report for MCI_STATUS_POSITION.
  Many games use this realtime status to sync up video and audio frame by frame.

v.0.2.0.2 rev3:
- Implemented mciSendCommand MCI_SYSINFO to support Interstate76, HeavyGear and Battlezone2.
- MCI_STATUS_MODE now takes into account the paused state.
- Improved MCI_STATUS_POSITION handling.
- Added Notify message handling to mciSendString.
- Improvements to milliseconds handling. (Battlezone2)
- MCI_STATUS_LENGTH improvements.
- Implemented MCI_TO logic when no MCI_FROM is given.
- Removed the Sleep logic from pause command. (issues with crackling sound when resuming)
- Re-enabled track advance. Fixed track playback and last track logic in play loop.
- Removed forced track repeat. (Notify message should handle track repeat.)

v.0.1.0.1 rev2:
- Fixed an error in the logic which meant in-game music volume sliders were disabled. (winmm.ini now works as a hard override with values 0-99 and 100 means in-game volume adjustment is used)

Based on the original "hifi" release of ogg-winmm with the following changes:

- Win8.1/10 support: stubs.c - taken from "bangstk" fork.
- fix to Make STOP command instant.
- WinQuake support - from Dxwnd source.
- int "numTracks = 1" - to fix issues with last track playback.
- Added ogg music volume control by "winmm.ini" (use a value between 0-100).
- Fix to repeat track instead of advancing to the next track.
- Commented out problematic MCI_CLOSE code.
- Sysinfo return value now "cdaudio" instead of "cd".
- Removed an unnecessary duplicate free buffer command from player.
- Logs now saved to winmm.log instead of winmm.txt.
- MCI_NOTIFY message handling. (fixes Civ2 - Test of time tracks not changing)
- Added make.cmd and renamed source files to "ogg-" instead of "wav-".
- Added rudimentary MCI_PAUSE support.
- Ignore Track00.ogg.
- Accounted for the possibility of pure music cd's.
- MCI send string implementation of aliases.

TODO:
- Try to closer match the excellent cdaudio emulation of DxWnd and it's stand alone [CDAudio proxy.](https://sourceforge.net/projects/cdaudio-proxy/)

