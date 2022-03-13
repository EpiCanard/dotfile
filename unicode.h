#pragma once

enum unicode_names {
    // Accute
    EAM,
    // Grave
    EGM,
    AGM,
    UGM,
    // Circumflex
    EC,
    ECM,
    AC,
    ACM,
    OC,
    OCM,
    // Cedilla
    CCM,
    // Ring
    AR,
    ARM,

    EURO,
};

extern const uint32_t PROGMEM unicode_map[];