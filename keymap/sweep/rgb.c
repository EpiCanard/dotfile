#include QMK_KEYBOARD_H

// Runs whenever there is a layer state change.
layer_state_t layer_state_set_user(layer_state_t state) {

    int base = 30;
    uint8_t layer = get_highest_layer(state);
    switch (layer) {
        case 0:
            rgblight_setrgb_at(0, 0, 0, 0);
            rgblight_setrgb_at(0, 0, 0, 1);
            break;
        case 1:
            rgblight_setrgb_at(0, base, 0, 0);
            rgblight_setrgb_at(0, base, 0, 1);
            break;
        case 2:
            rgblight_setrgb_at(0, 0, base, 0);
            rgblight_setrgb_at(0, 0, base, 1);
            break;
        case 3:
            rgblight_setrgb_at(base, 0, 0, 0);
            rgblight_setrgb_at(base, 0, 0, 1);
            break;
        case 4:
            rgblight_setrgb_at(0, base, base, 0);
            rgblight_setrgb_at(0, base, base, 1);
            break;
        case 5:
            rgblight_setrgb_at(base, base, 0, 0);
            rgblight_setrgb_at(base, base, 0, 1);
            break;
        case 6:
            rgblight_setrgb_at(base, 0, base, 0);
            rgblight_setrgb_at(base, 0, base, 1);
            break;
        default:
            break;
    }

    return state;
}
