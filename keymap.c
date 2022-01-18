#include QMK_KEYBOARD_H
#include "version.h"

enum unicode_names {
  // Accute
  EA,
  EAM,
  // Grave
  EG,
  EGM,
  AG,
  AGM,
  UG,
  UGM,
  // Circumflex
  EC,
  ECM,
  AC,
  ACM,
  OC,
  OCM,
  // Cedilla
  CC,
  CCM,
  // Ring
  AR,
  ARM,

  EURO,
};

const uint32_t PROGMEM unicode_map[] = {
    [EA]  = 0x00E9,  // é
    [EAM] = 0x00C9,  // É

    [EG]  = 0x00E8,  // è
    [EGM] = 0x00C8,  // È
    [AG]  = 0x00E0,  // à
    [AGM] = 0x00C0,  // À
    [UG]  = 0x00F9,  // ù
    [UGM] = 0x00D9,  // Ù

    [EC]  = 0x00EA,  // ê
    [ECM] = 0x00CA,  // Ê
    [AC]  = 0x00E2,  // â
    [ACM] = 0x00C2,  // Â
    [OC]  = 0x00F4,  // ô
    [OCM] = 0x00D4,  // Ô

    [CC]  = 0x00E7,  // ç
    [CCM] = 0x00C7,  // Ç

    [AR]  = 0x00E5,  // å
    [ARM] = 0x00C5,  // Å

    [EURO] = 0x20AC,  // €
};

