# Created:     2021/03/11 11:10:53
# Last Change: 2021/03/22 21:05:34.

$ITunes = New-Object -ComObject iTunes.Application

$Preset = $ITunes.EQPresets.ItemByName("Perfect")
if (-not $Preset) {
    $Preset = $ITunes.CreateEQPreset("Perfect")
    $Preset.Band1 = 3
    $Preset.Band2 = 6
    $Preset.Band3 = 9
    $Preset.Band4 = 7
    $Preset.Band5 = 6
    $Preset.Band6 = 5
    $Preset.Band7 = 7
    $Preset.Band8 = 9
    $Preset.Band9 = 11
    $Preset.Band10 = 8
}
