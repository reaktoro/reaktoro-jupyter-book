# Loading thermodynamic databases

<p class="acknowledgement">Written by Allan Leal (ETH Zurich) on Jan 5th, 2022

Reaktoro requires thermodynamic databases to calculate the thermodynamic properties of chemical species and reactions. These properties are necessary when performing chemical equilibrium and kinetics calculations.

Examples of such thermodynamic properties for a species $i$ include:

* standard molar Gibbs energy, $G_i^\circ$
* standard molar Helmholtz energy, $A_i^\circ$
* standard molar enthalpy, $H_i^\circ$
* standard molar internal energy, $U_i^\circ$
* standard molar entropy, $S_i^\circ$
* standard molar volume, $V_i^\circ$
* standard molar heat capacity (constant pressure), $C_{P,i}^\circ$
* standard molar heat capacity (constant volume), $C_{V,i}^\circ$

The standard thermodynamic properties of the above species can be used to calculate reaction properties, such as the following for a reaction $m$:

* equilibrium constant of reaction, $K_m$
* standard Gibbs energy of reaction, $\Delta G_m^\circ$
* standard enthalpy of reaction, $\Delta H_m^\circ$

Reaktoro currently supports thermodynamic databases from the following providers:

* [PHREEQC](https://www.usgs.gov/software/phreeqc-version-3)
* [ThermoFun](https://thermohub.org/thermofun/thermofun/)
* [SUPCRT](https://www.sciencedirect.com/science/article/pii/009830049290029Q)
* [SUPCRTBL](https://models.earth.indiana.edu/supcrtbl.php)
* [NASA](https://www1.grc.nasa.gov/research-and-engineering/ceaweb/)

The following classes exist for loading thermodynamic databases:

* {{PhreeqcDatabase}}
* {{SupcrtDatabase}}
* {{ThermoFunDatabase}}
* {{NasaDatabase}}

```{note}
All these classes derive from the {{Database}} class. They exist to provide you additional convenience and functionality.
```

Read the next sections to learn how different thermodynamic databases from distinct providers can be loaded in Reaktoro.

## PHREEQC Databases

[PHREEQC](https://www.usgs.gov/software/phreeqc-version-3) {cite}`Parkhurst2013` is a well-known scientific software used for geochemical and biogeochemical modelling, and many thermodynamic databases have been compiled for it in the last decades. If you'd like to use Reaktoro with PHREEQC databases, we've got you covered. You can do this using a database file available on your computer or one of the following database files embedded into Reaktoro (those provided with PHREEQC v3):

* [Amm.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/Amm.dat)
* [ColdChem.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/ColdChem.dat)
* [core10.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/core10.dat)
* [frezchem.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/frezchem.dat)
* [iso.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/iso.dat)
* [llnl.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/llnl.dat)
* [minteq.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/minteq.dat)
* [minteq.v4](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/minteq.v4)
* [phreeqc.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/phreeqc.dat)
* [pitzer.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/pitzer.dat)
* [sit.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/sit.dat)
* [Tipping_Hurley.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/Tipping_Hurley.dat)
* [wateq4f.dat](https://github.com/reaktoro/reaktoro/tree/main/databases/phreeqc/wateq4f.dat)

### Loading embedded PHREEQC database files

The following are equivalent ways to load embedded PHREEEQC database files:

```python3
db = PhreeqcDatabase("phreeqc.dat")
db = PhreeqcDatabase.withName("phreeqc.dat")
```

### Loading locally available PHREEQC database files

The following are equivalent ways to load the same PHREEQC database file from
your computer:

```{tab} Linux and macOS
~~~
db = PhreeqcDatabase()
db.load("/home/username/databases/phreeqc.dat")

db = PhreeqcDatabase.fromFile("/home/username/databases/phreeqc.dat")
~~~
```
```{tab} Windows
~~~
db = PhreeqcDatabase()
db.load("C:\\Users\\Username\\databases\\phreeqc.dat")

db = PhreeqcDatabase.fromFile("C:\\Users\\Username\\databases\\phreeqc.dat")
~~~
```

## ThermoFun Databases

[ThermoFun](https://thermohub.org/thermofun/thermofun/) is an open-source C++/Python library for the computation of thermodynamic properties of species and reactions. It supports many databases for a wide variety of applications. The following are the currently supported database files:

* [aq17-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/aq17-thermofun.json)
* [cemdata18-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/cemdata18-thermofun.json)
* [heracles-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/heracles-thermofun.json)
* [mines16-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/mines16-thermofun.json)
* [psinagra-12-07-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/psinagra-12-07-thermofun.json)
* [slop98-organic-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/slop98-organic-thermofun.json)
* [slop98-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/slop98-thermofun.json)

### Loading embedded ThermoFun database files

ThermoFun databases are also available in embedded form in Reaktoro for convenience. You need to use one of the following database names:

* `aq17`
* `cemdata18`
* `heracles`
* `mines16`
* `psinagra-12-07`
* `slop98-organic`
* `slop98`

The following are equivalent ways to load the same embedded ThermoFun database file:

```python3
db = ThermoFunDatabase("cemdata18")
db = ThermoFunDatabase.withName("cemdata18")
```

### Loading locally available ThermoFun database files

The following are equivalent ways to load the same ThermoFun database file from
your computer:

```{tab} Linux and macOS
~~~
db = ThermoFunDatabase()
db.load("/home/username/databases/mines16-thermofun.json")

db = ThermoFunDatabase.fromFile("/home/username/databases/mines16-thermofun.json")
~~~
```
```{tab} Windows
~~~
db = ThermoFunDatabase()
db.load("C:\\Users\\Username\\databases\\mines16-thermofun.json")

db = ThermoFunDatabase.fromFile("C:\\Users\\Username\\databases\\mines16-thermofun.json")
~~~
```

## SUPCRT and SUPCRTBL Databases

SUPCRT {cite}`Johnson1992` and SUPCRTBL {cite}`Zimmer2016a` databases contain thousands of chemical species (aqueous species, gases, minerals) and are commonly used for biogeochemical modeling applications. These thermodynamic databases contain parameters for equations of state to permit the computation of standard molal thermodynamic properties of minerals, gases, aqueous species, and reactions from 1 to 5000 bar and 0 to 1000°C. The theory behind these equations and their derivation can be found across the following publications: {cite:t}`Helgeson1974,Helgeson1974a,Helgeson1976,Helgeson1981,Tanger1988,Shock1992`.

### Loading embedded SUPCRT and SUPCRTBL database files

SUPCRT and SUPCRTBL databases are supported in Reaktoro's database format using
[YAML](https://yaml.org/). The currently available embedded database files are
listed below:

* [supcrt98.yaml](https://github.com/reaktoro/reaktoro/tree/main/databases/reaktoro/supcrt98.yaml)
* [supcrt07.yaml](https://github.com/reaktoro/reaktoro/tree/main/databases/reaktoro/supcrt07.yaml)
* [supcrt16.yaml](https://github.com/reaktoro/reaktoro/tree/main/databases/reaktoro/supcrt16.yaml)
* [supcrtbl.yaml](https://github.com/reaktoro/reaktoro/tree/main/databases/reaktoro/supcrtbl.yaml)

The following are equivalent ways to load the same embedded SUPCRT/SUPCRTBL database file:

```python3
db = SupcrtDatabase("supcrtbl")
db = SupcrtDatabase.withName("supcrtbl")
```

### Loading locally available SUPCRT and SUPCRTBL database files

The following are equivalent ways to load the same SUPCRT or SUPCRTBL database file from
your computer:

```{tab} Linux and macOS
~~~
db = SupcrtDatabase()
db.load("/home/username/databases/supcrt98.yaml")

db = SupcrtDatabase.fromFile("/home/username/databases/supcrt98.yaml")
~~~
```
```{tab} Windows
~~~
db = SupcrtDatabase()
db.load("C:\\Users\\Username\\databases\\supcrt98.yaml")

db = SupcrtDatabase.fromFile("C:\\Users\\Username\\databases\\supcrt98.yaml")
~~~
```

## NASA Databases

Reaktoro also supports the NASA-CEA thermochemical database {cite}`Gordon1994a,Gordon1996`. These contain coefficients for NASA-CEA polynomials used to calculate the standard thermodynamic properties of gases and condensed phases. The NASA-CEA database is commonly used for modeling combustion processes in various applications, from rocket propellant combustion to explosives detonation.

The NASA-CEA database supported in Reaktoro has been converted to Reaktoro's YAML database format:

* [nasa-cea.yaml](https://github.com/reaktoro/reaktoro/tree/main/databases/reaktoro/nasa-cea.yaml).

This file was constructed by parsing the [original NASA-CEA thermochemical database file](https://github.com/reaktoro/reaktoro/tree/main/utilities/nasa-parser/nasa-cea.dat) and converting it to Reaktoro's YAML format.

```{attention}
NASA-CEA database is organized differently in Reaktoro's YAML database format. In the original NASA-CEA database, identical substances in different physical states and crystal structures (e.g., `Mg(L)` and `Mg(cr)`; `MgSO4(II)`, `MgSO4(I)` and `MgSO4(L)`) are considered distinct chemical species. In Reaktoro's YAML format, these chemical species are combined into one (e.g., `Mg(cd)`, `MgSO4(cd)`). This was done after observing improved performance and behavior in Reaktoro's chemical equilibrium algorithm, while still producing identical results. More specifically, this improved the determination of stable phases at equilibrium, which Reaktoro determines during the calculation (not at the end with individual stability tests for currently unstable phases).
```

### Loading embedded NASA database files

The following are equivalent ways to load the same embedded NASA database file:

```python3
db = NasaDatabase("nasa-cea")
db = NasaDatabase.withName("nasa-cea")
```

### Loading locally available NASA database files

The following are equivalent ways to load the same NASA database file from your
computer:

```{tab} Linux and macOS
~~~
db = NasaDatabase()
db.load("/home/username/databases/nasa-cea.yaml")

db = NasaDatabase.fromFile("/home/username/databases/nasa-cea.yaml")
~~~
```
```{tab} Windows
~~~
db = NasaDatabase()
db.load("C:\\Users\\Username\\databases\\nasa-cea.yaml")

db = NasaDatabase.fromFile("C:\\Users\\Username\\databases\\nasa-cea.yaml")
~~~
```
