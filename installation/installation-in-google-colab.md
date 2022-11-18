# Installation in Google Colab

You can run Reaktoro in [Google Colab](https://colab.research.google.com/). Create a new Jupyter notebook and paste this in the first cell:

~~~
!pip install -q condacolab
import condacolab
condacolab.install()
!conda config --add channels conda-forge
!conda install -y reaktoro
~~~

Execute this first cell, and then the code below in a new cell:

~~~python
from reaktoro import *

db = NasaDatabase("nasa-cea")

gases = GaseousPhase("CH4 O2 CO2 CO H2O H2")

system = ChemicalSystem(db, gases)

state = ChemicalState(system)
state.temperature(1000, "celsius")
state.pressure(100, "bar")
state.set("CH4", 1.0, "mol")
state.set("O2",  0.5, "mol")

equilibrate(state)

print(state)
~~~

Below is a screenshot showing the expected result of this guide when following the previous instructions:

![](../images/reaktoro-in-google-colab.png)

# Please help me installing Reaktoro!

If you had any problems with the instructions above, [please contact us](mailto:allan.leal@erdw.ethz.ch).
