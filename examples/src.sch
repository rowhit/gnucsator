<Qucs Schematic >
<Properties>
  <View=-417,0,1187,967,1.65,76,0>
  <Grid=10,10,1>
  <DataSet=src.dat>
  <DataDisplay=src.dpl>
  <OpenDisplay=1>
  <Script=src.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <VProbe Pr1 1 390 330 28 -31 0 0>
  <GND * 1 400 410 0 0 0 0>
  <GND * 1 520 240 0 0 0 0>
  <Vrect V1 1 120 250 18 -26 0 1 "1 V" 1 "1 ms" 1 "1 ms" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
  <GND * 1 120 410 0 0 0 0>
  <R R2 1 370 190 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <CCVS SRC1 1 290 220 -26 34 0 0 "10 Ohm" 1 "0" 0>
  <C C1 1 430 190 -26 17 0 0 "4.7u" 1 "" 0 "neutral" 0>
  <CCCS SRC2 1 550 160 -26 34 0 0 "1" 1 "0" 0>
  <GND * 1 580 190 0 0 0 0>
  <IProbe Pr2 1 610 130 -26 16 0 0>
  <GND * 1 640 130 0 0 0 0>
  <.TR TR1 1 560 380 0 184 0 0 "lin" 1 "0" 1 "10m" 1 "101" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <R R1 1 180 190 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <VProbe Pr3 1 0 180 28 -31 0 0>
</Components>
<Wires>
  <400 350 400 400 "" 0 0 0 "">
  <120 280 120 400 "" 0 0 0 "">
  <400 400 400 410 "" 0 0 0 "">
  <120 400 260 400 "" 0 0 0 "">
  <120 400 120 410 "" 0 0 0 "">
  <320 170 330 170 "" 0 0 0 "">
  <320 170 320 190 "" 0 0 0 "">
  <260 400 320 400 "" 0 0 0 "">
  <260 250 260 400 "" 0 0 0 "">
  <320 400 400 400 "" 0 0 0 "">
  <320 250 320 400 "" 0 0 0 "">
  <520 190 520 240 "" 0 0 0 "">
  <460 190 520 190 "" 0 0 0 "">
  <330 170 330 190 "" 0 0 0 "">
  <330 190 340 190 "" 0 0 0 "">
  <380 350 380 380 "" 0 0 0 "">
  <340 380 380 380 "" 0 0 0 "">
  <340 210 340 380 "" 0 0 0 "">
  <340 210 400 210 "" 0 0 0 "">
  <400 190 400 210 "" 0 0 0 "">
  <260 130 260 190 "" 0 0 0 "">
  <260 130 520 130 "" 0 0 0 "">
  <210 190 260 190 "" 0 0 0 "">
  <120 190 120 220 "" 0 0 0 "">
  <120 190 150 190 "" 0 0 0 "">
  <-10 220 120 220 "" 0 0 0 "">
  <-10 200 -10 220 "" 0 0 0 "">
  <10 200 10 280 "" 0 0 0 "">
  <10 280 120 280 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 40 720 240 160 3 #c0c0c0 1 00 1 0 0.002 0.01 1 -1 1 1 1 -1 1 1 315 0 225 "" "" "" "">
	<"Pr1.Vt" #0000ff 0 3 0 0 0>
	<"V1.It" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 900 790 240 160 3 #c0c0c0 1 00 1 0 0.002 0.01 1 -0.00987707 0.05 0.108648 1 -1 1 1 315 0 225 "" "" "" "">
	<"Pr2.It" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect -200 500 240 160 3 #c0c0c0 1 00 1 0 0.002 0.01 1 -0.022 0.01 0.002 1 -1 1 1 315 0 225 "" "" "" "">
	<"Pr3.Vt" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
