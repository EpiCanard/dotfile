#include QMK_KEYBOARD_H
#include "keymap_french.h"

#define COMB(cb, replace) COMBO(combos_map[cb], replace)
#define COMB_ACTION(cb) COMBO_ACTION(combos_map[cb])

#define ACU  FR_H // '
#define CIRC FR_J // ^
#define GRV  FR_K // `
#define TRM  FR_L // ¨

#define C_A FR_T // A
#define C_E FR_R // E
#define C_I FR_E // I
#define C_O FR_W // O
#define C_U FR_Q // U
#define C_C FR_A // C

#define X_CIRC X_LBRACKET

enum combos {
    // Acute
    CB_A_ACU,
    CB_E_ACU,
    CB_I_ACU,
    CB_O_ACU,
    CB_U_ACU,
    // Circumflex
    CB_A_CIRC,
    CB_E_CIRC,
    CB_I_CIRC,
    CB_O_CIRC,
    CB_U_CIRC,
    // Grave
    CB_A_GRV,
    CB_E_GRV,
    CB_I_GRV,
    CB_O_GRV,
    CB_U_GRV,
    // Trema
    CB_A_TRM,
    CB_E_TRM,
    CB_I_TRM,
    CB_O_TRM,
    CB_U_TRM,
    // Cedilla
    CB_C_CED,
    CB_LENGTH
};
