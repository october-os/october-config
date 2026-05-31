-- Do not touch this file.
-- For config modification, make them in the
-- hypr/user/ directory. It will be automatically imported.

require("base/hyprland")

for file in io.popen([[ ls -pa  $HOME/.config/october-config/hypr/user/ | grep -v / ]]): lines() do
    if file:sub(-4) == ".lua" then
        name = file:sub(1, -5)
        require("user/" .. name)
    end
end