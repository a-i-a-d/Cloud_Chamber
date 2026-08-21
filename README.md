# Peltier based Cloud Chamber

# Parts

## Buy
- Power adapter 220V->24V
https://www.amazon.de/Meanwell-Biltron-Schaltnetzteil-geschlossene-Struktur/dp/B07SVH2H3G/ref=sr_1_30
![power-adapter](images/parts/power_adapter.jpg)

- 1x CPU Cooler with Fan
https://www.amazon.de/dp/B0FMRXDHD6?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1
![cpu-cooler](images/parts/cpu_cooler.jpg)
![fan](images/parts/fan.jpg)

- 1x Peltier 12709
![peltier-12709](images/parts/peltier_12709.jpg)

- 1x Peltier 12715 
![peltier-12715](images/parts/peltier_12715.jpg)

- 1x Low Power Voltage Converter
![low-power-voltage-adjust](images/parts/low_power_voltage_adjust.jpg)

- 2x High Power Voltage Converter
https://www.amazon.de/dp/B09LLPQHCF?ref=ppx_yo2ov_dt_b_fed_asin_title
![high-power-voltage-adjust](images/parts/high_power_voltage_adjust.jpg)

- Copper Plate 5x5x0.3cm
https://www.amazon.de/dp/B098RTDXQK?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1
![copper-plate](images/parts/copper_plate.jpg)

- Acrylic Case 8x8x8cm 
![acrylic-case](images/parts/acrylic_case.jpg)

- Foam rubber 2mm
https://www.amazon.de/dp/B07JNZB8X1?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1
![foam-rubber](images/parts/foam_rubber.jpg)

- Heating Element 
https://www.amazon.de/dp/B0CTTNP7P9?ref=ppx_yo2ov_dt_b_fed_asin_title
![heating-element](images/parts/heating_element.jpg)

- Felt and Magnets
https://www.amazon.de/dp/B00WLSX5QU?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1
![felt-magnets](images/parts/felt_magnets.jpg)

- 12x WAGO Connector 2x
![wago-2x](images/parts/wago_2x.jpg)

- 2x WAGO Connector 5x
![wago-5x](images/parts/wago_5x.jpg)

- 5x Low Power Switches
![switch](images/parts/swich.jpg)

- Voltage Meter
![voltage-meter](images/parts/voltage_neter.jpg)

- LED Spotlights
https://www.amazon.de/dp/B0F9GCK1NC?ref=ppx_yo2ov_dt_b_fed_asin_title

- Heat pads
https://www.amazon.de/dp/B0B3N7184J?ref=ppx_yo2ov_dt_b_fed_asin_title

- Screws
- Silicone
- 220V power switch
- 220V power plug
- Cables

## Print
- Case Bottom 
![case-bottom](images/parts/case_bottom.jpg)
- Case Cover
![case-cover](images/parts/case_cover.jpg)
- Case Cooler Frame
![case-cooler-frame](images/parts/case_frame_cooler.jpg)
- Top Part
![top-part](images/parts/top_main.jpg)
- Top Insulation Cover
![top-insulation-cover](images/parts/top_insulation_cover.jpg)
- Top Insulation Stencil Copper 
![top-insulation-stencil-copper](images/parts/top_insulation_stencil_copper.jpg)
- Top Insulation Stencil Peltier
![top-insulation-stencil-peltier](images/parts/top_insulation_stencil_peltier.jpg)

# Schematic
![schematic](images/schematic/Schematic.jpg)


# Assembly

## 1. Bottom

- Install the 220V plug and switch
- Screw in the power adapter in the bottom of the case
- Screw in the 3 low power voltage adapter
- Glue in 2 WAGO-5x connectors
- Glue in 6 WAGO-2x connectors
- Connect all parts with cables
![](images/assembly/1a_bottom.jpg) 
![](images/assembly/1b_bottom.jpg) 

## 2. Adjust Voltages

- Connect a voltage meter to the three low power voltage adapters and adjust them
  - 12V for the fan
![](images/assembly/2a_meassure.jpg) 
  - 3.5V for the heating element
![](images/assembly/2b_meassure.jpg) 
  - 5V or 12Vfor the lighting
![](images/assembly/2c_meassure.jpg) 

## 3. Cover Under Side
- Solder cables to the low power switches
- Insert switches and voltage meter in the cover
- Glue in 7 WAGO-2x connectors
- Connect switches with WAGO connectors
- Insert power cables and voltage meter cables through cover
![](images/assembly/3a_cover_underside.jpg) 

## 4. Cover Upper Side
- Rotate cover and make sure power and voltage meter cables are available
![](images/assembly/4a_cover_upperside.jpg) 
- Screw in high power voltage converters
- Attach cables to out connectors of voltage converters 
![](images/assembly/4b_cover_upperside.jpg) 

## 5. Assemble Cooling Tower

Schematic of the cooling tower:
![schematic](images/schematic/Cooling_tower_schematics.jpg)
![](images/assembly/5a_cooling_tower.jpg)
![](images/assembly/5b_cooling_tower.jpg)
![](images/assembly/5c_cooling_tower.jpg)
![](images/assembly/5d_cooling_tower.jpg)
![](images/assembly/5e_cooling_tower.jpg)
![](images/assembly/5f_cooling_tower.jpg)
![](images/assembly/5g_cooling_tower.jpg)
![](images/assembly/5h_cooling_tower.jpg)
![](images/assembly/5i_cooling_tower.jpg)
![](images/assembly/5j_cooling_tower.jpg)
![](images/assembly/5k_cooling_tower.jpg)
![](images/assembly/5l_cooling_tower.jpg)
![](images/assembly/5m_cooling_tower.jpg)
![](images/assembly/5n_cooling_tower.jpg)
![](images/assembly/5o_cooling_tower.jpg)

## 6. Attach Cooling Tower
- Glue on the cooling frame
![](images/assembly/6a_attach_cooling_tower.jpg) 
- Stick in the cooling tower and fan into the frame
![](images/assembly/6b_attach_cooling_tower.jpg) 
![](images/assembly/6c_attach_cooling_tower.jpg) 

## 7. Connect Cooling Tower
- Connect the cables from the cooling tower with the underside of the cover
  - Heating element
  - 2x Peltier element
  - Light
![](images/assembly/7a_cover_underside.jpg) 

## 8. Connect Cover to Bottom
- Connect the power and ground connectors of the cover with the WAGO connectors in the bottom
![](images/assembly/8a_connect_cover_bottom.jpg) 
- Stick the 24V power cables through the cover and attach then to the in connectors of the voltage converters
![](images/assembly/8b_connect_cover_bottom.jpg) 
- Put cover on bottom and screw it in place

## 9. Add Heating Element
- Stick the heating element om top of the acrylic case
![](images/assembly/9a_heat_sticker.jpg) 


# Notes
