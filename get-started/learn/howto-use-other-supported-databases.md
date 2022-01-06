# How to load other supported thermodynamic databases

This guide demonstrates how all currently supported thermodynamic databases in
Reaktoro can be instantiated.

## PHREEQC Databases

[PHREEQC](https://www.usgs.gov/software/phreeqc-version-3) is a scientific
software mainly used for geochemical modeling. When using thermodynamic
databases in PHREEQC format in Reaktoro, you can opt for using either a
database file available in your computer or one of the following embedded
database files in Reaktoro (these exist for convenience):

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

The following are equivalent ways to load embedded database files:

```python3
import reaktoro as rkt

db = rkt.PhreeqcDatabase("phreeqc.dat")
db = rkt.PhreeqcDatabase.withName("phreeqc.dat")
```

### Loading locally available PHREEQC database files

The following are equivalent ways to load the same PHREEQC database file from
your computer:

```{tab} Linux and macOS
~~~
import reaktoro as rkt

db = rkt.PhreeqcDatabase()
db.load("/home/username/databases/phreeqc.dat")

db = rkt.PhreeqcDatabase.fromFile("/home/username/databases/phreeqc.dat")
~~~
```
```{tab} Windows
~~~
import reaktoro as rkt

db = rkt.PhreeqcDatabase()
db.load("C:\\Users\\Username\\databases\\phreeqc.dat")

db = rkt.PhreeqcDatabase.fromFile("C:\\Users\\Username\\databases\\phreeqc.dat")
~~~
```

## ThermoFun Databases

ThermoFun is an open-source C++/Python library for the computation of
thermodynamic properties of species and reactions. It supports many databases
for a wide variety of applications. The following are the currently supported
database files:

* [aq17-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/aq17-thermofun.json)
* [cemdata18-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/cemdata18-thermofun.json)
* [heracles-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/heracles-thermofun.json)
* [mines16-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/mines16-thermofun.json)
* [psinagra-12-07-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/psinagra-12-07-thermofun.json)
* [slop98-organic-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/slop98-organic-thermofun.json)
* [slop98-thermofun.json](https://github.com/reaktoro/reaktoro/tree/main/databases/thermofun/slop98-thermofun.json)

### Loading embedded ThermoFun database files

ThermoFun databases are also available in embedded form in Reaktoro for
convenience. You need to use one of the following database names:

* `aq17`
* `cemdata18`
* `heracles`
* `mines16`
* `psinagra-12-07`
* `slop98-organic`
* `slop98`

The following are equivalent ways to load the same embedded ThermoFun database file:

```python3
import reaktoro as rkt

db = rkt.ThermoFunDatabase("cemdata18")
db = rkt.ThermoFunDatabase.withName("cemdata18")
```

### Loading locally available ThermoFun database files

The following are equivalent ways to load the same ThermoFun database file from
your computer:

```{tab} Linux and macOS
~~~
import reaktoro as rkt

db = rkt.ThermoFunDatabase()
db.load("/home/username/databases/mines16-thermofun.json")

db = rkt.ThermoFunDatabase.fromFile("/home/username/databases/mines16-thermofun.json")
~~~
```
```{tab} Windows
~~~
import reaktoro as rkt

db = rkt.ThermoFunDatabase()
db.load("C:\\Users\\Username\\databases\\mines16-thermofun.json")

db = rkt.ThermoFunDatabase.fromFile("C:\\Users\\Username\\databases\\mines16-thermofun.json")
~~~
```

## SUPCRT and SUPCRTBL Databases

SUPCRT and SUPCRTBL databases contain thousands of chemical species (aqueous
species, gases, minerals) and are commonly used for biogeochemical modeling
applications. These thermodynamic databases contain parameters for equations of
state to permit the computation of standard molal thermodynamic properties of
minerals, gases, aqueous species, and reactions from 1 to 5000 bar and 0 to
1000°C. The following references (and references therein) give more in-depth
details about these equations and the full potential of these databases.

* J.W. Johnson, E.H. Oelkers, H.C. Helgeson. *SUPCRT92: a software package for
  calculating the standard molal thermodynamic properties of minerals, gases,
  aqueous species, and reactions from 1 to 5000 bar and 0 to 1000°C*. Computers
  & Geosciences, 18 (1992), pp. 899-947.
  https://doi.org/10.1016/0098-3004(92)90029-Q
* K. Zimmer, Y. Zhang, P. Lu, Y. Chen, G. Zhang, M. Dalkilic, C. Zhu. *SUPCRTBL:
  a revised and extended thermodynamic dataset and software package of
  SUPCRT92*. Computers & Geosciences, 90 (2016), pp. 97-111.
  https://doi.org/10.1016/j.cageo.2016.02.013

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
import reaktoro as rkt

db = rkt.SupcrtDatabase("supcrtbl")
db = rkt.SupcrtDatabase.withName("supcrtbl")
```

### Loading locally available SUPCRT and SUPCRTBL database files

The following are equivalent ways to load the same SUPCRT or SUPCRTBL database file from
your computer:

```{tab} Linux and macOS
~~~
import reaktoro as rkt

db = rkt.SupcrtDatabase()
db.load("/home/username/databases/supcrt98.yaml")

db = rkt.SupcrtDatabase.fromFile("/home/username/databases/supcrt98.yaml")
~~~
```
```{tab} Windows
~~~
import reaktoro as rkt

db = rkt.SupcrtDatabase()
db.load("C:\\Users\\Username\\databases\\supcrt98.yaml")

db = rkt.SupcrtDatabase.fromFile("C:\\Users\\Username\\databases\\supcrt98.yaml")
~~~
```

## NASA Databases

Reaktoro also supports the thermochemical database of NASA-CEA, which contains
coefficients for NASA-CEA polynomials used to compute the standard
thermodynamic properties of gases and condensed phases. The NASA-CEA database
is commonly used for modeling combustion processes in a wide variety of
applications such as combustion of rocket propellants to the detonation of
explosives.

The NASA-CEA database supported in Reaktoro is in Reaktoro's database format
using [YAML](https://yaml.org/):


* [nasa-cea.yaml](https://github.com/reaktoro/reaktoro/tree/main/databases/reaktoro/nasa-cea.yaml).

This file was constructed by parsing the [original NASA-CEA thermochemical
database
file](https://github.com/reaktoro/reaktoro/tree/main/utilities/nasa-parser/nasa-cea.dat)
and converting it to Reaktoro's YAML format. The data is organized differently
for improved conformance with how Reaktoro's chemical equilibrium algorithm
works.

### Loading embedded NASA database files

The following are equivalent ways to load the same embedded NASA database file:

```python3
import reaktoro as rkt

db = rkt.NasaDatabase("nasa-cea")
db = rkt.NasaDatabase.withName("nasa-cea")
```

### Loading locally available NASA database files

The following are equivalent ways to load the same NASA database file from your
computer:

```{tab} Linux and macOS
~~~
import reaktoro as rkt

db = rkt.NasaDatabase()
db.load("/home/username/databases/nasa-cea.yaml")

db = rkt.NasaDatabase.fromFile("/home/username/databases/nasa-cea.yaml")
~~~
```
```{tab} Windows
~~~
import reaktoro as rkt

db = rkt.NasaDatabase()
db.load("C:\\Users\\Username\\databases\\nasa-cea.yaml")

db = rkt.NasaDatabase.fromFile("C:\\Users\\Username\\databases\\nasa-cea.yaml")
~~~
```
