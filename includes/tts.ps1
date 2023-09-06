Add-Type –AssemblyName System.Speech # (1)
$tts = New-Object –TypeName System.Speech.Synthesis.SpeechSynthesizer
$tts.Speak('Hello, World!')

# List available voices
Foreach ($voice in $SpeechSynthesizer.GetInstalledVoices()){
    $Voice.VoiceInfo | Select-Object Gender, Name, Culture, Description
}

# Change voice
$tts.SelectVoice("Microsoft Zira Desktop")
$tts.Speak('Hello, World!')

# Save output
$WavFileOut = Join-Path -Path $env:USERPROFILE -ChildPath "Desktop\thinkpowershell-demo.wav" # (2)
$SpeechSynthesizer.SetOutputToWaveFile($WavFileOut)