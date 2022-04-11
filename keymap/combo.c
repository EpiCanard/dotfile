#include QMK_KEYBOARD_H
#include "keymap_french.h"
#include "sendstring_french.h"
#include "combo.h"

const uint16_t COMBO_LEN = CB_LENGTH;

const uint16_t PROGMEM combos_map[][3] = {
    // Acute
    [CB_A_ACU]  = { ACU , C_A, COMBO_END },
    [CB_E_ACU]  = { ACU , C_E, COMBO_END },
    [CB_I_ACU]  = { ACU , C_I, COMBO_END },
    [CB_O_ACU]  = { ACU , C_O, COMBO_END },
    [CB_U_ACU]  = { ACU , C_U, COMBO_END },
    // Circumflex
    [CB_A_CIRC] = { CIRC, C_A, COMBO_END },
    [CB_E_CIRC] = { CIRC, C_E, COMBO_END },
    [CB_I_CIRC] = { CIRC, C_I, COMBO_END },
    [CB_O_CIRC] = { CIRC, C_O, COMBO_END },
    [CB_U_CIRC] = { CIRC, C_U, COMBO_END },
    // Grave
    [CB_A_GRV]  = { GRV , C_A, COMBO_END },
    [CB_E_GRV]  = { GRV , C_E, COMBO_END },
    [CB_I_GRV]  = { GRV , C_I, COMBO_END },
    [CB_O_GRV]  = { GRV , C_O, COMBO_END },
    [CB_U_GRV]  = { GRV , C_U, COMBO_END },
    // Trema
    [CB_A_TRM]  = { TRM , C_A, COMBO_END },
    [CB_E_TRM]  = { TRM , C_E, COMBO_END },
    [CB_I_TRM]  = { TRM , C_I, COMBO_END },
    [CB_O_TRM]  = { TRM , C_O, COMBO_END },
    [CB_U_TRM]  = { TRM , C_U, COMBO_END },
    // Cedilla
    [CB_C_CED]  = { ACU , C_C, COMBO_END }
};



combo_t key_combos[] = {
    // Acute
    COMB(CB_A_ACU, KC_NO),
    COMB(CB_E_ACU, FR_EACU),
    COMB(CB_I_ACU, KC_NO),
    COMB(CB_O_ACU, KC_NO),
    COMB(CB_U_ACU, KC_NO),
    // Circumflex
    COMB_ACTION(CB_A_CIRC),
    COMB_ACTION(CB_E_CIRC),
    COMB_ACTION(CB_I_CIRC),
    COMB_ACTION(CB_O_CIRC),
    COMB_ACTION(CB_U_CIRC),
    // Grave
    COMB(CB_A_GRV, FR_AGRV),
    COMB(CB_E_GRV, FR_EGRV),
    COMB(CB_I_GRV, KC_NO),
    COMB(CB_O_GRV, KC_NO),
    COMB(CB_U_GRV, FR_UGRV),
    // Trema
    COMB_ACTION(CB_A_TRM),
    COMB_ACTION(CB_E_TRM),
    COMB_ACTION(CB_I_TRM),
    COMB_ACTION(CB_O_TRM),
    COMB_ACTION(CB_U_TRM),
    // cedilla
    COMB(CB_C_CED, FR_CCED)
};

char* getTapKC(combo_t *combo) {
    uint16_t key = pgm_read_word(&combo->keys[1]);
    switch(key) {
        case C_A:
            return SS_TAP(X_Q);
        case C_E:
            return SS_TAP(X_E);
        case C_I:
            return SS_TAP(X_I);
        case C_O:
            return SS_TAP(X_O);
        case C_U:
            return SS_TAP(X_U);
        default:
            return "\0";
    }
}

void process_combo_event(uint16_t combo_index, bool pressed) {
    switch(combo_index) {
        case CB_A_CIRC:
        case CB_E_CIRC:
        case CB_I_CIRC:
        case CB_O_CIRC:
        case CB_U_CIRC:
            if (pressed) {
                const char* x_code = getTapKC(&key_combos[combo_index]);
                SEND_STRING(SS_TAP(X_CIRC));
                send_string(x_code);
            }
            break;
        case CB_A_TRM:
        case CB_E_TRM:
        case CB_I_TRM:
        case CB_O_TRM:
        case CB_U_TRM:
            if (pressed) {
                const char* x_code = getTapKC(&key_combos[combo_index]);
                SEND_STRING(SS_LSFT(SS_TAP(X_CIRC)));
                send_string(x_code);
            }
            break;
  }
}
