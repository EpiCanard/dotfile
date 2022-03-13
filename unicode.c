#include QMK_KEYBOARD_H
#include "unicode.h"

const uint32_t PROGMEM unicode_map[] = {
    [EAM] = 0x00C9,  // É

    [EGM] = 0x00C8,  // È
    [AGM] = 0x00C0,  // À
    [UGM] = 0x00D9,  // Ù

    [EC]  = 0x00EA,  // ê
    [ECM] = 0x00CA,  // Ê
    [AC]  = 0x00E2,  // â
    [ACM] = 0x00C2,  // Â
    [OC]  = 0x00F4,  // ô
    [OCM] = 0x00D4,  // Ô

    [CCM] = 0x00C7,  // Ç
    [AR]  = 0x00E5,  // å
    [ARM] = 0x00C5,  // Å

    [EURO] = 0x20AC,  // €
};