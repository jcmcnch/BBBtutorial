# Preamble:

Now more than ever, scientific reproducibility depends on careful
control of software environments. To deal with the deluge of new
sequencing data, new bioinformatic workflows have been developed that
are no longer simple algorithms/scripts (e.g. BLAST) but rather a
complex "ecosystem" of tools that (should) work together seamlessly.
Examples include pipelines such as qiime2 and phyloFlash. However,
creating such a seamless environment is not a simple task. In the days
before conda, manually installing qiime1 could be painful and very
inaccessible to all but experts. Fortunately, the tools for installing
software have progressed greatly since these "bad old days".

The conda package management system is one incredibly powerful tool for
dealing with these challenges. It empowers a user familiar with terminal
basics to create precise software environments that can be easily shared
with others, improving the reproducibility of bioinformatic analyses. It
also keeps incompatible software isolated from one another so that
different package dependencies do not conflict (e.g. one package may
require python3 while another might require python2). Although conda is
written in python, it is language-agnostic, meaning you could just as
easily use it to set up a software environment for a R or perl workflow
so long as the package you are looking for is available online at
anaconda cloud.

The purpose of this tutorial is to share some tips and tricks I've
learned over the past few years to effectively deal with conda
environments in the context of scientific reproducibility. We'll go over
some basic principles, and then work together to make sure everyone is
able to install qiime2 along with some "addons" that might come in
handy. If time permits, we can also go over some tips for constructing a
simple scientific workflow using these same tools. While the material we
go over is simple, it should be sufficient to ensure basic standards of
bioinformatic reproducibility. This will not only make your life easier
(we tend to forget analyses we did more than a month ago), but will make
your workflow more accessible/readable to others for collaborative
projects and during peer review. It also can provide the foundation to
use more advanced workflow management tools like snakemake. While they
might seem daunting at first, I guarantee you that if you spend the time
to learn these tools now it will save you time in the long run and help
you better explore the scientific questions you're interested in. If
there's interest, we could consider expanding this material out into a
discussion group like we had last semester for statistics.

# Learning objectives:

## By the end of this tutorial, you should:

-   Understand the rationale behind using conda, and the advantages of
    using mamba as "drop-in" replacement for conda

-   Be able to:

    -   Set up your own conda environments using either:

        -   A "yaml" file provided by someone else (e.g. qiime2)
        -   Instructions from Anaconda Cloud (e.g. bbmap, blast,
            phyloFlash)
        -   Source code from github (e.g. dbOTU plugin for qiime, my
            minor "hack" of vsearch)

    -   Export your conda environment to a yaml file

    -   Construct a simple, minimally reproducible workflow using bash
        scripts with yaml files to document software dependencies

# Requirements to participate:

1.  A miniconda environment (python3 ideally) installed on either your
    local machine or kraken.
2.  If you're using kraken, make sure you're comfortable with
    command-line text editors (e.g. vim, nano) and the use of either
    screen or tmux for keeping your sessions persistent.
3.  If you're using kraken, it would probably also be useful to have
    access to jupyter hub to transfer files back and forth from the
    server to your computer. You can check to make sure you have access
    by going to kraken.usc.edu in your browser and making sure you can
    log in. Credentials should be the same as your login/pass for ssh.

\*\*\*If you have any issues with these prerequisites and google can't
help, please seek help ASAP over slack/email\*\*\*
