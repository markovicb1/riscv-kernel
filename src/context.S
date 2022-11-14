.global _ZN3TCB13contextSwitchEPNS_13threadContextES1_
.type _ZN3TCB13contextSwitchEPNS_13threadContextES1_, @function
_ZN3TCB13contextSwitchEPNS_13threadContextES1_:
    sd ra, 0 * 8(a0)
    sd sp, 1 * 8(a0)
    #sada upisujemo vrednosti za newContext
    ld ra, 0 * 8(a1)
    ld sp, 1 * 8(a1)
    ret
