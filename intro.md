![](images/reaktoro-for-python-and-cpp.svg)

# Reaktoro

Welcome to the documentation of Reaktoro, an open-source computational framework developed in C++ and Python for simulating chemically reactive processes.

Reaktoro has been designed from the beginning to be a general-purpose, flexible and extensible computational modeling framework for simulating chemical reactions. Reaktoro's algorithms for chemical equilibrium and chemical kinetics calculations can be applied for a wide variety of modeling applications, from geochemical modeling of water-gas-rock systems to combustion modeling of energetic materials.

Examples of specific and broad applications, for which Reaktoro can be helpful, include but are not limited to:

* speciation calculations in aqueous electrolyte solutions, seawater, groundwater
* gas dissolution in aqueous solutions
* mineral dissolution and precipitation in aqueous solutions
* mixing of aqueous and/or gaseous solutions
* evaporation processes
* ion exchange processes
* kinetically controlled reactions (e.g., mineral, aqueous, gaseous reactions)
* adiabatic flame temperatures at constant pressure or volume
* thermodynamic modelling of cement hydration and corrosion in concrete
* ore-forming processes
* hydrometallurgical process
* scaling in wells due to mineral precipitation
* carbon storage in geological media via solubility and mineral trapping mechanisms
* geologic disposal of radioactive waste
* geothermal energy systems involving carbon dioxide or electrolyte solutions

Reaktoro can also be coupled with other software (e.g., reservoir simulators) for modeling even more complex processes such as:

* reactive transport in porous media at the pore or reservoir scale
* reactive fluid flow for combustion modeling

For these large-scale modeling applications, in which millions to billions of chemical equilibrium and/or chemical kinetics calculations are needed, Reaktoro offers *on-demand machine learning* (ODML) accelerated solvers that can speed up the chemical reaction calculations by one to three orders of magnitude as demonstrated in {cite:t}`Leal2017b`, {cite:t}`Leal2020` and {cite:t}`Kyas2022`.

```{tableofcontents}
```