enum custom_keycodes {
  PM_SCROLL = SAFE_RANGE,
  PM_PRECISION,
  PM_PRECISION_2,
  PM_PRECISION_3
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {


    /*
     * ,--------------------------------------------------.    ,--------------------------------------------------.
     * |    0   |   1  |   2  |   3  |   4  |   5  |  6   |    |  38  |  39  |  40  |  41  |  42  |  43  |   44   |
     * |--------+------+------+------+------+------+------|    |------+------+------+------+------+------+--------|
     * |    7   |   8  |   9  |  10  |  11  |  12  |  13  |    |  45  |  46  |  47  |  48  |  49  |  50  |   51   |
     * |--------+------+------+------+------+------|      |    |      |------+------+------+------+------+--------|
     * |   14   |  15  |  16  |  17  |  18  |  19  |------|    |------|  52  |  53  |  54  |  55  |  56  |   57   |
     * |--------+------+------+------+------+------|  26  |    |  58  |------+------+------+------+------+--------|
     * |   20   |  21  |  22  |  23  |  24  |  25  |      |    |      |  59  |  60  |  61  |  62  |  63  |   64   |
     * `--------+------+------+------+------+-------------'    `-------------+------+------+------+------+--------'
     *   |  27  |  28  |  29  |  30  |  31  |                                |  65  |  66  |  67  |  68  |  69  |
     *   `----------------------------------'                                `----------------------------------'
     *                                       ,-------------.  ,-------------.
     *                                       |  32  |  33  |  |  70  |  71  |
     *                                ,------+------+------|  |------+------+------.
     *                                |      |      |  34  |  |  72  |      |      |
     *                                |  35  |  36  |------|  |------|  74  |  75  |
     *                                |      |      |  37  |  |  73  |      |      |
     *                                `--------------------'  `--------------------'
     * _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
     * _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
     * _______, _______, _______, _______, _______, _______,                        _______, _______, _______, _______, _______, _______,
     * _______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
     * _______, _______, _______, _______, _______,                                          _______, _______, _______, _______, _______,
     *
     *                                              _______, _______,      _______, _______,
     *                                                       _______,      _______,
     *                                     _______, _______, _______,      _______, _______, _______
     */

[0] = LAYOUT_ergodox_pretty(
KC_ESC      , KC_EXLM     , KC_AT  , KC_HASH, KC_DLR , KC_PERC, C(G(KC_NO)),       KC_CIRC  , KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_MINS, KC_EQL ,
KC_DEL      , KC_Q        , KC_W   , KC_E   , KC_R   , KC_T   , _______  ,       KC_LCTL  , KC_Y   , KC_U   , KC_I   , KC_O   , KC_P   , KC_BSLS,
TT(2)       , KC_A        , KC_S   , KC_D   , KC_F   , KC_G   ,                               KC_H   , KC_J   , KC_K   , KC_L   , KC_SCLN, KC_QUOT,
KC_LSFT     , LCTL_T(KC_Z), KC_X   , KC_C   , KC_V   , KC_B   , OSL(3)     ,       OSL(3)   , KC_N   , KC_M   , KC_COMM, KC_DOT , KC_SLSH, TT(2)  ,
LT(1,KC_GRV), KC_QUOT     , KC_LALT, KC_LEFT, KC_RGHT,                                                 KC_DOWN, KC_UP  , KC_LBRC, KC_RBRC, TT(1)  ,

                                                       CG_SWAP, KC_HOME    ,       KC_PGUP  , UC_MOD ,
                                                                KC_END     ,       KC_PGDN  ,
                                              KC_SPC , KC_TAB , KC_LGUI    ,       KC_ESC   , KC_ENT , KC_BSPC
),

[1] = LAYOUT_ergodox_pretty(
_______, KC_F1  , KC_F2  , KC_F3  , KC_F4  , KC_F5  , C(S(G(KC_NO))),      KC_F6  , KC_F7  , KC_F8  , KC_F9  , KC_F10, KC_F11 , KC_F12 ,
_______, KC_EXLM, KC_AT  , KC_LCBR, KC_RCBR, KC_PIPE, _______     ,      _______, KC_UP  , KC_7   , KC_8   , KC_9  , KC_ASTR, _______,
_______, KC_HASH, KC_DLR , KC_LPRN, KC_RPRN, KC_GRV ,                               KC_DOWN, KC_4   , KC_5   , KC_6  , KC_PLUS, _______,
_______, KC_PERC, KC_CIRC, KC_LBRC, KC_RBRC, KC_TILD, _______       ,      _______, KC_AMPR, KC_1   , KC_2   , KC_3  , KC_BSLS, _______,
_______, _______, _______, _______, _______,                                                 _______, _______, KC_0  , KC_EQL , _______,

                                             CG_NORM, _______       ,      _______, _______,
                                                      _______       ,      _______,
                                    _______, _______, _______       ,      _______, _______, _______
),

[2] = LAYOUT_ergodox_pretty(
_______, _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______, _______,
_______, _______, KC_MS_U, _______, _______, _______, _______,      _______, _______, KC_WH_U, _______, _______, KC_BRIU, _______,
_______, KC_MS_L, KC_MS_D, KC_MS_R, _______, _______,                        KC_WH_L, KC_WH_D, KC_WH_R, _______, KC_BRID, KC_MPLY,
_______, PM_SCROLL, PM_PRECISION, PM_PRECISION_2, PM_PRECISION_3, _______, _______,      _______, _______, _______, KC_MPRV, KC_MNXT, _______, _______,
RESET  , _______, _______, _______, _______,                                          KC_VOLD, KC_VOLU, KC_MUTE, _______, KC_RSFT,

                                             _______, KC_BTN1,      _______, _______,
                                                      _______,      _______,
                                    KC_BTN1, KC_BTN2, KC_BTN3,      KC_WREF, KC_WBAK, KC_WFWD
),


[3] = LAYOUT_ergodox_pretty(
_______, _______    , _______    , _______    , _______    , _______ , _______,      _______, _______, _______    , _______, X(EURO)    , _______, _______,
_______, _______    , XP(EG, EGM), XP(EA, EAM), XP(EC, ECM), _______ , _______,      _______, _______, XP(UG, UGM), _______, XP(OC, OCM), _______, _______,
_______, XP(AG, AGM), XP(AC, ACM), XP(AR, ARM), _______    , _______ ,                        _______, _______    , _______, _______    , _______, _______,
_______, _______    , _______    , XP(CC, CCM), _______    , _______ , _______,      _______, _______, _______    , _______, _______    , _______, _______,
_______, _______    , _______    , _______    , _______    ,                                           _______    , _______, _______    , _______, _______,

                                                              _______, _______,      _______, _______,
                                                                       _______,      _______,
                                                    _______, _______ , _______,      _______, _______, _______
)
};

bool set_scrolling = false;
int8_t precision = 127;

void update_color(void) {
  if (set_scrolling) {
    pimoroni_trackball_set_rgbw(255, 0, 0, 0);
  } else {
    switch (precision) {
      case 10:
        pimoroni_trackball_set_rgbw(0, 255, 0, 0);
        break;
      case 32:
        pimoroni_trackball_set_rgbw(0, 255, 255, 0);
        break;
      case 64:
        pimoroni_trackball_set_rgbw(0, 0, 255, 0);
        break;
      default:
        pimoroni_trackball_set_rgbw(0, 0, 0, 0);
    }
  }
}

int8_t apply_precision(int8_t value) {
  return (value > precision) ? precision : value;
}

report_mouse_t pointing_device_task_user(report_mouse_t mouse_report) {

  if (set_scrolling) {
    mouse_report.h = (mouse_report.x > 0) ? 1 : ((mouse_report.x < 0) ? -1 : 0);
    mouse_report.v = (mouse_report.y > 0) ? -1 : ((mouse_report.y < 0) ? 1 : 0);
    mouse_report.x = mouse_report.y = 0;
  } else {
    mouse_report.x = apply_precision(mouse_report.x);
    mouse_report.y = apply_precision(mouse_report.y);
  }
  return mouse_report;
}

void set_precision(keyrecord_t *record, int8_t prec) {
  if (record->event.pressed) {
    precision = prec;
  } else {
    precision = 127;
  }
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {

  bool result = false;
  switch (keycode) {
    case PM_SCROLL:
      if (record->event.pressed) {
          set_scrolling = !set_scrolling;
      }
      break;
    case PM_PRECISION:
      set_precision(record, 10);
      break;
    case PM_PRECISION_2:
      set_precision(record, 32);
      break;
    case PM_PRECISION_3:
      set_precision(record, 64);
      break;
    default:
      result = true;
  }
  if (!result) {
    update_color();
  }
  return result;
};

// Runs just one time when the keyboard initializes.
void keyboard_post_init_user(void) {
#ifdef RGBLIGHT_COLOR_LAYER_0
  rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
#endif
};

// Runs whenever there is a layer state change.
layer_state_t layer_state_set_user(layer_state_t state) {
  ergodox_board_led_off();
  ergodox_right_led_1_off();
  ergodox_right_led_2_off();
  ergodox_right_led_3_off();

  uint8_t layer = get_highest_layer(state);
  switch (layer) {
      case 0:
        #ifdef RGBLIGHT_COLOR_LAYER_0
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
        #endif
        break;
      case 1:
        ergodox_right_led_1_on();
        #ifdef RGBLIGHT_COLOR_LAYER_1
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_1);
        #endif
        break;
      case 2:
        ergodox_right_led_2_on();
        #ifdef RGBLIGHT_COLOR_LAYER_2
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_2);
        #endif
        break;
      case 3:
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_3
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_3);
        #endif
        break;
      case 4:
        ergodox_right_led_1_on();
        ergodox_right_led_2_on();
        #ifdef RGBLIGHT_COLOR_LAYER_4
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_4);
        #endif
        break;
      case 5:
        ergodox_right_led_1_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_5
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_5);
        #endif
        break;
      case 6:
        ergodox_right_led_2_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_6
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_6);
        #endif
        break;
      case 7:
        ergodox_right_led_1_on();
        ergodox_right_led_2_on();
        ergodox_right_led_3_on();
        #ifdef RGBLIGHT_COLOR_LAYER_7
          rgblight_setrgb(RGBLIGHT_COLOR_LAYER_7);
        #endif
        break;
      default:
        break;
    }

  return state;
};
