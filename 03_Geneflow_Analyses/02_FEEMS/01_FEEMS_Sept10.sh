Extract command lines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/FEEMS/finaldataset
screen
srun -N 1 -c 1 --mem-per-cpu=64g -t 1-0:0:0 --pty bash -i
conda activate /projects/mjolnir1/apps/conda/ipython-8.7.0
ipython
import sys
sys.path.append("/projects/mjolnir1/apps/modules/")
import feems
# base
import numpy as np
import pkg_resources
from sklearn.impute import SimpleImputer #no module sklearn, had to do  pip install scikit-learn
#pip install pandas_plink
from pandas_plink import read_plink #no read_plink, had to pip install pandas_plink
#pip install statsmodels
import statsmodels.api as sm
#pip install matplotlib
import matplotlib.pyplot as plt
#pip install cartopy
import cartopy.crs as ccrs



 






conda activate /projects/mjolnir1/people/gnr216/a-software/conda_env/feems

conda activate /projects/mjolnir1/apps/conda/feems-1.0.0
/projects/mjolnir1/apps/modules/feems/1.0.0
screen
srun -N 1 -c 1 --mem-per-cpu=64g -t 1-0:0:0 --pty bash -i
conda activate /projects/mjolnir1/apps/conda/ipython-8.7.0

ipython
import feems #not work
quit
conda activate /projects/mjolnir1/people/gnr216/a-software/conda_env/feems
conda activate /projects/mjolnir1/apps/conda/ipython-8.7.0
ipython
import feems 

import sys
sys.path.append("/projects/mjolnir1/apps/modules/")

### ERROR FOR FEEMS 
AttributeError: module 'numpy' has no attribute 'int'.
`np.int` was a deprecated alias for the builtin `int`. To avoid this error in existing code, use `int` by itself. Doing this will not modify any behavior and is safe. 
When replacing `np.int`, you may wish to use e.g. `np.int64` or `np.int32` to specify the precision. If you wish to review your current use, check the release note link for additional information.
The aliases was originally deprecated in NumPy 1.20; for more details and guidance see the original release note at:
    https://numpy.org/devdocs/release/1.20.0-notes.html#deprecations
################ cant get past this step



# base
import numpy as np
import pkg_resources
from sklearn.impute import SimpleImputer
from pandas_plink import read_plink

# viz
import matplotlib.pyplot as plt
import cartopy.crs as ccrs

# feems
from feems.utils import prepare_graph_inputs
from feems import SpatialGraph, Viz

# change matplotlib fonts
plt.rcParams["font.family"] = "Arial"
plt.rcParams["font.sans-serif"] = "Arial"

#xin's script
import matplotlib
matplotlib.use('Agg')
import numpy as np
import pkg_resources
from sklearn.impute import SimpleImputer
from pandas_plink import read_plink
import statsmodels.api as sm
import matplotlib.pyplot as plt
from matplotlib import gridspec
import cartopy.crs as ccrs
from feems.utils import prepare_graph_inputs
from feems import SpatialGraph, Viz
from feems.cross_validation import run_cv

