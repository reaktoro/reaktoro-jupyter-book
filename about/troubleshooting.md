# Troubleshooting

We list below the most common issues our users find and indicate which action
should be taken to potentially resolving them.

1. **Why am I getting this error: ModuleNotFoundError: No module named 'reaktoro'**?

    The entire error message may be something like this:

    ~~~
    Traceback (most recent call last):
        File "<string>", line 1, in <module>
    ModuleNotFoundError: No module named 'reaktoro'
    ~~~

    This error is happening because the Python package `reaktoro` cannot be found,
    most likely because the environment variable `PYTHONPATH` has not been set
    correctly. Ensure the path where `reaktoro` is located is specified in
    `PYTHONPATH`.


