--[[
     This script allows you to climb over the walls in a dungeon by disabling the tile collision.
     Cons:
       - Your partner cannot climb with you
       - The belly empties very quickly
      I recommend enabling "mgba_undefeatable.lua" to avoid this problems.
  ]]--
local function walk_over()
  local r0 = emu:readRegister("r0")
  if r0 == 0 then
    console:log("Walking over the walls...")
    emu:writeRegister("r0", 1)
  end
end

local function disable_warp()
  local r0  = emu:readRegister("r0")
  if r0 ~= 0 then
    console:log("Avoiding warp...")
    emu:writeRegister("r0", 0)
  end
end

-- disable collision
emu:setBreakpoint(walk_over,0x8070e26)
-- avoid being teleported when climbing
emu:setBreakpoint(disable_warp,0x80755ee)
-- avoid being teleported when you attempt to attack from a wall
emu:setBreakpoint(disable_warp,0x80732b8)

