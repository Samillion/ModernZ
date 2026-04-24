--[[

    Open files, add subtitles, or add audio tracks directly from mpv 
    via the Windows file dialog

    More info: https://github.com/Samillion/ModernZ/tree/main/extras/open-file

    A fork of https://github.com/rossy/mpv-open-file-dialog

--]]

local utils = require "mp.utils"

local function invoke_dialog(ps_command)
    local was_ontop = mp.get_property_native("ontop")
    if was_ontop then mp.set_property_native("ontop", false) end

    local res = utils.subprocess({
        args = { "powershell", "-NoProfile", "-STA", "-Command", ps_command },
        cancellable = false,
        capture_stdout = true,
        capture_stderr = true,
    })

    if was_ontop then mp.set_property_native("ontop", true) end

    if res and res.status == 0 and res.stdout and res.stdout ~= "" then
        return res.stdout
    end
end

local function open()
    local stdout = invoke_dialog([[
        Add-Type -AssemblyName PresentationFramework
        $ofd = New-Object Microsoft.Win32.OpenFileDialog
        $ofd.Multiselect = $true
        $ofd.Filter = "Media files|*.mkv;*.mp4;*.avi;*.mov;*.webm;*.wmv;*.gif;*.m4v;*.flv;*.mpg;*.mpeg;*.vob;*.ogv;*.3gp;*.ts;*.divx;*.mp3;*.flac;*.aac;*.ogg;*.wav;*.m4a;*.opus;*.wma;*.mka;*.m3u;*.m3u8|All files|*.*"

        if ($ofd.ShowDialog() -eq $true) {
            $ofd.FileNames -join "`n"
        }
    ]])

    if not stdout then return end

    local first = true
    for filename in string.gmatch(stdout, "[^\r\n]+") do
        mp.commandv("loadfile", filename, first and "replace" or "append")
        first = false
    end
end

local function add_subtitle()
    local stdout = invoke_dialog([[
        Add-Type -AssemblyName PresentationFramework
        $ofd = New-Object Microsoft.Win32.OpenFileDialog
        $ofd.Multiselect = $false
        $ofd.Filter = "Subtitle files|*.srt;*.ass;*.ssa;*.sub;*.idx;*.sup;*.vtt|All files|*.*"

        if ($ofd.ShowDialog() -eq $true) {
            $ofd.FileName
        }
    ]])

    if not stdout then return end

    local filename = stdout:match("[^\r\n]+")
    if filename then
        mp.commandv("sub-add", filename, "select")
    end
end

local function add_audio()
    local stdout = invoke_dialog([[
        Add-Type -AssemblyName PresentationFramework
        $ofd = New-Object Microsoft.Win32.OpenFileDialog
        $ofd.Multiselect = $false
        $ofd.Filter = "Audio files|*.mp3;*.flac;*.aac;*.ogg;*.wav;*.m4a;*.opus;*.wma;*.mka;*.ac3|All files|*.*"

        if ($ofd.ShowDialog() -eq $true) {
            $ofd.FileName
        }
    ]])

    if not stdout then return end

    local filename = stdout:match("[^\r\n]+")
    if filename then
        mp.commandv("audio-add", filename, "select")
    end
end

mp.add_key_binding(nil, "open", open)
mp.add_key_binding(nil, "add_subtitle", add_subtitle)
mp.add_key_binding(nil, "add_audio", add_audio)
