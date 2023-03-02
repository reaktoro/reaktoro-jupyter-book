![](images/reaktoro-for-python-and-cpp.svg)

# Reaktoro

Welcome to the documentation for Reaktoro, an open source computational framework developed in C++ and Python to simulate chemically reactive processes.

Reaktoro has been designed from the ground up to be a flexible and extensible computational modeling framework for simulating chemical reactions. Reaktoro's algorithms for chemical equilibrium and chemical kinetics calculations can be applied in a wide variety of modeling applications, from geochemical modeling of water-gas-rock systems to modeling the combustion of energetic materials.

Examples of specific and broad applications that Reaktoro can be useful for include, but are not limited to:

* speciation calculations in aqueous electrolyte solutions, seawater, groundwater
* dissolution of gas in aqueous solutions
* mineral dissolution and precipitation in aqueous solutions
* mixing of aqueous and/or gaseous solutions
* evaporation processes
* ion exchange processes
* kinetically controlled reactions (e.g., mineral, aqueous, gaseous reactions)
* adiabatic flame temperatures at constant pressure or volume
* thermodynamic modeling of cement hydration and corrosion in concrete
* ore formation processes
* hydrometallurgical process
* fluid-rock chemical reactions in geothermal energy systems
* scaling in wells due to mineral precipitation
* carbon storage in geological media via solubility and mineral trapping mechanisms
* geological disposal of radioactive waste

Reaktoro can also be coupled with other software (e.g. reservoir simulators) to model even more complex processes such as:

* reactive transport in porous media at pore or reservoir scale
* reactive fluid flow for combustion modeling

For large-scale modeling applications where millions to billions of chemical equilibrium and/or chemical kinetics calculations are required, Reaktoro offers accelerated ***on-demand machine learning*** (ODML) solvers that can speed up chemical reaction calculations by one to three orders of magnitude as demonstrated in {cite:t}`Leal2017b`, {cite:t}`Leal2020` and {cite:t}`Kyas2022`.

```{tableofcontents}
```
