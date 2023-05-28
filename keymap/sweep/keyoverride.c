#include QMK_KEYBOARD_H
#include "keymap_french.h"

#define CS(trigger_key, replacement_key)  &ko_make_basic(MOD_MASK_SHIFT, trigger_key, replacement_key)

// This globally defines all key overrides to be used
const key_override_t **key_overrides = (const key_override_t *[]){
    CS(KC_BSPC, KC_DEL),
    CS(FR_COLN, FR_SCLN),
    CS(FR_QUOT, FR_DQUO),
    CS(FR_BSLS, FR_PIPE),
    CS(FR_COMM, FR_LABK),
    CS(FR_DOT, FR_RABK),
    CS(FR_SLSH, FR_QUES),
    CS(FR_MINS, FR_UNDS),
    CS(FR_GRV, FR_TILD),
    CS(KC_SPC, KC_TAB),
    CS(KC_MS_L, KC_WH_L),
    CS(KC_MS_D, KC_WH_D),
    CS(KC_MS_U, KC_WH_U),
    CS(KC_MS_R, KC_WH_R),
    NULL // Null terminate the array of overrides!
};
