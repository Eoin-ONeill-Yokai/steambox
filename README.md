## Steambox

A pre-configured fedora toolbox with steam ready to install on first boot. Technically, steam need to be run once before installation, which will happen as a "system update."

This is only intended for use on Fedora `immutable` systems. For more details on fedora's immutable operating systems, please visit [the following link](https://fedoraproject.org/atomic-desktops/).

### How to Use

In order to use this, you'll need a working installation of [distrobox](https://distrobox.it/) and ideally a properly configured set of graphics drivers on that system. 

You should create your distrobox with the following command. **Note:** For NVidia graphics card users, you will need to pass the `--nvidia` argument when calling `distrobox create` (this is necessary to pass the graphics drivers into the guest system).

```
distrobox create --image ghcr.io/eoin-oneill-yokai/steambox:latest --init-hooks "install -o 1000 -g 1000 -d /tmp/.X11-steam-alt; mount --bind /tmp/.X11-steam-alt /tmp/.X11-unix" --pull always --home ~/.distrobox/steambox steambox 
```

While it's not strictly necessary to call create with the `--home` flag, isolating the home directory of the distrobox steam prevents potential mixups with other versions of steam installed on the system. 

 ### Known (Steam) Problems

 - For DS5 controllers, occasionally the controller will not be detected/registered with steam input when plugged in while steam is running. Rebooting steam should resolve the issue.
 - On some systems, you might not have the correct firewall settings enabled for *Game File Transfer over Local Network*. On fedora systems, for example, make sure you configure your firewall so that all of steam's game transfer ports are supported (both the data broadcast and discovery ports.)
