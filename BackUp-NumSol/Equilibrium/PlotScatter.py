from numpy import *
from pylab import *

clf()

print 'Aspect ratio Long:'
Long = input()
print 'Aspect ratio Short:'
Short = input()
klong = str(Long)
kshort = str(Short)

rcParams['figure.figsize'] = 8, 8
Iso = loadtxt('Isotropic_' + klong +'_' + kshort + '.dat')
Nem = loadtxt('Nematic_' + klong +'_' + kshort + '.dat')

scatter(Iso[:,[0]],Iso[:,[1]], color = 'black', s = 100, marker = 'x', label = r'$Isotropic$')
scatter(Nem[:,[0]],Nem[:,[1]], color = 'red', s = 150, marker = 'o', label = r'$Nematic$')
xlim([0,1.0])
ylim([0,0.020])
xticks( fontsize = 23 , style='italic')
yticks( fontsize = 23 , style='italic')
xlabel(r'$Mole\,fraction:$ $x_{long}$', size = 35)
ylabel(r'$Reduced\,density:$ $ \rho^*$', size = 35)
legend(prop={"size":30})

savefig(klong + '_' + kshort +'_PhaseDiag.pdf', dpi=800, frameon = True, bbox_inches= 'tight')
show()