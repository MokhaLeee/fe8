OUTPUT_ARCH(arm)

gNumMusicPlayers = 9;
gMaxLines = 0;

SECTIONS
{
    . = 0x02000000;
    EWRAM (NOLOAD) :
    ALIGN(4)
    {
        INCLUDE "sym_ewram.txt"
    }

    . = 0x03000000;
    IWRAM (NOLOAD) :
    ALIGN(4)
    {
        INCLUDE "sym_iwram.txt"
    }

    . = 0x08000000;
    ROM :
    ALIGN(4)
    {
        /* .text */
        asm/crt0.o(.text);
        asm/arm.o(.text);
        src/main.o(.text);
        src/irq.o(.text);
        src/random.o(.text);
        src/hardware.o(.text);
        src/dma.o(.text);
        src/oam.o(.text);
        src/sound.o(.text);
        src/armfunc.o(.text);
        src/proc.o(.text);
        src/icon.o(.text);
        src/debug-text.o(.text);
        src/text.o(.text);
        src/bso.o(.text);
        src/sprite.o(.text);
        src/face.o(.text);
        asm/face.o(.text);
        asm/scene.o(.text);
        src/sprite-anim.o(.text);
        asm/gamectrl.o(.text);
        src/messdecode.o(.text);
        asm/spline.o(.text);
        asm/evtcmd_gmap.o(.text);
        src/event.o(.text);
        asm/evtscr.o(.text);
        asm/popup.o(.text);
        asm/evtsub.o(.text);
        asm/hino.o(.text);
        asm/bm.o(.text);
        src/item.o(.text);
        src/unit.o(.text);
        src/map.o(.text);
        src/mapwork.o(.text);
        src/bmdebug.o(.text);
        asm/bmdebug.o(.text);
        asm/playerphase.o(.text);
        asm/koido.o(.text);
        asm/bmxfade.o(.text);
        asm/bmcamadjust.o(.text);
        asm/convoymenu.o(.text);
        asm/code_801E2E0.o(.text); /* 2 fog related functions and FillWarpRangeMap */
        asm/menuitempanel.o(.text);
        asm/unitswapfx.o(.text);
        asm/phasechangefx.o(.text);
        asm/code_801F50C.o(.text); /* ChangeActiveUnitFacing */
        asm/trapfx.o(.text);
        asm/notifybox.o(.text);
        asm/chapterintrofx.o(.text);
        asm/gameoverbgfx.o(.text);
        asm/lightrunefx.o(.text);
        asm/danceringfx.o(.text);
        asm/eventwarpfx.o(.text);
        asm/whitecircularfadefx.o(.text);
        asm/emitstarfx.o(.text);
        asm/minefx.o(.text);
        asm/chapterintrofx_title.o(.text);
        asm/bmmenu.o(.text);
        asm/bmphase.o(.text);
        src/gold.o(.text);
        asm/bmtarget.o(.text);
        asm/unitsprite.o(.text);
        src/support.o(.text);
        src/item-use.o(.text);
        src/battle.o(.text);
        src/bmtrade.o(.text);
        src/trap.o(.text);
        asm/bmusemind.o(.text);
        src/bmio.o(.text);
        asm/bmcontainer.o(.text);
        asm/bmusort.o(.text);
        asm/bmarena.o(.text);
        asm/bmmind.o(.text);
        asm/bmpatharrowdisp.o(.text);
        asm/sallycursor.o(.text);
        asm/bmcommanddbg.o(.text);
        src/chapterdata.o(.text);
        asm/unitinfowindow.o(.text);
        asm/bb.o(.text);
        asm/bmusailment.o(.text);
        asm/bksel.o(.text);
        asm/bmtrap.o(.text);
        asm/bmarch.o(.text);
        asm/bmdifficulty.o(.text);
        src/cp_phase.o(.text);
        src/cp_order.o(.text);
        src/cp_decide.o(.text);
        asm/cpperform.o(.text);
        asm/code_cpextra.o(.text);
        asm/code_sio.o(.text);
        src/uiutils.o(.text);
        src/uimenu.o(.text);
        asm/ui_targetselection.o(.text);
        asm/code_battleanim.o(.text);
        asm/monstergen.o(.text);
        src/mu.o(.text);
        asm/muctrl.o(.text);
        asm/code_mapanim.o(.text);
        asm/ev_triggercheck.o(.text);
        asm/asmcs.o(.text);
        asm/code_8086934.o(.text);
        asm/fx_slidingwallbg.o(.text);
        src/statscreen.o(.text);
        asm/code.o(.text);
        asm/m4a_1.o(.text);
        src/m4a.o(.text);
        asm/libagbsyscall.o(.text);
        src/agb_sram.o(.text);
        *libgcc.a:_ashldi3.o(.text);
        *libgcc.a:_call_via_rX.o(.text);
        *libgcc.a:_divsi3.o(.text);
        *libgcc.a:_dvmd_tls.o(.text);
        *libgcc.a:_modsi3.o(.text);
        *libgcc.a:_muldi3.o(.text);
        *libgcc.a:_udivsi3.o(.text);
        *libgcc.a:_umodsi3.o(.text);
        *libc.a:memcpy.o(.text);
        *libc.a:memset.o(.text);
        *libc.a:sprintf.o(.text);
        *libc.a:strcpy.o(.text);
        *libc.a:strlen.o(.text);
        *libc.a:strstr.o(.text);
        *libc.a:vfprintf.o(.text);
        *libc.a:vsprintf.o(.text);
        *libc.a:wsetup.o(.text);
        *libc.a:dtoa.o(.text);
        *libc.a:fflush.o(.text);
        *libc.a:findfp.o(.text);
        *libc.a:freer.o(.text);
        *libc.a:fvwrite.o(.text);
        *libc.a:fwalk.o(.text);
        *libc.a:locale.o(.text);
        *libc.a:makebuf.o(.text);
        *libc.a:mallocr.o(.text);
        *libc.a:mbtowc_r.o(.text);
        *libc.a:memchr.o(.text);
        *libc.a:memmove.o(.text);
        *libc.a:mlock.o(.text);
        *libc.a:mprec.o(.text);
        *libc.a:s_isinf.o(.text);
        *libc.a:s_isnan.o(.text);
        *libc.a:sbrkr.o(.text);
        *libc.a:stdio.o(.text);
        *libc.a:strcmp.o(.text);
        *libc.a:syscalls.o(.text);
        *libc.a:writer.o(.text);
        *libc.a:callocr.o(.text);
        *libc.a:closer.o(.text);
        *libc.a:errno.o(.text);
        *libc.a:fstatr.o(.text);
        *libc.a:libcfunc.o(.text);
        *libc.a:lseekr.o(.text);
        *libc.a:readr.o(.text);
        *libgcc.a:dp-bit.o(.text);
        *libgcc.a:fp-bit.o(.text);
        *libgcc.a:_lshrdi3.o(.text);
        *libgcc.a:_negdi2.o(.text);
        asm/arm_call.o(.text);

        /* .rodata */
        . = ALIGN(4); src/main.o(.rodata);
        . = ALIGN(4); src/random.o(.rodata);
        . = ALIGN(4); src/hardware.o(.rodata);
        . = ALIGN(4); data/trig_rodata.o(.rodata);
        . = ALIGN(4); src/debug-text.o(.rodata);
        . = ALIGN(4); src/text.o(.rodata);
        . = ALIGN(4); src/face.o(.rodata);
        . = ALIGN(4); src/data_scene.o(.rodata);
        . = ALIGN(4); src/sprite-anim.o(.rodata);
        . = ALIGN(4); src/data_gamecontrol.o(.rodata);
        . = ALIGN(4); src/messdecode.o(.rodata);
        . = ALIGN(4); src/event-script.o(.rodata);
        . = ALIGN(4); src/util.o(.rodata);
        . = ALIGN(4); data/const_data_D792C.o(.rodata);
        . = ALIGN(4); src/item.o(.rodata);
        . = ALIGN(4); src/unit.o(.rodata);
        . = ALIGN(4); data/const_data_D7A6C.o(.rodata);
        . = ALIGN(4); src/support.o(.rodata);
        . = ALIGN(4); src/battle.o(.rodata);
        . = ALIGN(4); src/bmtrade.o(.rodata);
        . = ALIGN(4); data/const_data_D7C44.o(.rodata);
        . = ALIGN(4); src/raw_text_jp.o(.rodata);
        . = ALIGN(4); src/bmio.o(.rodata);
        . = ALIGN(4); data/const_data_D7F5C.o(.rodata);
        . = ALIGN(4); src/cp_phase.o(.rodata);
        . = ALIGN(4); src/cp_order.o(.rodata);
        . = ALIGN(4); src/cp_decide.o(.rodata);
        . = ALIGN(4); data/const_data_D80DC.o(.rodata);
        . = ALIGN(4); src/uiutils.o(.rodata);
        . = ALIGN(4); src/uimenu.o(.rodata);
        . = ALIGN(4); src/data_uitarget.o(.rodata);
        . = ALIGN(4); data/const_data_DA3A4.o(.rodata);
        . = ALIGN(4); data/text.o(.rodata);
        . = ALIGN(4); data/const_data_1609BC.o(.rodata);
        . = ALIGN(4); data/const_data_unit_icon_wait.o(.rodata);
        . = ALIGN(4); data/const_data_1C0AFC.o(.rodata);
        . = ALIGN(4); data/const_data_unit_icon_move.o(.rodata);
        . = ALIGN(4); src/mu.o(.rodata);
        . = ALIGN(4); data/muctrl_rodata.o(.rodata);
        . = ALIGN(4); data/const_data_205714.o(.rodata);
        . = ALIGN(4); src/statscreen.o(.rodata);
        . = ALIGN(4); data/const_data_205B84.o(.rodata);
        . = ALIGN(4); src/m4a_tables.o(.rodata);
        . = ALIGN(4); data/sound_data.o(.rodata);
        . = ALIGN(4); *libc.a:vfprintf.o(.rodata);
        . = ALIGN(4); *libc.a:dtoa.o(.rodata);
        . = ALIGN(4); *libc.a:impure.o(.rodata);
        . = ALIGN(4); *libc.a:locale.o(.rodata);
        . = ALIGN(4); *libc.a:mprec.o(.rodata);
        . = ALIGN(4); *libc.a:syscalls.o(.rodata);

        /* .data */
        . = ALIGN(4); src/hardware.o(.data);
        . = ALIGN(4); src/sound.o(.data);
        . = ALIGN(4); src/proc.o(.data);
        . = ALIGN(4); src/debug-text.o(.data);
        . = ALIGN(4); src/text.o(.data);
        . = ALIGN(4); src/sprite.o(.data);
        . = ALIGN(4); src/face.o(.data);
        . = ALIGN(4); src/data_scene.o(.data);
        . = ALIGN(4); src/sprite-anim.o(.data);
        . = ALIGN(4); src/data_gamecontrol.o(.data);
        . = ALIGN(4); src/messdecode.o(.data);
        . = ALIGN(4); src/spline.o(.data);
        . = ALIGN(4); src/event.o(.data);
        . = ALIGN(4); data/data_591AB4.o(.data);
        . = ALIGN(4); data/data_item_icon.o(.data);
        . = ALIGN(4); data/data_599714.o(.data);
        . = ALIGN(4); src/unit.o(.data);
        . = ALIGN(4); src/map.o(.data);
        . = ALIGN(4); data/data_59A9D8.o(.data);
        . = ALIGN(4); src/bmdebug.o(.data);
        . = ALIGN(4); data/data_59AA7C.o(.data);
        . = ALIGN(4); src/support.o(.data);
        . = ALIGN(4); src/item-use.o(.data);
        . = ALIGN(4); src/battle.o(.data);
        . = ALIGN(4); src/bmtrade.o(.data);
        . = ALIGN(4); data/data_59BC64.o(.data);
        . = ALIGN(4); src/menu_def.o(.rodata);
        . = ALIGN(4); src/data_selectinfo.o(.data);
        . = ALIGN(4); data/data_59D238.o(.data);
        . = ALIGN(4); src/bmio.o(.data);
        . = ALIGN(4); data/data_59D9FC.o(.data);
        . = ALIGN(4); src/cp_phase.o(.data);
        . = ALIGN(4); src/cp_order.o(.data);
        . = ALIGN(4); src/cp_decide.o(.data);
        . = ALIGN(4); data/data_5A8004.o(.data);
        . = ALIGN(4); src/uiutils.o(.data);
        . = ALIGN(4); src/uimenu.o(.data);
        . = ALIGN(4); src/data_uitarget.o(.data);
        . = ALIGN(4); data/data_5B65C0.o(.data);
        . = ALIGN(4); data/data_portrait.o(.data);
        . = ALIGN(4); src/portrait_data.o(.data);
        . = ALIGN(4); data/data_8ADEB0.o(.data);
        . = ALIGN(4); src/unit_icon_wait_data.o(.data);
        . = ALIGN(4); data/data_8AFBD8.o(.data);
        . = ALIGN(4); src/mu.o(.data);
        . = ALIGN(4); data/data_9A2DB0.o(.data);
        . = ALIGN(4); src/unit_icon_move_data.o(.data);
        . = ALIGN(4); data/data_9A31F8.o(.data);
        . = ALIGN(4); src/statscreen.o(.data);
        . = ALIGN(4); src/chap_title_data.o(.data);
        . = ALIGN(4); data/data_A01628.o(.data);
        . = ALIGN(4); data/data_chap_title.o(.data);
        . = ALIGN(4); data/data_A167C8.o(.data);
        . = ALIGN(4); *libc.a:impure.o(.data);
        . = ALIGN(4); *libc.a:locale.o(.data);
        . = ALIGN(4); *libc.a:mallocr.o(.data);
        . = ALIGN(4); data/data_B1FE7C.o(.data);

        FILL(0xFF);

        . = 0xC00000; data/banim.o(.data.banim);

        FILL(0xFF);

        . = 0xEE0000; data/banim.o(.data.terrain);

        FILL(0xFF);

        . = 0xEF8000; data/banim.o(.data.palette);

        FILL(0xFF);

        . = 0xFE0000; data/data_FE0000.o(.data);
        . = 0xFFF000; data/data_FFF000.o(.data);
    } = 0

    /* Stabs debugging sections.  */
    .stab          0 : { *(.stab) }
    .stabstr       0 : { *(.stabstr) }
    .stab.excl     0 : { *(.stab.excl) }
    .stab.exclstr  0 : { *(.stab.exclstr) }
    .stab.index    0 : { *(.stab.index) }
    .stab.indexstr 0 : { *(.stab.indexstr) }
    .comment       0 : { *(.comment) }
    .gnu.build.attributes : { *(.gnu.build.attributes .gnu.build.attributes.*) }
    /* DWARF debug sections.
        Symbols in the DWARF debugging sections are relative to the beginning
        of the section so we begin them at 0.  */
    /* DWARF 1 */
    .debug          0 : { *(.debug) }
    .line           0 : { *(.line) }
    /* GNU DWARF 1 extensions */
    .debug_srcinfo  0 : { *(.debug_srcinfo) }
    .debug_sfnames  0 : { *(.debug_sfnames) }
    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    /* DWARF 2 */
    .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line .debug_line.* .debug_line_end) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }
    /* DWARF 3 */
    .debug_pubtypes 0 : { *(.debug_pubtypes) }
    .debug_ranges   0 : { *(.debug_ranges) }
    /* DWARF Extension.  */
    .debug_macro    0 : { *(.debug_macro) }
    .debug_addr     0 : { *(.debug_addr) }
    .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) KEEP (*(.gnu.attributes)) }
    .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}
