
    .section ".data.banim"

    .org 0x0000

    .global banim_number
banim_number:
    .incbin "baserom.gba", 0xC00000, 8

    .org 0x0008

    .global banim_data
banim_data:
    .incbin "baserom.gba", 0xC00008, 0x1920

    .org 0x2000
    .incbin "baserom.gba", 0xC02000, (0xE47180 - 0xC02000)

    .section ".data.terrain"

    .org 0x0000

    .global banim_terrain_head
banim_terrain_head:
    .incbin "baserom.gba", 0xEE0000, 8

    .org 0x0008

    .global battle_terrain_table
battle_terrain_table:
    .incbin "baserom.gba", 0xEE0008, 0xAC8

    .org 0x0C00
    .incbin "baserom.gba", 0xEE0C00, (0xEF2F18 - 0xEE0C00)

    .section ".data.palette"

    .org 0x0000

    .global banim_pal_head
banim_pal_head:
    .incbin "baserom.gba", 0xEF8000, 8

    .org 0x0008

    .global character_battle_animation_palette_table
character_battle_animation_palette_table:
    .incbin "baserom.gba", 0xEF8008, 0x6C0

    .org 0x1000
    .incbin "baserom.gba", 0xEF9000, (0xEFB2E0 - 0xEF9000)
