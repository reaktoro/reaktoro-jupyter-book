# Troubleshooting

Below are the most common issues our users encounter, for which we indicate the necessary action to resolve them potentially. If you cannot find your problem below or the solution provided is not working for you, don't hesitate to get in touch with us at {{Gitter}}.

## ModuleNotFoundError: No module named 'reaktoro'

The entire error message may be something like this:

~~~
Traceback (most recent call last):
    File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'reaktoro'
~~~

This error is happening because the Python package `reaktoro` cannot be found, most likely because the environment variable `PYTHONPATH` has not been set correctly. Ensure the path where `reaktoro` is located is specified in `PYTHONPATH`.

## Expecting a float value but got autodiff.real instead

Reaktoro relies on number types defined in the {{autodiff}} library to enable automatic differentiation. It is because of {{autodiff}} that Reaktoro can have improved numerical algorithms and also compute derivatives of chemical/thermodynamic properties with respect to temperature, pressure, species amounts, and even the parameters used in the models.

You can use the `float` function to convert an `autodiff.real` number into a Python `float` number type. Below is an example using the method `ChemicalProps.activity`:

~~~python
# convert autodiff.real to float!
float(state.speciesAmount("CO2"))
~~~

## Expecting a numpy.array but got autodiff.ArrayXreal or autodiff.VectorXreal instead

This is a similar issue to the previous one. You may encounter the following array/vector types while using Reaktoro:

* `autodiff.ArrayXreal1st`
* `autodiff.ArrayXreal1stConstRef`
* `autodiff.VectorXreal1st`
* `autodiff.VectorXreal1stConstRef`

These types are a combination of array/vector types from the C++ library [Eigen](https://eigen.tuxfamily.org/) with the number types from the {{autodiff}} library, both C++ libraries.

You can use the method `asarray` in these array/vector types to convert them to a `numpy.array`:

~~~python
# convert from autodiff.ArrayXreal1stConstRef to numpy.array with float values
state.speciesAmounts().asarray()
~~~

## SIGFPE signals and fatal arithmetic errors

Users that couple Reaktoro's C++ library and [OpenFOAM](https://www.openfoam.com/) for reactive transport simulations often report problems related to [SIGFPE signals](https://en.cppreference.com/w/cpp/numeric/fenv) that are thrown following arithmetic exceptions (e.g., division by zero, logarithm of zero, etc.). Usually these errors happen in Reaktoro because some species in the chemical state have zero values (always try to set a very small amount instead of zero!), and during a chemical equilibrium or kinetic calculation the logarithm of zero may be evaluated. These arithmetic errors, however, do not compromise the calculation results and are ignored in Reaktoro when they occur.

So you can safely disable these SIGFPE signals. Below is a demonstration using [`std::feclearexcept`](https://en.cppreference.com/w/cpp/numeric/fenv/feclearexcept):

~~~c++
#include <cfenv>

#include <Reaktoro/Reaktoro.hpp>
using namespace Reaktoro;

int main()
{
    std::feclearexcept(FE_ALL_EXCEPT); // disable all SIGFPE exceptions

    PhreeqcDatabase db("phreeqc.dat");

    AqueousPhase aqueousphase(speciate("H O C Na Cl"));
    aqueousphase.setActivityModel(ActivityModelPitzerHMW());

    GaseousPhase gaseousphase("CO2(g)");
    gaseousphase.setActivityModel(ActivityModelPengRobinson());

    ChemicalSystem system(db, aqueousphase, gaseousphase);

    ChemicalState state(system);
    state.setTemperature(25.0, "celsius");
    state.setPressure(1.0, "bar");
    state.set("H2O"   , 1.00, "kg");
    state.set("Na+"   , 4.00, "mol");
    state.set("Cl-"   , 4.00, "mol");
    state.set("CO2(g)", 10.0, "mol");

    EquilibriumSolver solver(system);
    solver.solve(state);

    state.output("state.txt");

    return 0;
}
~~~
