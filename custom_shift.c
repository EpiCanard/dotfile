#include "custom_shift.h"
#include "unicode.h"


const custom_shift_t custom_shift_map[] = {
    [SR( CS_BSPC )] = {KC_BSPC, KC_DEL}, // FIXME handle key keep press
    [SR( CS_COLN )] = {FR_COLN, FR_SCLN},
    [SR( CS_QUOT )] = {FR_QUOT, FR_DQUO},
    [SR( CS_BSLS )] = {ALGR(FR_UNDS), ALGR(FR_MINS)},
    [SR( CS_COMM )] = {FR_COMM, FR_LABK},
    [SR( CS_DOT  )] = {FR_DOT, FR_RABK},
    [SR( CS_SLSH )] = {FR_SLSH, FR_QUES},
    [SR( CS_MINS )] = {FR_MINS, FR_UNDS},
    [SR( CS_EACU )] = {FR_EACU, X(EAM)},
    [SR( CS_EGRV )] = {FR_EGRV, X(EGM)},
    [SR( CS_AGRV )] = {FR_AGRV, X(AGM)},
    [SR( CS_UGRV )] = {FR_UGRV, X(UGM)},
    [SR( CS_CCED )] = {FR_CCED, X(CCM)},
};

void handle_unicode(uint16_t keycode, keyrecord_t *record) {
    if (keycode >= QK_UNICODEMAP && keycode <= QK_UNICODEMAP_PAIR_MAX)
        process_unicodemap(keycode, record);
    else
        tap_code16(keycode);
}

// Process custom shift key using CS
bool process_custom_shift(uint16_t keycode, keyrecord_t *record) {
    if (keycode >= SAFE_RANGE && keycode < CS_SAFE_RANGE) {
        custom_shift_t custom_shift = custom_shift_map[SR(keycode)];

        bool shift_mod = get_mods() & MOD_MASK_SHIFT;

        uint16_t kc = (shift_mod) ? custom_shift.shift_keycode : custom_shift.keycode;


        if (record->event.pressed) {
            if (shift_mod) { del_mods(MOD_MASK_SHIFT); }
            handle_unicode(kc, record);
        } else {
            unregister_code16(kc);
        }

        return false;
    }
    return true;
}