source $CONDA_DIR/bin/activate $RADARENV
python -c "import _pyhl"                    # hlhdf
python -c "import rave"                     # rave
python -c "import beamb_quality_plugin"     # beamb
python -c "import ropo_realtime"            # bropo
python -c "import googlemap_pgf_plugin"     # GoogleMapsPlugin
python -c "import baltrad_wrwp_pgf_plugin"  # baltrad_wrwp
