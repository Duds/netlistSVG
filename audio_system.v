module audio_system (
    input VCC,               // Power supply 5V
    input GND,               // Ground
    input GPIO14,            // I2S BCK for PCM5102A DAC1 (left and right)
    input GPIO25,            // I2S LCK for PCM5102A DAC1 (left and right)
    input GPIO23,            // I2S DIN for PCM5102A DAC1 (left and right)
    input GPIO13,            // I2S BCK for PCM5102A DAC2 (center)
    input GPIO12,            // I2S LCK for PCM5102A DAC2 (center)
    input GPIO4,             // I2S DIN for PCM5102A DAC2 (center)
    input GPIO5,             // SD card reader chip select (CS)
    input GPIO18,            // SD card reader clock (CLK)
    input GPIO19,            // SD card reader MISO
    input GPIO23_MOSI,       // SD card reader MOSI
    output LEFT_SPEAKER,     // Left speaker output
    output RIGHT_SPEAKER,    // Right speaker output
    output CENTER_SPEAKER    // Center speaker output
);

    // PCM5102A DAC1 (Left and Right Channels)
    wire DAC1_BCK = GPIO14;    // PCM5102A DAC1 Bit Clock (BCK)
    wire DAC1_LCK = GPIO25;    // PCM5102A DAC1 Word Select Clock (LCK)
    wire DAC1_DIN = GPIO23;    // PCM5102A DAC1 Data Input (DIN)

    // PCM5102A DAC2 (Center Channel)
    wire DAC2_BCK = GPIO13;    // PCM5102A DAC2 Bit Clock (BCK)
    wire DAC2_LCK = GPIO12;    // PCM5102A DAC2 Word Select Clock (LCK)
    wire DAC2_DIN = GPIO4;     // PCM5102A DAC2 Data Input (DIN)

    // SD Card Reader connections
    wire SD_CS = GPIO5;        // SD card chip select (CS)
    wire SD_CLK = GPIO18;      // SD card clock (CLK)
    wire SD_MISO = GPIO19;     // SD card MISO
    wire SD_MOSI = GPIO23_MOSI; // SD card MOSI

    // Speaker outputs from DAC1
    assign LEFT_SPEAKER = DAC1_LCK;  // Left speaker output connected to DAC1 L_OUT
    assign RIGHT_SPEAKER = DAC1_DIN; // Right speaker output connected to DAC1 R_OUT

    // Speaker output from DAC2
    assign CENTER_SPEAKER = DAC2_DIN; // Center speaker output connected to DAC2 L_OUT

endmodule
