#include QMK_KEYBOARD_H
#include "keymap_french.h"

#define COMB(cb, replace) COMBO(combos_map[cb], replace)
#define COMB_ACTION(cb) COMBO_ACTION(combos_map[cb])

#define L_ACU  GUI_S  // '
#define L_CIRC ALT_D  // ^
#define L_GRV  LT2_F  // `
#define L_TRM  FR_G   // ¨

#define R_ACU  LT2_J   // '
#define R_CIRC ALT_K   // ^
#define R_GRV  GUI_L   // `
#define R_TRM  SFT_COL // ¨

#define C_A SFT_A // A
#define C_E FR_E  // E
#define C_I FR_I  // I
#define C_O FR_O  // O
#define C_U FR_U  // U
#define C_C FR_C  // C

#define X_CIRC X_LBRC

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
    CB_EQUAL,
    CB_LENGTH
};
