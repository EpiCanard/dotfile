#include QMK_KEYBOARD_H
#include "version.h"
#include "timer.h"
#include "keymap_french.h"

enum custom_keycodes {
    PM_SCRL = SAFE_RANGE,
    PM_FACT
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/*
 * ,--------------------------------------------------------------.    ,--------------------------------------------------------------.
 * |    0   |    1   |    2   |    3   |    4   |    5   |   6    |    |   38   |   39   |   40   |   41   |   42   |   43   |   44   |
 * |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
 * |    7   |    8   |    9   |   10   |   11   |   12   |   13   |    |   45   |   46   |   47   |   48   |   49   |   50   |   51   |
 * |--------+--------+--------+--------+--------+--------|        |    |        |--------+--------+--------+--------+--------+--------|
 * |   14   |   15   |   16   |   17   |   18   |   19   | ------ |    | ------ |   52   |   53   |   54   |   55   |   56   |   57   |
 * |--------+--------+--------+--------+--------+--------|   26   |    |   58   |--------+--------+--------+--------+--------+--------|
 * |   20   |   21   |   22   |   23   |   24   |   25   |        |    |        |   59   |   60   |   61   |   62   |   63   |   64   |
 * |--------+-----------------+--------+--------+--------+--------'    `--------+--------+--------+--------+--------+--------+--------|
 * |   27   |   28   |   29   |   30   |   31   |                                        |   65   |   66   |   67   |   68   |   69   |
 * `--------------------------------------------'                                        `--------------------------------------------'
 *                                              ,-----------------.    ,-----------------.
 *                                              |   32   |   33   |    |   70   |   71   |
 *                                     ,--------+--------+--------|    |--------+--------+--------.
 *                                     |        |        |   34   |    |   72   |        |        |
 *                                     |   35   |   36   |--------|    |--------|   74   |   75   |
 *                                     |        |        |   37   |    |   73   |        |        |
 *                                     `--------------------------'    `--------------------------'
 *   _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
 *   _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
 *   _______, _______, _______, _______, _______, _______,                        _______, _______, _______, _______, _______, _______,
 *   _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
 *   _______, _______, _______, _______, _______,                                          _______, _______, _______, _______, _______,
 *
 *                                                _______, _______,      _______, _______,
 *                                                         _______,      _______,
 *                                       _______, _______, _______,      _______, _______, _______
 */

[0] = LAYOUT_ergodox_pretty(
// ,--------------------------------------------------------------.    ,--------------------------------------------------------------.
     KC_ESC , FR_EXLM, FR_AT  , FR_HASH, FR_DLR , FR_PERC, TT(4)  ,      FR_CIRC, FR_AMPR, FR_ASTR, FR_LPRN, FR_RPRN, FR_MINS, FR_EQL ,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     KC_DEL , FR_Q   , FR_W   , FR_E   , FR_R   , FR_T   , PM_FACT,      C(FR_Z), FR_Y   , FR_U   , FR_I   , FR_O   , FR_P   , FR_BSLS,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     TT(2)  , FR_A   , FR_S   , FR_D   , LT2_F  , LT1_G  ,                        FR_H   , FR_J   , FR_K   , FR_L   , FR_COLN, FR_QUOT,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     KC_LSFT, FR_Z   , FR_X   , FR_C   , FR_V   , LT3_B  , _______,      C(FR_B), FR_N   , FR_M   , FR_COMM, FR_DOT , FR_SLSH, FR_GRV ,
// |--------+-----------------+--------+--------+--------+--------'    `--------+--------+--------+--------+--------+--------+--------|
     KC_LCTL, KC_LGUI, KC_LALT, _______, _______,                                          _______, _______, _______, _______, TT(1)  ,
// `--------------------------------------------'                                        `--------------------------------------------'

//                                              ,-----------------.    ,-----------------.
                                                  _______, KC_HOME,      KC_PGUP, TT(1)  ,
//                                     ,--------+--------+--------|    |--------+--------+--------.
                                                           KC_END ,      KC_PGDN,
//                                     |        |        |--------|    |--------|        |        |
                                         KC_SPC , KC_TAB , PM_SCRL,      _______, KC_ENT , KC_BSPC
//                                     `--------------------------'    `--------------------------'
),

[1] = LAYOUT_ergodox_pretty(
// ,--------------------------------------------------------------.    ,--------------------------------------------------------------.
     _______, KC_F1  , KC_F2  , KC_F3  , KC_F4  , KC_F5  , CSG_NO ,      KC_F6  , KC_F7  , KC_F8  , KC_F9  , KC_F10 , KC_F11 , KC_F12 ,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, FR_EXLM, FR_AT  , FR_LCBR, FR_RCBR, FR_PIPE, _______,      _______, _______, _______, _______, _______, FR_ASTR, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, FR_HASH, FR_DLR , FR_LPRN, FR_RPRN, _______,                        KC_LEFT, KC_DOWN, KC_UP  , KC_RGHT, FR_PLUS, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, FR_PERC, FR_CIRC, FR_LBRC, FR_RBRC, FR_TILD, _______,      _______, FR_AMPR, _______, _______, _______, FR_BSLS, _______,
// |--------+--------+--------+--------+--------+--------+--------'    `--------+--------+--------+--------+--------+--------+--------|
     _______, _______, _______, _______, _______,                                          _______, _______, _______, FR_EQL , _______,
// `--------------------------------------------'                                        `--------------------------------------------'

//                                              ,-----------------.    ,-----------------.
                                                  CG_NORM, KC_PGUP,      _______, _______,
//                                     ,--------+--------+--------|    |--------+--------+--------.
                                                           KC_PGDN,      _______,
//                                     |        |        |--------|    |--------|        |        |
                                         _______, _______, _______,      _______, _______, _______
//                                     `--------------------------'    `--------------------------'
),

[2] = LAYOUT_ergodox_pretty(
// ,--------------------------------------------------------------.    ,--------------------------------------------------------------.
     _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, KC_BRIU, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, KC_BRID, _______, _______, _______,                        KC_WH_L, KC_WH_D, KC_WH_U, KC_WH_R, _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, _______, _______, _______, _______, _______,      _______, _______, KC_MPRV, KC_MNXT, KC_MPLY, _______, _______,
// |--------+--------+--------+--------+--------+--------+--------'    `--------+--------+--------+--------+--------+--------+--------|
     RESET  , _______, _______, _______, _______,                                          KC_VOLD, KC_VOLU, KC_MUTE, _______, _______,
// `--------------------------------------------'                                        `--------------------------------------------'

//                                              ,-----------------.    ,-----------------.
                                                  _______, _______,      _______, _______,
//                                     ,--------+--------+--------|    |--------+--------+--------.
                                                           _______,      _______,
//                                     |        |        |--------|    |--------|        |        |
                                         KC_BTN2, KC_BTN1, KC_BTN3,      _______, KC_BTN4, KC_BTN5
//                                     `--------------------------'    `--------------------------'
),

// Mouse Layer
[3] = LAYOUT_ergodox_pretty(
// ,--------------------------------------------------------------.    ,--------------------------------------------------------------.
     _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, _______, _______, _______, _______, _______,      _______, _______, FR_7   , FR_8   , FR_9   , _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, _______, _______, _______, _______,                        _______, FR_4   , FR_5   , FR_6   , _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, _______, _______, _______, _______, _______,      _______, _______, FR_1   , FR_2   , FR_3   , _______, _______,
// |--------+--------+--------+--------+--------+--------+--------|    |--------+--------+--------+--------+--------+--------+--------|
     _______, _______, _______, _______, _______,                                          _______, _______, FR_0   , _______, _______,
// `--------------------------------------------'                                        `--------------------------------------------'

//                                              ,-----------------.    ,-----------------.
                                                  _______, _______,      _______, _______,
//                                     ,--------+--------+--------|    |--------+--------+--------.
                                                           _______,      _______,
//                                     |        |        |--------|    |--------|        |        |
                                         _______, _______, _______,      _______, _______, _______
//                                     `--------------------------'    `--------------------------'
)
};

