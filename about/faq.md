# FAQ

## What is Reaktoro?

Reaktoro is a project that aims at the long-term to provide all you need for
simulating chemical processes. At the moment, it is available via C++ and
Python. The library is entirely implemented in C++ for performance reasons.
Python bindings are generated on top of the C++ interface for a more convenient
usage. Check the tutorials to see what you can currently do with it.

## Why is Reaktoro open-source?

Because we believe you should know what goes inside it and help us with
further development and bug fixes!

## How can I help with the Reaktoro Project?

In multiple ways, from reporting bugs, to suggesting improvements, writing
tutorials, helping with testing, development of algorithms, anything.

Please [get in touch here](mailto:allan.leal@erdw.ethz.ch) if you are
interested in helping with the project.

## How do I cite Reaktoro?

Have a look at these [instructions](citing.md).

## Where can I request help about Reaktoro?

You can always contact us via [Gitter](https://gitter.im/reaktoro/community).

## An example in the website is not working. What should I do?

It is possible that the example contains a recently developed feature or
modeling capability and you are using an older version of Reaktoro. Try updating
the `reaktoro` package in the conda environment it is installed, using either
Anaconda Navigator or the following conda command:

~~~bash
conda activate rkt
conda update --all
~~~

Assuming above you named `rkt` as the conda environment containing `reaktoro`.
For installation instructions using conda, please [check
here](installation/installation-using-conda).

## I'm not a programmer. I find it challenging to use Reaktoro. What can I do?

We have plans to build a web app for Reaktoro, with a modern user interface,
which is more attractive to non-programmers. If you are reading this and happen
to have skills in developing graphical user interfaces or want to finantially
support this project, [please get in touch](mailto:allan.leal@erdw.ethz.ch).
