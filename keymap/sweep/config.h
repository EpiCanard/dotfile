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
// Set the mouse settings to a comfortable speed/accuracy trade-off,
// assuming a screen refresh rate of 60 Htz or higher
// The default is 50. This makes the mouse ~3 times faster and more accurate
#define MOUSEKEY_INTERVAL 16
// The default is 20. Since we made the mouse about 3 times faster with the previous setting,
// give it more time to accelerate to max speed to retain precise control over short distances.
#define MOUSEKEY_TIME_TO_MAX 40
// The default is 300. Let's try and make this as low as possible while keeping the cursor responsive
#define MOUSEKEY_DELAY 100
// It makes sense to use the same delay for the mouseweel
#define MOUSEKEY_WHEEL_DELAY 100
// The default is 100
#define MOUSEKEY_WHEEL_INTERVAL 50
// The default is 40
#define MOUSEKEY_WHEEL_TIME_TO_MAX 100

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
#define SFT_ASH LSFT_T(FR_HASH)
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
