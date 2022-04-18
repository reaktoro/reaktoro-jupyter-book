# Installation in Google Colab

You can run Reaktoro in [Google Colab](https://colab.research.google.com/). Create a new Jupyter notebook and paste this in the first cell:

~~~
!pip install -q condacolab
import condacolab
condacolab.install()
!conda config --add channels conda-forge
!conda install -y reaktoro
~~~

Execute this first cell, and you should then be ready to run Reaktoro Jupyter scripts afterwards. Below is a screenshot showing the expected result of this guide.

![](../images/reaktoro-in-google-colab.png)

# Please help me installing Reaktoro!

If you had problems with the instructions above, please contact us via
[Gitter](https://gitter.im/reaktoro/community).
