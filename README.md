# Installing and setting up Salome for Parametric CAD

In this guide we will install and setup Salome for our OpenFOAM workflow.

## Step 1: Download Salome
**1a)** First, install [Salome](https://www.salome-platform.org/?page_id=2430). Choose the latest version and **Linux Universal** and download (this may take some time).

## Step 2: Move Salome to the WSL file system
To access the Salome installation through WSL, we need to move the downloaded files to WSL.

**2a)** Open a WSL terminal and move the downloaded file to our WSL file system. Assuming the file is located in Windows at ``C:\Users\jakob\Downloads\SALOME-9.14.0.tar.gz``, then we write the following:

```
mv /mnt/c/Users/jakob/Downloads/SALOME-9.14.0.tar.gz $HOME
```

**2b)** Now unpack the file (this may take some time):
```
tar -xf $HOME/SALOME-9.14.0.tar.gz -C $HOME
```

**2c)** We should now have a unpacked Salome installation in our home folder. Verify by:

```
cd && ls
```

![](unpacked-salome.jpg)

## Step 3: Verify installation

**3a)**
First, let's verify that we can open the Salome GUI from within WSL. In the WSL terminal type:

```
$HOME/SALOME-9.14.0/salome
```
Which should open the GUI. Close it.

**3b)**
Now, let's test Python scripting capabilities. Download a sample file:

```
wget https://raw.githubusercontent.com/jakobhaervig/openfoam-salome/main/test_dumpfile.py -O - >> $HOME/test_dumpfile.py
```

Now generate a stl file from the ``test_dumpfile.py`` we just downloaded:

```
$HOME/SALOME-9.14.0/salome -t $HOME/test_dumpfile.py
```

Which should generate a .stl file for a dummy geometry in your current folder. To check if we have a new file ``inlet_patch.stl``, run:

```
ls
```

## Step 4: Next, we will install Python and some useful packages
First, we will install Miniconda, which is a lightweight apporach to manage our Python installation.

**4a)**
Copy/paste the following into a WSL terminal:

```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
```

**4b)**
Then, initialise your conda environment:
```bash
~/miniconda3/bin/conda init bash
```

**4c)**
Now, re-open a WSL terminal and create a virtual environment called ``of`` with pip and Python installed:
```bash
conda create -n of pip python
```

**4d)**
Activate the virtual environment:
```bash
conda activate of
```

**4e)**
Install a couple of Python packages needed for our optimisation loop:
```bash
pip install Platypus-Opt numpy matplotlib
```

**4f)**
Everytime we want to use the environment we may not activate/deactivate it with:
```bash
conda activate of
```

and

```bash
conda deactivate of
```