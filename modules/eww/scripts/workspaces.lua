#!/usr/bin/env lua
-- Outputs pre-rendered Eww buttons for workspaces

function trim(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- Get active workspace
local aw = io.popen("hyprctl monitors | grep 'active workspace:' | awk '{print $3}' | tr -d '()'")
local active_workspace = trim(aw:read("*a"))
aw:close()

-- Define total workspaces
local total = 4

-- Build box with buttons
local box = "(box :orientation \"h\" :spacing 5 :halign \"start\" :valign \"center\" "

for i = 1, total do
    if tostring(i) == active_workspace then
        box = box .. string.format("(button :class \"active\" :onclick \"hyprctl dispatch workspace %d\" \"●\") ", i)
    else
        box = box .. string.format("(button :class \"inactive\" :onclick \"hyprctl dispatch workspace %d\" \"○\") ", i)
    end
end

box = box .. ")"

print(box)
