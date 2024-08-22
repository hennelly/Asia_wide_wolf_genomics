cd /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/FEEMS/finaldataset

conda activate /projects/mjolnir1/apps/conda/ipython-8.7.0
conda activate /projects/mjolnir1/people/gnr216/a-software/conda_env/feems
screen
srun -N 1 -c 1 --mem-per-cpu=64g -t 1-0:0:0 --pty bash -i/

ipython
import feems

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

