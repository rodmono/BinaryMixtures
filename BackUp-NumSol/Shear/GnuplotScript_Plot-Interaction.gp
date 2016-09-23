set pm3d map
unset key
set size square
set cbrange[1:6]

set cbtics scale 0
set cbtics ("A" 1, "T" 2, "W" 3, "KT" 4, "KW" 5)
set palette maxcolors 5
set palette defined ( 0 '#D53E4F',\
1 '#F46D43',\
2 '#FEE08B',\
3 '#E6F598',\
4 '#66C2A5',\
5 '#3288BD')


# Define Tics font and size
set xtics font "Times-Italic, 20" rotate by 15
set ytics font "Times-Italic, 20" rotate by 15
set cbtics font "Times-Italic, 20" offset 0,1.75

set xrange [0.25:6.85]
set yrange [3.15:14.5]

set macros

# MACROS
# x- and ytics for each row resp. column
XTICS = "set xtics ;\
          set xlabel '{/Symbol q}_{AB}' font 'Times-Italic,30' offset 0,-0.75"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'Shear rate: ~{/Symbol g}{.8.}' font 'Times-Italic,30' offset -3.5,0"

# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.75; set bmargin at screen 0.25"
BMARGIN = "set tmargin at screen 0.75; set bmargin at screen 0.25"
LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.50"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.90"

# Placement of the a,b labels in the graphs
POS = "at graph 0.85,0.85 tc rgb 'white' font ',25' front" 

set term postscript color enhanced 
# set out 'TumbB_TA-05_TB-05-TAB-1.eps'
set out 'Inter_TA-075_TB-075_DL-1.eps'

set pm3d map
unset key
unset colorbox
### Start multiplot (1x2 layout)
set multiplot layout 1,2 
# --- GRAPH a
@TMARGIN; @LMARGIN
@XTICS; @YTICS
set label 1 'a' @POS
splot 'Plot_ComponentA_TumblingA_1.2_TumblingB_2_Shear0-15_ThetaA_-0.75_ThetaB_-0.75_ThetaAB_0.15-12_Sigma_0.dat' with image
# --- GRAPH b
set colorbox size 0.75, 0.05
@TMARGIN; @RMARGIN
@XTICS; @NOYTICS
set label 1 'b' @POS 
splot 'Plot_ComponentB_TumblingA_1.2_TumblingB_2_Shear0-15_ThetaA_-0.75_ThetaB_-0.75_ThetaAB_0.15-12_Sigma_0.dat' with image
unset multiplot
### End multiplot
