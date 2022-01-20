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
float(state.speciesAmount("CO2"))  # convert autodiff.real to float!
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
state.speciesAmounts().asarray()  # convert from autodiff.ArrayXreal1stConstRef to numpy.array with float values
~~~
