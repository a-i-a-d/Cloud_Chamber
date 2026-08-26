# Peltier based Cloud Chamber

<p float="left">
 <img src="images/cloud_chamber_01.jpg" width="400">
 <img src="images/cloud_chamber_02.jpg" width="400">
</p>

This project is the documentation on how I built a Peltier element based cloud chamber. The motivation came from having most of the required parts laying around, and since it works quite well, here are instructions on how it is made. Please note that the Peltier elements I used did not consume the watttage accordings to the specs, so I assume them to be of inferior quality, and therefor will not provide links to where I got them. They do the job, but if they would work according to specs, they should provide even greater cooling. This project was not planned, but rather build as a proof of concept to see if the concept works at all, so there are many things that can be improved or changed, e.g. less glueing. Also, I did not make use of a high voltage field, it did not seem necessary but might be added at some point in the future. Everything is prepared for it (switch, location for power adapter), so it shouldn't be hard to add it.

# Parts

## To be bought

I had some parts laying around, but for the sake of completeness, I created a list with all parts and their price in Aug 2026 on Amazon.
The total value of the parts is about 250 Euro. Here a list with links.

| Part | Amazon Link | Image | Notes |
| --- | --- | --- | --- |
| Power adapter 220V->24V | [Amazon](https://www.amazon.de/Meanwell-Biltron-Schaltnetzteil-geschlossene-Struktur/dp/B07SVH2H3G/ref=sr_1_30) | <img alt="power-adapter" src="images/parts/power_adapter.jpg" width="200"> |  |
| 1x CPU Cooler with Fan | [Amazon](https://www.amazon.de/dp/B0FMRXDHD6?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) | <img alt="cpu-cooler" src="images/parts/cpu_cooler.jpg" width="200"><br><img alt="fan" src="images/parts/fan.jpg" width="200"> |  |
| 1x Peltier 12709 |  | <img alt="peltier-12709" src="images/parts/peltier_12709.jpg" width="200"> |  |
| 1x Peltier 12715 |  | <img alt="peltier-12715" src="images/parts/peltier_12715.jpg" width="200"> |  |
| 3x Low Power Voltage Converter | [Amazon](https://www.amazon.de/Yizhet-Stromversorgung-Abw%C3%A4rtswandler-Einstellbares-Abw%C3%A4rtsmodul/dp/B0823P6PW6/ref=sr_1_4?th=1) | <img alt="low-power-voltage-adjust" src="images/parts/low_power_voltage_adjust.jpg" width="200"> |  |
| 2x High Power Voltage Converter | [Amazon](https://www.amazon.de/dp/B09LLPQHCF?ref=ppx_yo2ov_dt_b_fed_asin_title) | <img alt="high-power-voltage-adjust" src="images/parts/high_power_voltage_adjust.jpg" width="200"> |  |
| 2x simple voltage meters | [Amazon](https://www.amazon.de/dp/B082ZLRY1Y?th=1) | <img alt="voltage meter" src="images/parts/voltage_meter.jpg" width="200"> |  |
| Copper Plate 5x5x0.3cm | [Amazon](https://www.amazon.de/dp/B098RTDXQK?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) | <img alt="copper-plate" src="images/parts/copper_plate.jpg" width="200"> | The image is not of the actual part, but a thinner plate |
| Acrylic Case 8x8x8cm | [Amazon](https://www.amazon.de/Pilikoll-Transparent-Geschenkbox-transparentf%C3%BCr-Aufbewahrung/dp/B0FVSGY3C1/ref=sr_1_1?th=1) | <img alt="acrylic-case" src="images/parts/acrylic_case.jpg" width="200"> |  |
| Foam rubber 2mm | [Amazon](https://www.amazon.de/dp/B07JNZB8X1?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) | <img alt="foam-rubber" src="images/parts/foam_rubber.jpg" width="200"> |  |
| Heating Element | [Amazon](https://www.amazon.de/dp/B0CTTNP7P9?ref=ppx_yo2ov_dt_b_fed_asin_title) | <img alt="heating-element" src="images/parts/heating_element.jpg" width="200"> |  |
| Felt | [Amazon](https://www.amazon.de/dp/B00WLSX5QU?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1) | <img alt="felt-magnets" src="images/parts/felt_magnets.jpg" width="200"> |  |
| Magnets | [Amazon](https://www.amazon.de/-/en/Wukong-Neodymium-Suitable-Whiteboards-Creative/dp/B0CP3N6QV3/ref=sr_1_36) | <img alt="felt-magnets" src="images/parts/felt_magnets.jpg" width="200"> |  |
| 12x WAGO Connector 2x | [Amazon](https://www.amazon.de/Wago-221-412-996-016-Verbindungsklemme-flexibel/dp/B09VZYVWBX/ref=sr_1_3_mod_primary_new) | <img alt="wago-2x" src="images/parts/wago_2x.jpg" width="200"> |  |
| 2x WAGO Connector 5x | [Amazon](https://www.amazon.de/Wago-221-415-Verbindungsklemme-5-Leiter-Bet%C3%A4tigungshebel/dp/B0107SYYGU/ref=sr_1_1?th=1) | <img alt="wago-5x" src="images/parts/wago_5x.jpg" width="200"> |  |
| 5x Low Power Switches | [Amazon](https://www.amazon.de/VUNIVERSUM-Kippschalter-Wippschalter-Schalter-Modellbau%C2%AE/dp/B07M5QMXDZ/ref=sr_1_16) | <img alt="switch" src="images/parts/switch.jpg" width="200"> |  |
| LED Spotlights | [Amazon](https://www.amazon.de/dp/B0F9GCK1NC?ref=ppx_yo2ov_dt_b_fed_asin_title) |  |  |
| Heat pads | [Amazon](https://www.amazon.de/dp/B0B3N7184J?ref=ppx_yo2ov_dt_b_fed_asin_title) |  |  |
| 220V power switch | [Amazon](https://www.amazon.de/Miratic-Unterbeleuchtet-Kippschalter-Schalter-Versorgungsspannung/dp/B0CRBCK8T4/ref=sr_1_45?th=1) |  |  |
| 220V power socket | [Amazon](https://www.amazon.de/PNGKNYOCN-IEC320-Stecker-Adapter-Sicherungshalter/dp/B0BWF5M677/ref=sr_1_3) |  |  |
| Screws |  |  |  |
| Silicone |  |  |  |
| Cables |  |  |  |


## To be printed

| Part | Image | Notes |
|------|-------|-------|
| Case Bottom | <img alt="case-bottom" src="images/parts/case_bottom.jpg" width="200"> | |
| Case Cover | <img alt="case-cover" src="images/parts/case_cover.jpg" width="200"> | |
| Case Cooler Frame | <img alt="case-cooler-frame" src="images/parts/case_frame_cooler.jpg" width="200"> | |
| Top Part | <img alt="top-part" src="images/parts/top_main.jpg" width="200"> | |
| Top Insulation Cover | <img alt="top-insulation-cover" src="images/parts/top_insulation_cover.jpg" width="200"> | |
| Top Insulation Stencil Copper | <img alt="top-insulation-stencil-copper" src="images/parts/top_insulation_stencil_copper.jpg" width="200"> | |
| Top Insulation Stencil Peltier | <img alt="top-insulation-stencil-peltier" src="images/parts/top_insulation_stencil_peltier.jpg" width="200"> | |
| Light Connector Box | <img alt="light-connector" src="images/parts/top_light_connector.jpg" width="200"> | |
| LED Carrier | <img alt="led-carrier" src="images/parts/top_led_carrier.jpg" width="200"> | |


## Other things required

- Voltage Meter - for adjusting the voltages<br>
- Soldering Iron, for soldering cables to the low power adapters, plugs and switches.


# Power Schematic
A simple diagram showing how everything gets connected. There is not much going on but voltage getting adjusted for different parts.
<img alt="schematic" src="images/schematic/Schematic.jpg" width="200">


# Assembly
Once all parts are printed, the assembly is pretty much straight forward.

## 1. Bottom

- Install the 220V plug and switch
- Screw in the power adapter in the bottom of the case
- Screw in the 3 low power voltage adapter
- Glue in 2 WAGO-5x connectors
- Glue in 6 WAGO-2x connectors
- Connect all parts with cables
<img src="images/assembly/1a_bottom.jpg" width="200"> 
<img src="images/assembly/1b_bottom.jpg" width="200"> 

## 2. Adjust Voltages

- Connect a voltage meter to the three low power voltage adapters and adjust them
  - 12V for the fan
<img src="images/assembly/2a_measure.jpg" width="200"> 
  - 3.5V for the heating element
<img src="images/assembly/2b_measure.jpg" width="200"> 
  - 5V or 12V for the lighting
<img src="images/assembly/2c_measure.jpg" width="200"> 

## 3. Cover Under Side
- Solder cables to the low power switches
- Insert switches and voltage meter in the cover
- Glue in 7 WAGO-2x connectors
- Connect switches with WAGO connectors
- Insert power cables and voltage meter cables through cover
<img src="images/assembly/3a_cover_underside.jpg" width="200"> 

## 4. Cover Upper Side
- Rotate cover and make sure power and voltage meter cables are available
<img src="images/assembly/4a_cover_upperside.jpg" width="200"> 
- Screw in high power voltage converters
- Attach cables to out connectors of voltage converters 
<img src="images/assembly/4b_cover_upperside.jpg" width="200"> 

## 5. Assemble Cooling Tower

Schematic of the cooling tower:
<img alt="schematic" src="images/schematic/Cooling_tower_schematics.jpg" width="200">
<img src="images/assembly/5a_cooling_tower.jpg" width="200">
<img src="images/assembly/5b_cooling_tower.jpg" width="200">
<img src="images/assembly/5c_cooling_tower.jpg" width="200">
<img src="images/assembly/5d_cooling_tower.jpg" width="200">
<img src="images/assembly/5e_cooling_tower.jpg" width="200">
<img src="images/assembly/5f_cooling_tower.jpg" width="200">
<img src="images/assembly/5g_cooling_tower.jpg" width="200">
<img src="images/assembly/5h_cooling_tower.jpg" width="200">
<img src="images/assembly/5i_cooling_tower.jpg" width="200">
<img src="images/assembly/5j_cooling_tower.jpg" width="200">
<img src="images/assembly/5k_cooling_tower.jpg" width="200">
<img src="images/assembly/5l_cooling_tower.jpg" width="200">
<img src="images/assembly/5m_cooling_tower.jpg" width="200">
<img src="images/assembly/5n_cooling_tower.jpg" width="200">
<img src="images/assembly/5o_cooling_tower.jpg" width="200">

## 6. Attach Cooling Tower
- Glue on the cooling frame
<img src="images/assembly/6a_attach_cooling_tower.jpg" width="200"> 
- Stick in the cooling tower and fan into the frame
<img src="images/assembly/6b_attach_cooling_tower.jpg" width="200"> 
<img src="images/assembly/6c_attach_cooling_tower.jpg" width="200"> 

## 7. Connect Cooling Tower
- Connect the cables from the cooling tower with the underside of the cover
  - Heating element
  - 2x Peltier element
  - Light
<img src="images/assembly/7a_cover_underside.jpg" width="200"> 

## 8. Connect Cover to Bottom
- Connect the power and ground connectors of the cover with the WAGO connectors in the bottom
<img src="images/assembly/8a_connect_cover_bottom.jpg" width="200"> 
- Stick the 24V power cables through the cover and attach then to the in connectors of the voltage converters
<img src="images/assembly/8b_connect_cover_bottom.jpg" width="200"> 
- Put cover on bottom and screw it in place

## 9. Add Heating Element
- Stick the heating element om top of the acrylic case
<img src="images/assembly/9a_heat_sticker.jpg" width="200"> 

## 10. Add lights


# Notes
