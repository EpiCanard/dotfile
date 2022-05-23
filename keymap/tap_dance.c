#include QMK_KEYBOARD_H
#include "tap_dance.h"

qk_tap_dance_action_t tap_dance_actions[] = {
    [TD_CTRL_CMD] = ACTION_TAP_DANCE_DOUBLE(KC_LCTL, KC_LGUI),
    [TD_SHIFT_HOLD] = ACTION_TAP_DANCE_DOUBLE(KC_LSFT, KC_CAPS)
};