/* === TrackBall === */

bool     set_scrolling = false;
int      factor        = 1;

void update_color(void) {
    if (set_scrolling) {
        pimoroni_trackball_set_rgbw(255, 0, 0, 0);
    } else {
        switch (factor) {
            case 3:
                pimoroni_trackball_set_rgbw(0, 255, 255, 0);
                break;
            default:
                pimoroni_trackball_set_rgbw(0, 0, 0, 0);
        }
    }
}

void set_factor(keyrecord_t *record, int8_t fac) {
    if (record->event.pressed) {
        factor = fac;
    } else {
        factor = 1;
    }
}

/* === PROCESS === */
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    uprintf("KL: kc: %u, col: %u, row: %u, pressed: %u\n", keycode, record->event.key.col, record->event.key.row, record->event.pressed);

    bool result = false;
    switch (keycode) {
        case PM_SCRL:
            set_scrolling = record->event.pressed;
            break;
        case PM_FACT:
            set_factor(record, 3);
            break;
        default:
            result = true;
    }
    if (!result) {
        update_color();
    }
    return result;
};

/* === RGB === */

// Runs just one time when the keyboard initializes.
void keyboard_post_init_user(void) {
#ifdef RGBLIGHT_COLOR_LAYER_0
    rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
#endif
    // Customise these values to desired behaviour
    // debug_enable=true;
    // debug_matrix=true;
    // debug_keyboard=true;
    // debug_mouse=true;
};

// === UNUSED for now ===

void adapt_smoothing_value(int8_t* mouse, int16_t* buffer) {
    *buffer += round(factor * *mouse);
    if (abs(*buffer > 0) && abs(*buffer) <= TRACKBALL_SMOOTHING_CYCLES) {
        if (*buffer < 0) {
            *mouse = -1;
            *buffer += 1;
        } else {
            *mouse = 1;
            *buffer -= 1;
        }
    } else {
        uint16_t delta = *buffer / TRACKBALL_SMOOTHING_CYCLES;
        *mouse = delta;
        *buffer -= delta;
    }
}

report_mouse_t apply_trackball_smoothing(report_mouse_t mouse_report) {
    static int16_t      x_buffer = 0, y_buffer = 0;
    static int16_t      mov_counter = 0;

    if (mouse_report.x == 0 && mouse_report.y == 0) {
        mov_counter = 0;
    } else {
        mov_counter++;
    }

    adapt_smoothing_value(&mouse_report.x, &x_buffer);
    adapt_smoothing_value(&mouse_report.y, &y_buffer);

    if (mov_counter != 0) {
        dprintf("smoothing : counters : %d - factor : %d - offsets : %d / %d - buffer : %d / %d\n", mov_counter, factor, mouse_report.x, mouse_report.y, x_buffer, y_buffer);
    }
    return mouse_report;
}

report_mouse_t pointing_device_task_user(report_mouse_t mouse_report) {
    if (set_scrolling) {
        mouse_report.h = (mouse_report.x > 0) ? 1 : ((mouse_report.x < 0) ? -1 : 0);
        mouse_report.v = (mouse_report.y > 0) ? -1 : ((mouse_report.y < 0) ? 1 : 0);
        mouse_report.x = mouse_report.y = 0;
    } else {
        // mouse_report = apply_trackball_smoothing(mouse_report);
        mouse_report.x = mouse_report.x * factor;
        mouse_report.y = mouse_report.y * factor;
    }
    return mouse_report;
}
