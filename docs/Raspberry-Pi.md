# 🛠️ Hardware Integration & Deployment Guide

This document outlines the hardware components, electrical protections, and system configurations required to run the **MakeChessBetter** Lichess bot on a dedicated microcomputing stack with a physical LED board matrix.

## 🧱 Component Checklist & System Architecture

| Item / Component | System Functionality & Details | Key Specifications / Selection |
| :--- | :--- | :--- |
| **Raspberry Pi 5 (4GB)** | Main system host. Runs Raspberry Pi OS, executes the Python engine, processes the live Lichess stream, handles SQL match logs, and calculates CPU threads. | 4GB RAM Model (Provides optimal overhead for Stockfish 16+ without memory bottlenecking). Requires an official Raspberry Pi 27W USB-C PD power supply to prevent CPU throttling. |
| **Raspberry Pi Active Cooler** | Thermal Management. Keeps the Pi 5's Broadcom CPU cool during intensive heavy engine path depth analysis. | Official Raspberry Pi 5 Active Cooler (Fits directly onto the board's push-pin mounts). |
| **Arduino Nano V3.0 OR Uno R3** | Microcontroller layer. Plugs via USB into the Pi 5, receives JSON chess coordinates, and maps them to physical LED indices. | **Dual-Purchase Hybrid Strategy:** <br>• **Option A: Arduino Uno R3 (ATmega328P)** – Used as a spacious bench prototyping board for active debugging. Requires a **USB Type-A to Type-B cable**.<br>• **Option B: Arduino Nano V3.0 (ATmega328P with headers)** – Keeps identical code but uses a tiny footprint to fit inside the final board enclosure. Requires a **Mini-B or Micro-USB cable**. |
| **WS2812B LED Strip (1m / 60 LEDs)** | Addressable RGB grid matrix. Lights up move origins (Red) and move destinations (Green) dynamically over a single data line. | 5V Addressable RGB Strip, 60 LEDs/m, IP30 Non-Waterproof (ideal for tight custom enclosure routing). |
| **5V 5A Power Adapter** | **Upgraded/Replaced 5V Wall Adapter.** Dedicated high-amperage external power supply to feed the power-hungry LED strip. Prevents the Pi or Arduino from browning out when lighting multiple cells simultaneously. | 5V 5A DC switching power brick with a Female DC Barrel Jack Terminal adapter. |
| **Solderless Breadboard** | Prototyping workspace. Allows you to route 5V power rails, grounds, resistors, and controller pins together cleanly without using a soldering iron during development. | 830 Point Full-Size Breadboard with independent split power rails (+/-). |
| **Jumper Wires Set** | Physical bus system. Male-to-Male (M-M) pins jump signals across the breadboard. Male-to-Female (M-F) pins connect the raw copper pads of the LED strip or external components directly back to the boards. | 40-pin Male-to-Male (M-M) + 40-pin Male-to-Female (M-F) flexible wire set. |
| **Circuit Protection Kit** | Safety layer. Prevents transient voltage spikes from blowing out your microcontroller logic pins or frying the first pixel of your addressable LED strip. | • **1x 470Ω Resistor** (placed inline on the data wire)<br>• **1x 1000µF Electrolytic Capacitor** (rated 6.3V or higher, placed across the main 5V/GND power rails). |
| **20 AWG Hook-Up Wire** | Power distribution bus. Thick copper cabling handles the 5-Amp external current load without dangerous overheating or signal voltage drop. | Solid-core 20 AWG gauge spool (Red for 5V, Black for GND). |
| **64GB MicroSD Card OR USB 3.0 Flash Drive** | Primary Boot Media & Storage. Holds Raspberry Pi OS Lite, Stockfish engine binaries, Python scripts, and persistent SQLite match databases. | 64GB capacity (Class 10 / A1 or A2 MicroSD, or USB 3.0 Flash Drive). Provides fast I/O speeds and plenty of storage overhead. |
| **Adafruit NeoPixel Library** | Arduino firmware engine. Simplifies C++ addressable array calls down to clean `strip.setPixelColor(index, R, G, B)` functions. | Standard library downloadable directly from the official **Arduino IDE Library Manager**. |
| **Physical Chess Board & Enclosure** | **Housing & Frame.** Contains the Raspberry Pi 5, Arduino, power supply, and LED grid underneath the board. | Wood, 3D-printed plastic, or acrylic frame with translucent or frosted square cuts so LED light passes through. |
| **Light Diffusers** | **Visual Softening.** Spreads out raw LED point lights into evenly lit square highlights for clearer move visibility. | White translucent acrylic sheets or silicone channel diffusers cut to square dimensions. |
| **Brass Standoffs & Screws** | **Component Mounting.** Elevates the Pi 5 and Arduino off board surfaces to prevent circuit shorts and ensure airflow. | M2.5 / M3 motherboards brass standoffs set with matching nuts/screws. |
| **Soldering Iron & Solder** | **Permanent Wiring.** Secures permanent power and data wires onto raw LED strip copper pads after breadboard testing. | 60W temperature-controlled soldering iron with rosin-core solder. |
| **Heat-Shrink Tubing** | **Insulation Safety.** Covers bare solder joints on power and data lines to prevent short circuits inside the frame. | Assorted diameter heat-shrink tubing set (or electrical tape as an alternative). |
| **Hot Glue Gun / Mounting Tape** | **Strip Alignment.** Secures cut LED strips in straight rows directly beneath the chess board squares. | High-temp hot glue gun with sticks, or heavy-duty double-sided foam mounting tape. |
| **MicroSD USB Card Reader** | **OS Flashing.** Plugs the MicroSD card into your primary PC or laptop to burn Raspberry Pi OS Lite via Raspberry Pi Imager. | Standard USB-A or USB-C SD/MicroSD flash memory card reader adapter. |
| **Chess Piece Magnets** | **Piece Detection.** Small neodymium magnets embedded in the bases of physical chess pieces to trigger sensors when placed on squares. | 6mm x 2mm N35 or N42 Neodymium Disc Magnets (32 required for a standard set). |
| **Reed Switches OR Hall Effect Sensors** | **Automatic Move Input.** Embedded under each of the 64 squares to sense physical piece movement without needing manual typing/clicking. | 64x Dry Reed Switches (or Hall Effect Sensors) arranged in an 8x8 matrix grid with 1N4148 signal diodes. |
| **Shift Registers (e.g., 74HC165 / MCP23017)** | **Sensor Multiplexing.** Allows the Arduino to read state changes across all 64 square sensors using just a few digital GPIO pins. | 8x 74HC165 8-bit parallel-to-serial shift registers OR 1x MCP23017 I2C port expander IC. |
| **Tactile Push Buttons** | **Board Control Inputs.** Allows physical buttons on the frame to trigger actions like starting a game, requesting a hint, or undoing a move. | 12mm x 12mm Momentary Tactile Push Buttons with caps. |
| **Small OLED Display (e.g., SSD1306)** | **Local HUD.** Shows live match info (game clock, engine evaluation score, connection status, opponent username) right on the board. | 0.96-inch 128x64 I2C OLED Display module (Blue or White). |
| **Logic Level Shifter (e.g., 74AHCT125)** | **Signal Voltage Boosting.** Steps up the 3.3V logic signal from the Pi/microcontroller to a clean 5V logic signal required by WS2812B LEDs to eliminate signal noise or sporadic flashing. | 74AHCT125 Quad Bus Buffer IC or 4-channel bi-directional logic level converter board. |
| **Flush Wire Cutters & Strippers** | **Precision Cable Prep.** Snips jumper leads, trims excess component legs flush against boards, and strips wire insulation cleanly. | Precision diagonal wire cutters (e.g., Plato/Xcelite) and 20–30 AWG wire strippers. |
| **Multimeter** | **Circuit Diagnostics.** Measures line voltages, tests ground continuity, and checks for short circuits before powering components on. | Digital multimeter with continuity beep and DC voltage testing modes. |
| **Physical Power Switch / Toggle** | **Hardware Power Control.** Safely cuts high-amperage 5V power to the LED matrix without physically unplugging barrel jack connectors. | SPST/SPDT Heavy-duty toggle switch rated for at least 5A DC. |
| **Safety Glasses / Goggles** | **Eye Protection.** Prevents flying solder splatters, trimmed wire ends, or snapping component leads from injuring your eyes during assembly. | Standard clear ANSI Z87.1 rated polycarbonate safety glasses. |
| **Isopropyl Alcohol (IPA) & Brush** | **PCB & Pad Cleaning.** Cleans off flux residue left after soldering LED strips or wire connections to prevent long-term corrosion. | 90%+ Isopropyl Alcohol with an ESD-safe soft bristle brush or cotton swabs. |
| **Cable Zip Ties & Sticky Clips** | **Cable Management.** Bundles long power and USB cables neatly inside the board housing so they don't block airflow or pinch under panels. | Small 4-inch nylon cable ties and self-adhesive wire routing clips. |
| **Electrical Tape / Kapton Tape** | **Thermal & Electrical Shielding.** Provides heat-resistant insulation over exposed board contacts or under custom-mounted microcontrollers. | High-temperature Kapton tape (polyimide) or standard PVC electrical tape. |
| **Reed Switches OR Hall Sensors** | **Automatic Move Sensing.** Detects piece placement under each of the 64 squares without requiring manual input. | 64x Dry Reed Switches or Hall Effect Sensors with 1N4148 diodes. |
| **0.96-inch OLED Display (SSD1306)** | **On-Board HUD.** Displays real-time evaluation scores, game clocks, and Lichess connection status directly on the frame. | 128x64 I2C OLED Display module (Blue or White). |
---

