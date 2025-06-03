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

## Step 3: Set alias for Salome
Open a Ubuntu (WSL) terminal (Ubuntu App) and enter the following:

**3a)** Copy/paste the following into the terminal to add a function to your ``.bash_aliases`` file:

```
wget https://raw.githubusercontent.com/jakobhaervig/openfoam-salome/main/.bash_aliases -O - >> $HOME/.bash_aliases
```
**3b)** Next, source your ``.bashrc`` file (or reopen the terminal):
```
source $HOME/.bashrc
```

The new function ``salome_setup`` added to our ``.bash_aliases`` will automatically for a SALOME folder and create an alias to the ``salome`` file within that.

## Step 4: Verify installation

**4a)**
Close the old terminal and open a new one. First, let's verify that we can open the Salome GUI from within WSL. In the WSL terminal type:

```
salome_setup
```

which should set the correct alias.

**4b)**
Now, let's test Python scripting capabilities. Download a sample file:

```
wget https://raw.githubusercontent.com/jakobhaervig/openfoam-salome/main/test_dumpfile.py -O - >> $HOME/test_dumpfile.py
```

Now generate a stl file from the ``test_dumpfile.py`` we just downloaded:

```
salome -t $HOME/test_dumpfile.py
```

Which should generate a .stl file for a dummy geometry. To check if we have a new file ``inlet_patch.stl``, run:

```
ls
```