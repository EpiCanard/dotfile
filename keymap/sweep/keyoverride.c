#include QMK_KEYBOARD_H
#include "keymap_french.h"

#define CS(trigger_key, replacement_key)  &ko_make_basic(MOD_MASK_SHIFT, trigger_key, replacement_key)

// This globally defines all key overrides to be used
const key_override_t **key_overrides = (const key_override_t *[]){
    CS(KC_BSPC, KC_DEL),
    CS(LT2_COL, FR_SCLN),
    CS(FR_QUOT, FR_DQUO),
    CS(FR_BSLS, FR_PIPE),
    CS(FR_COMM, FR_LABK),
    CS(FR_DOT, FR_RABK),
    CS(FR_SLSH, FR_QUES),
    CS(FR_MINS, FR_UNDS),
    CS(FR_GRV, FR_TILD),
    CS(KC_SPC, KC_TAB),
    NULL // Null terminate the array of overrides!
};
