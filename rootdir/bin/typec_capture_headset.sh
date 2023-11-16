# sample usage: playback_capture_headset.sh
VOCALTRACT=$1

echo "enabling headset mic"

       tinymix 'TX_DEC0 Volume' 84
        tinymix 'TX DEC0 MUX' 'SWR_MIC'
        tinymix 'TX SMIC MUX0' 'ADC1'
        tinymix 'TX_AIF1_CAP Mixer DEC0' 1
        tinymix 'DEC0_BCS Switch' 1
        tinymix 'ADC2_MIXER Switch' 1
        tinymix 'HDR12 MUX' 'NO_HDR12'
        tinymix 'ADC2 MUX' 'INP2'
        tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 1
tinymix 'TX_CDC_DMA_TX_3 SampleRate' KHZ_48

# start recording
tinycap /data/data/test1_$VOCALTRACT.wav -r 48000 -b 16 -T 3

echo "disabling headset mic"
        tinymix 'TX DEC0 MUX' 'SWR_MIC'
        tinymix 'TX SMIC MUX0' 'ZERO'
        tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'
        tinymix 'TX_AIF1_CAP Mixer DEC0' 0
        tinymix 'DEC0_BCS Switch' 0
        tinymix 'ADC2_MIXER Switch' 0
        tinymix 'ADC2 MUX' 'INP2'
        tinymix 'TX1 MODE' 'ADC_INVALID'


tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 0
tinymix 'TX_CDC_DMA_TX_3 SampleRate' 'KHZ_48'

