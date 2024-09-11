Extract command lines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/FEEMS/finaldataset
screen
srun -N 1 -c 1 --mem-per-cpu=64g -t 1-0:0:0 --pty bash -i

FINAL


#conda create -n=feems_e python=3.8.3 
conda activate feems_e
ipython

pip install ipython #ipython

!conda install scikit-sparse=0.4.4  #install
!conda install cartopy=0.18.0


import numpy as np
import pkg_resources
from sklearn.impute import SimpleImputer 
from pandas_plink import read_plink
import statsmodels.api as sm
import matplotlib.pyplot as plt
import cartopy.crs as ccrs

But when I get to importing specific program within feems, I can't seem to get it to work. For example: 
from feems.utils import prepare_graph_inputs
from feems import SpatialGraph, Viz
from feems.cross_validation import run_cv



/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/FEEMS/finaldataset/Autosomes_onlyEurasianwolves_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_LDprune.coord

scp -r crq857@mjolnirgate.unicph.domain:/projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/FEEMS/finaldataset/Autosomes_onlyEurasianwolves_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9_LDprune.coord ~/Desktop








module load geos/

conda install numpy==1.22.3 scipy==1.5.0 scikit-learn==0.23.1
conda install matplotlib==3.2.2 pyproj==2.6.1.post1 networkx==2.4.0 
conda install shapely==1.7.1 
conda install fiona
conda install pytest==5.4.3 pep8==1.7.1 flake8==3.8.3
conda install click==7.1.2 setuptools pandas-plink
conda install msprime==1.0.0 statsmodels==0.12.2 PyYAML==5.4.1
conda install xlrd==2.0.1 
conda install openpyxl==3.0.7
conda install suitesparse=5.7.2
conda install scikit-sparse=0.4.4 
conda install cartopy=0.18.0


pip install git+https://github.com/NovembreLab/feems into /home/crq857/feems2/feems




Extract command lines
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd /projects/mjolnir1/people/crq857/Chapter2/03_GeneflowAnalyses/FEEMS/finaldataset
screen
srun -N 1 -c 1 --mem-per-cpu=64g -t 1-0:0:0 --pty bash -i
conda activate /projects/mjolnir1/apps/conda/ipython-8.7.0
ipython
import sys
sys.path.append("/home/crq857/mambaforge/envs/feems_e/")
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
