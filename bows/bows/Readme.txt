License: CC0
Name: bows
Created by: AiTechEye
Version: 7

A very easy bow api mod with arrows

Load a bow:
place a arrow left of the bow + use it

Bows / levels:
Wooded
Stone
Steel
Bronze
Osidian
Mese
Diamond
Rainbow
Admin: bows:bow_admin (unlimited + very high level)

Arrows / level:
Wooded
Steel
Gold
Diamond
Dig: digs the block it hits.
Fire: spawning fire on the block or object it hits
Build: placing a block from the right stack of the bow.
Toxic: keep hurting after it hits.
Tetanus: makes you cant move (will not work with other arrows)
TNT: explosion
Admin: bows:arrow_admin (always kill when hits)
Nitrogen: freeze
Nitrogen: TNT: freeze explosion
Nuke: massive explosion


The target gives a mesecon signal when an arrow hits it.

Changes log:
V6:
Changed craft for TNT
Added: Nitrogen
Added: Nitrogen TNT
Added: Nuke
V5.1:
Changed: do not remove arrow on kill
Changed: targets will punch it self (works better with virtual users/bots)
Fixed crash when using tnt arrows (replacing blow with burning tnt if it messing)
Fixed arrrows disappear on node hit
Added drops after objects death or dug node
Added slow down arrows step after hit (5 setp/s instead of 20) [saves a lot of cpu]
V4:
Fixed punch system
Fixed: floating arrows after object death
V3:
Added: rainbow arrow
Added: on_step function for arrows
Fixed: tnt arrow + craft
Fixed: bug inside arrow damage system
Fixed: variable name conflict error (found by TenPlus1)
Fixed: tnt arrow wont load
Fixed: enable tnt even it dont exist and ignore enable_tnt
Changed: new license CC0
V2:
Added: craft gravel to flint
Fixed: crash with fire arrow
Changed: arrow crafts: toxic, fire, tetanus
Added: admin bow/arrow
Added: bows: osidian/rainbow
Added: tnt arrow
V1:
Mod created