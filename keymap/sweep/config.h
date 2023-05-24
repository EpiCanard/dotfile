/*
Copyright 2020 Pierre Chevalier <pierrechevalier83@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

// Mouse config - Constant speed
#define MK_3_SPEED
#define MK_MOMENTARY_ACCEL

#define MK_C_OFFSET_UNMOD 8
#define MK_C_INTERVAL_UNMOD 16

// Pick good defaults for enabling homerow modifiers
#define TAPPING_TERM 400
#define PERMISSIVE_HOLD
#define IGNORE_MOD_TAP_INTERRUPT
#define QUICK_TAP_TERM 0

// === CUSOM KEYCODES ===
// Toggle layer 1
#define LT1_ESC LT(1, KC_ESC)
#define LT1_ENT LT(1, KC_ENT)

// Toggle layer 2
#define LT2_F LT(2, FR_F)
#define LT2_J LT(2, FR_J)

// Toggle layer 3
#define LT3_V LT(3, FR_V)

// Left hand mod row
#define SFT_A   LSFT_T(FR_A)
#define GUI_S   LGUI_T(FR_S)
#define ALT_D   LALT_T(FR_D)
#define CTL_Q   LCTL_T(FR_Q)

// Right hand mod row
#define SFT_COL LSFT_T(FR_COLN)
#define SFT_PLS LSFT_T(FR_PLUS)
#define GUI_L   LGUI_T(FR_L)
#define ALT_K   LALT_T(FR_K)
#define CTL_P   LCTL_T(FR_P)

#define CSG_NO C(S(G(KC_NO)))
#define IGNORE_MOD_TAP_INTERRUPT
// RGB
#undef RGB_DI_PIN
#define RGB_DI_PIN 25
#undef RGBLED_NUM
#define RGBLED_NUM 2
#undef RGBLED_SPLIT
#define RGBLED_SPLIT {1, 1}

#define SPLIT_LED_STATE_ENABLE
#define SPLIT_LAYER_STATE_ENABLE
