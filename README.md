# TamaLIBretro

Implementation of the TamaLIB Tamagotchi P1 emulator as a libretro core

![image](https://github.com/user-attachments/assets/34db2a6c-39ed-4b28-a160-7ae1138bbfc8)

## Usage
- Load the libretro core with `tama.b` from the MAME set as content.
  - MD5: `3fce172403c27274e59723bbb9f6d8e9`
- For play instructions, see the [official manual](https://www.bandai.com/amfile/file/download/file/167/product/1276811/).

## Controls
| | RetroPad | Tamagotchi |
|-|-|-|
| ![y](https://github.com/user-attachments/assets/4a18efa5-ab53-4617-bcb3-3da92f71b651) | RetroPad Y | A (Select) |
| ![b](https://github.com/user-attachments/assets/70fa7f03-51fe-4677-99a7-e757f4dcbcd1) | RetroPad B | B (Execute) |
| ![a](https://github.com/user-attachments/assets/2ba2ac0e-e122-4c39-844b-4c80833d5593) | RetroPad A | C (Cancel) |

## Building
* `git clone https://github.com/celerizer/tamalibretro --recurse-submodules`
* `cd tamalibretro`
* `make`
