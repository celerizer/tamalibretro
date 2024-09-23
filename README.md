# TamaLIBretro

**TamaLIBretro** is an implementation of the **[TamaLIB](https://github.com/jcrona/tamalib)** Tamagotchi P1 emulation library as a libretro core.

![image](https://github.com/user-attachments/assets/be833627-ec6e-4103-9cd2-6d29e8bfa82b)

## Usage
- Load the libretro core with `tama.b` from the MAME set as content.
  - MD5: `3fce172403c27274e59723bbb9f6d8e9`
- For play instructions, see the [official manual](https://www.bandai.com/amfile/file/download/file/167/product/1276811/).

## Controls
| RetroPad | Tamagotchi |
|-|-|
| Y | A (Select) |
| B | B (Execute) |
| A | C (Cancel) |

## Building
* `git clone https://github.com/celerizer/tamalibretro --recurse-submodules`
* `cd tamalibretro`
* `make`

You can replace the backgrounds and icons in the `images` directory then run `convert.sh` to package them into the core.

## License
TamaLIB and TamaLIBretro are distributed under the GPLv2 license. See the LICENSE file for more information.
