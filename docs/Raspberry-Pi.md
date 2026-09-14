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
| **Adafruit NeoPixel Library** | Arduino firmware engine. Simplifies C++ addressable array calls down to clean `strip.setPixelColor(index, R, G, B)` functions. | Standard library downloadable directly from the official **Arduino IDE Library Manager**. |

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