## 💾 Core Operating System Setup
The Raspberry Pi 5 runs **Raspberry Pi OS (64-bit, Bookworm)**. Because this is a dedicated chess server device, it is highly recommended to flash the **Raspberry Pi OS Lite** version via the Raspberry Pi Imager. This completely strips away the heavy graphical interface (GUI), maximizing CPU allocation for raw Stockfish engine calculations.

---

## ⚡ Prototyping Basics: Breadboards & Jumper Wires
If you have never used a solderless breadboard before, remember these mechanical routing layouts to avoid accidental short circuits:
* **The Power Rails:** The long rows running down the left and right sides marked with **Red (+)** and **Blue (-)** are connected *vertically* all the way down the board. Plug your external 5V 5A power supply pins directly into these.
* **The Terminal Strips:** The middle rows numbered 1 to 60 are connected *horizontally* in groups of 5 holes (letters A-E are connected together, and letters F-J are connected together). The center divider trench separates them.
* **Jumper Etiquette:** Use your **Male-to-Male (M-M)** wires to link the horizontal rows together. Use **Male-to-Female (M-F)** wires to hook up components that don't fit natively on a breadboard grid, like your cut LED strips.

---

## 🛡️ Critical Power & Wiring Protection Rules

To avoid frying your components during operation, adhere strictly to these electrical guardrails:
1. **Common Ground:** The ground (`GND`) pin from the Arduino **must** be physically tied to the negative (`-`) rail of the breadboard carrying the external 5V 5A power adapter. Without a shared ground reference point, the data signal to the LEDs will drop out, causing violent flickering.
2. **Isolate LED Power:** Never power the WS2812B strip directly from the Arduino's 5V pin or the Pi 5's USB port. The strip can pull up to 3.6 Amps at full white brightness, which will instantly blow the regulators on your microcontrollers. The strip's power lines must run directly to your external 5V 5A adapter power rails.
3. **Data Protection (The 470Ω Resistor):** Place your **470Ω resistor** inline between the Arduino's Digital Data Output Pin (e.g., `D6`) and the data input pad (`DIN`) of the LED strip. This prevents initial voltage spikes from killing the highly sensitive integrated controller chip inside the very first LED.
4. **Power Smoothing (The 1000µF Capacitor):** Connect the **1000µF capacitor** across the positive and negative power rails of the breadboard as close to the LED strip input wires as possible. **Crucial Polarity Check:** Ensure the side of the capacitor marked with a minus sign `(-)` goes into the Ground rail, or the capacitor will rupture.
