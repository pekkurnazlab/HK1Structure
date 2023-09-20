# HK1 Structure Methods

## Software
### VMD Installation Guide

Follow these steps to install VMD:

1. **Obtain VMD**: You can get the VMD source and binary distributions from the official [VMD website].
2. **Choose the Correct Version**: Make sure to choose the version that matches your operating system and hardware configuration.
3. **Install Pre-Compiled Version**: If you're installing a pre-compiled version of VMD, follow the instructions provided with the distribution.
4. **Customize VMD Startup**: You can customize your VMD startup using the .vmdrc and vmd.rc files.
5. **Troubleshoot**: If you encounter any issues during installation, refer to the troubleshooting section in the installation guide.

For more detailed instructions, please refer to the official [VMD Installation Guide] provided by the University of Illinois Urbana-Champaign. If you're interested in compiling your own version of VMD, you can find information on that in the installation guide as well.

### NAMD Installation Guide

Follow these steps to install NAMD:

1. **Download NAMD Source Code**: You can get the NAMD source code from the official [NAMD website](https://www.ks.uiuc.edu/Research/namd/2.14/ug/).
2. **Extract the Package and Charm++**: Use the following commands to extract the package and Charm++:
    ```bash
    tar xf NAMD_2.11_Source.tar.gz 
    cd NAMD_2.11_Source 
    tar xf charm-6.7.0.tar
    ```
3. **Download and Install TCL and FFTW**: Please see the release notes for the appropriate version of these libraries[^1^][3].
4. **Build Charm++**: Follow the instructions provided with the distribution to build Charm++[^1^][3].
5. **Troubleshoot**: If you encounter any issues during installation, refer to the troubleshooting section in the installation guide[^2^][1].

For more detailed instructions, please refer to the official [NAMD User's Guide](https://www.ks.uiuc.edu/Research/namd/2.14/ug/) provided by the University of Illinois Urbana-Champaign.

