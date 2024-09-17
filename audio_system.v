module audio_system (
    // Power inputs
    input VCC,               // Power supply 5V
    input GND,               // Ground

    // ESP32 to PCM5102A DAC 1 (for Left and Right Channels)
    input GPIO14_BCK_DAC1,    // ESP32 GPIO14 -> PCM5102A DAC1 BCK
    input GPIO25_LCK_DAC1,    // ESP32 GPIO25 -> PCM5102A DAC1 LCK
    input GPIO23_DIN_DAC1,    // ESP32 GPIO23 -> PCM5102A DAC1 DIN

    // ESP32 to PCM5102A DAC 2 (for Center Channel)
    input GPIO13_BCK_DAC2,    // ESP32 GPIO13 -> PCM5102A DAC2 BCK
    input GPIO12_LCK_DAC2,    // ESP32 GPIO12 -> PCM5102A DAC2 LCK
    input GPIO4_DIN_DAC2,     // ESP32 GPIO4  -> PCM5102A DAC2 DIN

    // SD Card Reader connections
    input GPIO5_CS,           // ESP32 GPIO5  -> SD Card Reader CS (Chip Select)
    input GPIO18_CLK,         // ESP32 GPIO18 -> SD Card Reader CLK (Clock)
    input GPIO19_MISO,        // ESP32 GPIO19 -> SD Card Reader MISO (Data to ESP32)
    input GPIO23_MOSI,        // ESP32 GPIO23 -> SD Card Reader MOSI (Data from ESP32)

    // PCM5102A DAC outputs to MAX98357A amplifiers
    output DAC1_L_OUT,        // PCM5102A DAC1 L_OUT -> MAX98357A Amplifier 1 (Left)
    output DAC1_R_OUT,        // PCM5102A DAC1 R_OUT -> MAX98357A Amplifier 2 (Right)
    output DAC2_L_OUT,        // PCM5102A DAC2 L_OUT -> MAX98357A Amplifier 3 (Center)

    // Amplifier outputs to speakers
    output LEFT_SPEAKER,      // Amplifier 1 Output -> Left Speaker
    output RIGHT_SPEAKER,     // Amplifier 2 Output -> Right Speaker
    output CENTER_SPEAKER     // Amplifier 3 Output -> Center Speaker
);

    // PCM5102A DAC 1 (Left and Right Channels)
    wire PCM5102A_1_BCK = GPIO14_BCK_DAC1;  // PCM5102A DAC1 Bit Clock (BCK)
    wire PCM5102A_1_LCK = GPIO25_LCK_DAC1;  // PCM5102A DAC1 Word Select Clock (LCK)
    wire PCM5102A_1_DIN = GPIO23_DIN_DAC1;  // PCM5102A DAC1 Data Input (DIN)
    wire PCM5102A_1_VCC = VCC;              // PCM5102A DAC1 Power
    wire PCM5102A_1_GND = GND;              // PCM5102A DAC1 Ground

    // PCM5102A DAC 2 (Center Channel)
    wire PCM5102A_2_BCK = GPIO13_BCK_DAC2;  // PCM5102A DAC2 Bit Clock (BCK)
    wire PCM5102A_2_LCK = GPIO12_LCK_DAC2;  // PCM5102A DAC2 Word Select Clock (LCK)
    wire PCM5102A_2_DIN = GPIO4_DIN_DAC2;   // PCM5102A DAC2 Data Input (DIN)
    wire PCM5102A_2_VCC = VCC;              // PCM5102A DAC2 Power
    wire PCM5102A_2_GND = GND;              // PCM5102A DAC2 Ground

    // SD Card Reader
    wire SD_CS = GPIO5_CS;           // SD Card Chip Select (CS)
    wire SD_CLK = GPIO18_CLK;        // SD Card Clock (CLK)
    wire SD_MISO = GPIO19_MISO;      // SD Card Data to ESP32 (MISO)
    wire SD_MOSI = GPIO23_MOSI;      // SD Card Data from ESP32 (MOSI)
    wire SD_VCC = VCC;               // SD Card Reader Power
    wire SD_GND = GND;               // SD Card Reader Ground

    // MAX98357A Amplifiers for Left, Right, and Center channels
    wire AMP1_VCC = VCC;             // Amplifier 1 (Left) Power
    wire AMP1_GND = GND;             // Amplifier 1 (Left) Ground
    wire AMP2_VCC = VCC;             // Amplifier 2 (Right) Power
    wire AMP2_GND = GND;             // Amplifier 2 (Right) Ground
    wire AMP3_VCC = VCC;             // Amplifier 3 (Center) Power
    wire AMP3_GND = GND;             // Amplifier 3 (Center) Ground

    // Connecting PCM5102A DACs to Amplifiers
    assign DAC1_L_OUT = PCM5102A_1_LCK;  // Left Channel Output to Amplifier 1
    assign DAC1_R_OUT = PCM5102A_1_DIN;  // Right Channel Output to Amplifier 2
    assign DAC2_L_OUT = PCM5102A_2_DIN;  // Center Channel Output to Amplifier 3

    // Amplifier outputs to speakers
    assign LEFT_SPEAKER = DAC1_L_OUT;  // Left Speaker
    assign RIGHT_SPEAKER = DAC1_R_OUT; // Right Speaker
    assign CENTER_SPEAKER = DAC2_L_OUT; // Center Speaker

endmodule
