#pragma once

#include QMK_KEYBOARD_H
#include "keymap_french.h"

// Defines
// TODO useless
#define SHIFT_MASK 0x8000
#define SHIFT(keycode) (SHIFT_MASK | keycode)
#define SR(keycode) keycode - SAFE_RANGE

// Types
typedef struct {
    uint16_t    keycode;
    uint16_t    shift_keycode;
} custom_shift_t;

enum custom_shift_keycodes {
    CS_BSPC = SAFE_RANGE,
    CS_COLN,
    CS_QUOT,
    CS_BSLS,
    CS_COMM,
    CS_DOT,
    CS_SLSH,
    CS_MINS,
    // Accent
    CS_EACU,
    CS_EGRV,
    CS_AGRV,
    CS_UGRV,
    CS_CCED,
    CS_SAFE_RANGE
};

// Const
extern const custom_shift_t custom_shift_map[];

// Functions
bool process_custom_shift(uint16_t keycode, keyrecord_t *record);
