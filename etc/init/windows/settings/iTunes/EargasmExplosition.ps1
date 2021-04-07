# Created:     2021/03/22 21:06:48
# Last Change: 2021/03/22 21:06:53.

$ITunes = New-Object -ComObject iTunes.Application

$Preset = $ITunes.EQPresets.ItemByName("Eargasm Explosion")
if (-not $Preset) {
    $Preset = $ITunes.CreateEQPreset("Eargasm Explosion")
    $Preset.Band1 = 3
    $Preset.Band2 = 6
    $Preset.Band3 = 9
    $Preset.Band4 = 7
    $Preset.Band5 = 6
    $Preset.Band6 = 5
    $Preset.Band7 = 7
    $Preset.Band8 = 4
    $Preset.Band9 = 11
    $Preset.Band10 = 8
}
