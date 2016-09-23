# Fisher's equation

from fipy import *
from math import sin

nx       = 50
dx       = 1
mesh     = Grid1D(nx=nx, dx=dx)

# Diffusion and reaction coefficients
Du        = 1.0
ku        = 1.0
Dv        = 0.5
kv        = 0.5

dt       = 0.9*dx**2/(2*0.5*(Du+Dv))
steps    = 250


# Initial conditions for u and v
x        = mesh.cellCenters[0]

u        = CellVariable(name=r"$u$", mesh=mesh)
u.value  = 0.0
u.setValue(1., where=(x > nx*dx/2. - nx*dx/10.) & (x < nx*dx/2. + nx*dx/10.))

v        = CellVariable(name=r"$v$", mesh=mesh)
v.value  = 0.0
v.setValue(1., where=(x > nx*dx/2. - nx*dx/15.) & (x < nx*dx/2. + nx*dx/15.))

if __name__ == '__main__':
	viewer = Viewer(vars=(u,v), datamin=-2.1, datamax=2.1)


# Boundary conditions, not given (no--flux)
Sou      = -ku*v*(1. - u) 
Sov      = kv*u*(1. - v) 
equ      = TransientTerm() == DiffusionTerm(coeff=Du) + Sou
eqv      = TransientTerm() == DiffusionTerm(coeff=Dv) + Sov

# The actual integration of the equation is done here
for step in range(steps):
	equ.solve(var=u,dt=dt, solver=DummySolver())
	eqv.solve(var=v,dt=dt, solver=DummySolver())
	if __name__ == '__main__':
		viewer.plot()
if __name__ == '__main__':
		raw_input('No-flux transient.')


