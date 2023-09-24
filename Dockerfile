FROM dapize/rehlds:latest

RUN apt update && apt install -y wget curl unzip

# Installing AMX Mod X
RUN AMX_WEB="https://www.amxmodx.org/amxxdrop/1.9"\
  && AMX_LATEST=$(curl -L $AMX_WEB/amxmodx-latest-base-linux)\
  && AMX_ZIP="$AMX_WEB/$AMX_LATEST"\
  && wget -c $AMX_ZIP -P /tmp\
  && tar -xvf /tmp/$AMX_LATEST -C /opt/hlds/valve/\
  && rm -rf /tmp/$AMX_LATEST

# Installing Metamod-r
RUN curl -s https://api.github.com/repos/theAsmodai/metamod-r/releases/latest | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \" | wget -qi - -P /tmp\
  && unzip /tmp/metamod-bin*.zip addons/* -d /opt/hlds/valve/
RUN echo 'game "Half-Life"\n\
  startmap "c0a0"\n\
  trainmap "t0a0"\n\
  mpentity "info_player_deathmatch"\n\
  gamedll "dlls\hl.dll"\n\
  gamedll_linux "addons/metamod/metamod_i386.so"\n\
  gamedll_osx "dlls/hl.dylib"\n\
  secure "1"\n\
  type "singleplayer_only"' > /opt/hlds/valve/liblist.gam

# Adding AMX Mod X to Metamod config
RUN echo 'linux addons/amxmodx/dlls/amxmodx_mm_i386.so' > /opt/hlds/valve/addons/metamod/plugins.ini
