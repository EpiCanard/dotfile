#define UNICODE_SELECTED_MODES UC_LNX, UC_MAC, UC_WIN
#define USE_I2C
#define POINTING_DEVICE_INVERT_X
#define POINTING_DEVICE_INVERT_Y

#define TRACKBALL_OFF_TIMEOUT 650 // ms
#define TRACKBALL_SMOOTHING_CYCLES 10

// Remove ergodox_ez MOUSEKEY config to allow to override
#define MOUSEKEY_INTERVAL          80
#define MOUSEKEY_MAX_SPEED         4
#define MOUSEKEY_WHEEL_DELAY       0
#define MOUSEKEY_TIME_TO_MAX       80

#define MOUSEKEY_MOVE_DELTA        8

#define LT1_G LT(1, FR_G)
#define LT2_F LT(2, FR_F)
#define LT4_B LT(4, FR_B)

#define CSG_NO C(S(G(KC_NO)))